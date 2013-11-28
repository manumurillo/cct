using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data.SqlClient;
using System.Configuration;
using System.Diagnostics;
using System.Net.Mail;
using System.Net;

namespace WebSite
{
    public partial class cambiarContrasena : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["e"] != null && Request.QueryString["c"] != null)
            {
                cveRecuperacion.Text = Request.QueryString["c"].ToString();
                login_form.Visible = true;
                error.Visible = false;
                respuesta.Visible = false;
            }
            else
            {
                login_form.Visible = false;
                error.Visible = true;
                respuesta.Visible = false;            
            }
        }

        protected void submit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string usr_email = Request.QueryString["e"];
                string usr_cve = cveRecuperacion.Text;
                string usr_cve_enc = encript(usr_cve);
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["CCT2013ConnectionString"].ToString());
                SqlCommand cmd = new SqlCommand("SELECT count(*) FROM registro_usuario WHERE email LIKE '" + usr_email + "' AND contrasena LIKE '"+usr_cve_enc+"'", conn);
                conn.Open();
                int num = Convert.ToInt32(cmd.ExecuteScalar());
                Debug.WriteLine("Resultado de consulta: " + num);
                if (num > 0)
                {
                    string usr_contrasena = contrasena.Text;
                    string pass_encr = encript(usr_contrasena);

                    Debug.WriteLine("Password nueva: " + usr_contrasena + "\n Password encriptada: " + pass_encr);

                    SqlCommand cmd2 = new SqlCommand("UPDATE registro_usuario set contrasena = '" + pass_encr + "' WHERE email LIKE '" + usr_email + "'", conn);
                    int res = cmd2.ExecuteNonQuery();
                    if (res > 0)
                    {
                        if (enviarEmail(usr_contrasena, pass_encr, usr_email))
                        {
                            respuesta.Visible = true;
                            login_form.Visible = false;
                            error.Visible = false;
                        }
                        else
                        {
                            errorRecovery.Text = "'Su contraseña fue actualizada con éxito, pero no se pudo enviar el e-mail.";
                        }
                    }
                    else
                        errorRecovery.Text = "No se ha podido actualizar la contraseña, intente de nuevo.";

                }
                else
                {
                    errorRecovery.Text = "El email proporcinado no está registrado.";
                }
                conn.Close();
                
            }
        }

        public string encript(string password)
        {
            System.Security.Cryptography.MD5 md5;
            md5 = new System.Security.Cryptography.MD5CryptoServiceProvider();
            Byte[] encodedBytes = md5.ComputeHash(ASCIIEncoding.Default.GetBytes(password));
            return System.Text.RegularExpressions.Regex.Replace(BitConverter.ToString(encodedBytes).ToLower(), @"-", "");
        }

        public static Boolean enviarEmail(string pass, string encript, string email)
        {

            string url = "http://www.cal-c-tose.com.mx/Login.aspx";

            string mensaje = "Apreciable usuario:<br/>";
            mensaje += "El proceso de recuperación de su contraseña ha concluido satisfactoriamente.<br/> ";
            mensaje += "Le recomendamos que guarde y recuerde su nueva contraseña de acceso.<br/><br/>";
            mensaje += "Dirección de correo electrónico: <b>" + email + "</b><br/>";
            mensaje += "Nueva contraseña: <b>" + pass + "</b><br/>";
            mensaje += "Si quiere iniciar sesión, haga clic <a href='" + url + "' target='_blank'>aquí</a>. ";
            mensaje += "Si no funciona el enlace, copie y pegue la siguiente dirección en su navegador:<br/>";
            mensaje += "" + url + "<br/><br/>Gracias.<br/><br/>";
            mensaje += "<a href='http://www.cal-c-tose.com.mx'>www.cal-c-tose.com.mx</a>";
            try
            {
                //Configuración del Mensaje
                MailMessage mail = new MailMessage();
                SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com");
                //Especificamos el correo desde el que se enviará el Email y el nombre de la persona que lo envía
                mail.From = new MailAddress("cct.meadjohnson@gmail.com", "No-Reply", Encoding.UTF8);
                //Aquí ponemos el asunto del correo
                mail.Subject = "Datos de identificación Cal-C-Tose";
                //Aquí ponemos el mensaje que incluirá el correo
                mail.Body = mensaje;
                //Especificamos a quien enviaremos el Email, no es necesario que sea Gmail, puede ser cualquier otro proveedor
                mail.To.Add(email);
                //Si queremos enviar archivos adjuntos tenemos que especificar la ruta en donde se encuentran
                //mail.Attachments.Add(new Attachment(@"C:\Documentos\carta.docx"));
                mail.IsBodyHtml = true;
                //Configuracion del SMTP
                SmtpServer.Port = 587; //Puerto que utiliza Gmail para sus servicios
                //Especificamos las credenciales con las que enviaremos el mail
                SmtpServer.UseDefaultCredentials = false;
                SmtpServer.Credentials = new System.Net.NetworkCredential("cct.meadjohnson@gmail.com", "esknozvoijzviodq");
                SmtpServer.EnableSsl = true;
                SmtpServer.Send(mail);
                return true;
            }
            catch (Exception e)
            {
                //Debug.WriteLine("Error en el envío del correo: \n" + e);
                return false;
            }
        }
    }
}
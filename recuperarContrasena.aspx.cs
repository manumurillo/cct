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
    public partial class recuperarContrasena : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            respuesta.Visible = false;
        }

        protected void submit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string usr_email = email.Text;
                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["CCT2013ConnectionString"].ToString());
                SqlCommand cmd = new SqlCommand("SELECT count(*) FROM registro_usuario WHERE email LIKE '" + usr_email + "'", conn);
                conn.Open();
                int num = Convert.ToInt32(cmd.ExecuteScalar());
                Debug.WriteLine("Resultado de consulta: "+num);
                if (num>0)
                {  
                    string pass_new = GenerarPass(15, 20);
                    string pass_encr = encript(pass_new);

                    Debug.WriteLine("Password nueva: " + pass_new + "\n Password encriptada: " + pass_encr);
                    
                    SqlCommand cmd2 = new SqlCommand("UPDATE registro_usuario set contrasena = '" + pass_encr + "' WHERE email LIKE '" + usr_email + "'", conn);
                    int res = cmd2.ExecuteNonQuery();
                    if (res > 0)
                    {
                        if (enviarEmail(pass_new, pass_encr, usr_email))
                        {
                            respuesta.Visible = true;
                            login_form.Visible = false;
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

        public string GenerarPass(int LongPassMin, int LongPassMax)
        {
            char[] ValueAfanumeric = { 'q', 'w', 'e', 'r', 't', 'y', 'u', 'i', 'o', 'p', 'a', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l', 'z', 'x', 'c', 'v', 'b', 'n', 'm', 'Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P', 'A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L', 'Z', 'X', 'C', 'V', 'B', 'N', 'M', '1', '2', '3', '4', '5', '6', '7', '8', '9', '0' };
            Random ram = new Random();
            int LogitudPass = ram.Next(LongPassMin, LongPassMax);
            string Password = String.Empty;

            for (int i = 0; i < LogitudPass; i++)
            {
               Password += ValueAfanumeric[ram.Next(0, ValueAfanumeric.Length)];
            }
            return Password;
        }

        public static Boolean enviarEmail(string pass, string encript, string email)
        {

            string url = "http://www.cal-c-tose.com.mx/cambiarContrasena.aspx?e="+email+"&c="+pass;

            string mensaje = "Apreciable usuario:<br/>";
                   mensaje += "Hemos recibido su solicitud para recuperar la contrase&ntilde;a de acceso al sitio de Cal-C-Tose. Le enviamos ";
                   mensaje += "una clave de acceso temporal para que pueda acceder al link que se le proporcionará y podrá cambiar su contraseña por una nueva.<br/><br/>";
                   mensaje += "Clave: <b>"+pass+"</b><br/>";
                   mensaje += "Haga clic en el siguiente <a href='" + url + "' target='_blank'>link</a> para continuar con el proceso de recuperaci&oacute;n de su contrase&ntilde;a.<br/><br/>";
                   mensaje += "Si no funciona el enlace, copie y pegue la siguiente dirección en su navegador:<br/>";
                   mensaje += "" + url + "<br/><br/>Gracias.<br/><br/>";
                   mensaje += "Si usted no ha hecho esta petición, haga caso omiso de este mensaje.<br/><br/><a href='http://www.cal-c-tose.com.mx'>www.cal-c-tose.com.mx</a>";
            try
            {
                //Configuración del Mensaje
                MailMessage mail = new MailMessage();
                SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com");//smtp-mail.outlook.com //
                //Especificamos el correo desde el que se enviará el Email y el nombre de la persona que lo envía
                mail.From = new MailAddress("cct.meadjohnson@gmail.com", "No-Reply", Encoding.UTF8);
                //Aquí ponemos el asunto del correo
                mail.Subject = "Recuperación de la contraseña - Cal-C-Tose";
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
                //string err = "Error: " + e;
                return false;
            }
        }
    }
}
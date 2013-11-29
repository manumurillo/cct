using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data.SqlClient;
using System.Configuration;
using System.Globalization;

namespace WebSite
{
    public partial class Registro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            for (int d = 1; d <= 31; d++)
            {
                if(d<10)
                    dia.Items.Add("0"+d.ToString());
                else
                    dia.Items.Add(d.ToString());
            }

            int ano = DateTime.Now.Year;
            for (int a = ano; a >= (ano - 100); a--) 
            {
                anio.Items.Add(a.ToString());
            }
            
            if (Session["usr_status"] != null)
            {
                //Response.Redirect("miPerfil.aspx");
                Response.Redirect("Default.aspx");
            }
        }

        protected void submit_Click(object sender, EventArgs e)
        {
            if(Page.IsValid)
            {
                string usr_fnac = (string)(anio.Text) + '/' + (string)(mes.Text) + '/' + (string)(dia.Text);
                if (isDateValid(usr_fnac))
                {
                    errorFNac.Text = "";
                    if (acepto.Checked)
                    {
                        errorAcepto.Text = "";
                        string usr_nombre = (string)(nombre.Text);
                        string usr_apPaterno = (string)(apPaterno.Text);
                        string usr_apMaterno = (string)(apMaterno.Text);
                        string usr_estado = (string)(estado.Text);
                        string usr_email = (string)(email.Text);
                        string usr_pass = encript(contrasena.Text);

                        if (userExist(usr_email))
                        {
                            resultado.Text = "Ya existe una cuenta creada con la dirección de correo: " + usr_email;
                        }
                        else
                        {
                            string insertSQL;
                            insertSQL = "INSERT INTO registro_usuario (nombre, apellidoPaterno, apellidoMaterno, email, estado, contrasena, fechaNacimiento)";
                            insertSQL += "VALUES (@nombre, @apellidoPaterno, @apellidoMaterno, @email, @estado, @contrasena, @fechaNacimiento)";

                            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["CCT2013ConnectionString"].ToString());
                            SqlCommand cmd = new SqlCommand(insertSQL, conn);

                            cmd.Parameters.AddWithValue("@nombre", usr_nombre);
                            cmd.Parameters.AddWithValue("@apellidoPaterno", usr_apPaterno);
                            cmd.Parameters.AddWithValue("@apellidoMaterno", usr_apMaterno);
                            cmd.Parameters.AddWithValue("@email", usr_email);
                            cmd.Parameters.AddWithValue("@estado", usr_estado);
                            cmd.Parameters.AddWithValue("@contrasena", usr_pass);
                            cmd.Parameters.AddWithValue("@fechaNacimiento", usr_fnac);

                            int added = 0;
                            try
                            {
                                conn.Open();
                                added = cmd.ExecuteNonQuery();
                                resultado.Text = "Registro Exitoso";

                                string query2 = "SELECT id, nombre FROM registro_usuario WHERE email LIKE '" + usr_email + "'";
                                SqlCommand cmd2 = new SqlCommand(query2, conn);
                                SqlDataReader reader = cmd2.ExecuteReader();
                                if (reader.Read())
                                {
                                    Session["usr_email"] = usr_email;
                                    Session["usr_id"] = reader["id"];
                                    Session["usr_status"] = "activo";
                                    Session["usr_nombre"] = reader["nombre"];
                                    Response.Redirect("comparteConsejos.aspx");
                                }
                                else
                                {
                                    Response.Redirect("Login.aspx");
                                }
                            }
                            catch (Exception err)
                            {
                                resultado.Text = "Error al registrar sus datos. ";
                                resultado.Text += err.Message;
                            }
                            finally
                            {
                                conn.Close();
                            }
                        }

                    }
                    else
                    {
                        errorAcepto.Text = "Debe aceptar los Términos y Condiciones";
                    }
                }
                else
                {
                    errorFNac.Text = "La fecha no es válida";

                }
            }
        }

        protected string encript(string password)
        {
            System.Security.Cryptography.MD5 md5;
            md5 = new System.Security.Cryptography.MD5CryptoServiceProvider();
            Byte[] encodedBytes = md5.ComputeHash(ASCIIEncoding.Default.GetBytes(password));
            return System.Text.RegularExpressions.Regex.Replace(BitConverter.ToString(encodedBytes).ToLower(), @"-", "");
        }


        protected bool isDateValid(string date)
        {
            DateTime minDate = DateTime.Parse("1910/01/01");
            DateTime maxDate = DateTime.Today;
            DateTime dt;
            if (DateTime.TryParse(date, out dt) && dt <= maxDate && dt >= minDate)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        protected bool userExist(string email)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["CCT2013ConnectionString"].ToString());
            string consulta = "SELECT count(*) FROM registro_usuario WHERE email LIKE '" + email + "' ";
            conn.Open();
            SqlCommand cmd = new SqlCommand(consulta, conn);

            int res = Convert.ToInt32(cmd.ExecuteScalar());
            conn.Close();
            if (res == 1)
                return true;
            else
                return false;
        }

    }
}
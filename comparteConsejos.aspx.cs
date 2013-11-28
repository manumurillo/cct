using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Diagnostics;
using System.Data.SqlClient;
using System.Configuration;
using System.Text;


namespace WebSite
{
    public partial class comparteConsejos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            for (int d = 1; d <= 31; d++)
            {
                if (d < 10)
                    dia.Items.Add("0" + d.ToString());
                else
                    dia.Items.Add(d.ToString());
            }

            int ano = DateTime.Now.Year;
            for (int a = ano; a >= (ano - 100); a--)
            {
                anio.Items.Add(a.ToString());
            }
        }

        protected void compartir_Click(object sender, EventArgs e)
        {
            if (Session["usr_status"] != null)
            {
                int usr_id = Convert.ToInt32(Session["usr_id"]);
                string c_titulo = titulo.Text;
                string c_categoria = categoria.SelectedValue.ToString();
                string c_consejo = consejo.Text;

                //resultado_consejo.Text = ""+c_categoria;

                string insertSQL = "INSERT INTO articulo (titulo, contenido, id_categoria, id_registro_usuario)";
                insertSQL += "VALUES (@titulo, @contenido, @id_categoria, @id_registro_usuario)";

                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["CCT2013ConnectionString"].ToString());
                SqlCommand cmd = new SqlCommand(insertSQL, conn);

                cmd.Parameters.AddWithValue("@titulo", c_titulo);
                cmd.Parameters.AddWithValue("@contenido", c_consejo);
                cmd.Parameters.AddWithValue("@id_categoria", Convert.ToInt16(c_categoria));
                cmd.Parameters.AddWithValue("@id_registro_usuario", usr_id);

                int added = 0;
                try
                {
                    conn.Open();
                    added = cmd.ExecuteNonQuery();
                    resultado_consejo.Text = "Su consejo se ha enviado, gracias.";
                    titulo.Text = categoria.Text = consejo.Text = "";
                }
                catch (Exception err)
                {
                    resultado_consejo.Text = "Ha ocurrido un error. ";
                    resultado_consejo.Text += err.Message;
                }
                finally
                {
                    conn.Close();
                }
                Response.Redirect("comparteConsejos.aspx");
            }
            else
            {
                resultado_consejo.Text = "Revise por favor.";
            }
        }

        protected void login_Click(object sender, EventArgs e)
        {
            //login_form.Visible = true;
            //form_buttons.Visible = false;
        }

        protected void registro_Click(object sender, EventArgs e)
        {

        }

        protected void loginSubmit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string usr_email = email_l.Text;
                string usr_pass = encript(contrasena_l.Text);

                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["CCT2013ConnectionString"].ToString());
                SqlCommand cmd = new SqlCommand("SELECT * FROM registro_usuario WHERE email LIKE '" + usr_email + "' and contrasena LIKE '" + usr_pass + "'", conn);
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    string nombre = reader["nombre"].ToString();
                    string id_user = reader["id"].ToString();
                    string usr_nombre = reader["nombre"].ToString();
                    Session["usr_email"] = email_l;
                    Session["usr_status"] = "activo";
                    Session["usr_id"] = id_user;
                    Session["usr_nombre"] = usr_nombre;
                    Response.Redirect("comparteConsejos.aspx");
                }
                else
                {
                    errorSesion.Text = "Usuario o contraseña incorrectos.";
                }
                reader.Close();
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

        protected void registerSubmit_Click(object sender, EventArgs e)
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


                    //string f_n = usr_fnac.Substring(0, 4)+"/"+usr_fnac.Substring(5, 2)+"/"+usr_fnac.Substring(8, 2);

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

                        string query2 = "SELECT id, nombre FROM registro_usuario WHERE email LIKE '" + usr_email+"'";
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

        protected void eligeCatetoria_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (eligeCatetoria.SelectedValue == "1")
            {
                eligeCatetoria.ClearSelection();
                eligeCatetoria.Items.FindByValue("1").Selected = true;
                SqlDataSource1.SelectCommand = "SELECT * FROM dbo.articulo ART, dbo.registro_usuario USU, dbo.categoria CAT WHERE ART.id_registro_usuario != 14 AND ART.id_registro_usuario = USU.id AND ART.id_categoria = CAT.id AND CAT.id = 1 ORDER BY fecha_creacion DESC";
            }
            else if (eligeCatetoria.SelectedValue == "2")
            {
                eligeCatetoria.ClearSelection();
                eligeCatetoria.Items.FindByValue("2").Selected = true;
                SqlDataSource1.SelectCommand = "SELECT * FROM dbo.articulo ART, dbo.registro_usuario USU, dbo.categoria CAT WHERE ART.id_registro_usuario != 14 AND ART.id_registro_usuario = USU.id AND ART.id_categoria = CAT.id AND CAT.id = 2 ORDER BY fecha_creacion DESC";
            }
            else if (eligeCatetoria.SelectedValue == "3")
            {
                eligeCatetoria.ClearSelection();
                eligeCatetoria.Items.FindByValue("3").Selected = true;
                SqlDataSource1.SelectCommand = "SELECT * FROM dbo.articulo ART, dbo.registro_usuario USU, dbo.categoria CAT WHERE ART.id_registro_usuario != 14 AND ART.id_registro_usuario = USU.id AND ART.id_categoria = CAT.id AND CAT.id = 3 ORDER BY fecha_creacion DESC";
            }
            else if (eligeCatetoria.SelectedValue == "4")
            {
                eligeCatetoria.ClearSelection();
                eligeCatetoria.Items.FindByValue("4").Selected = true;
                SqlDataSource1.SelectCommand = "SELECT * FROM dbo.articulo ART, dbo.registro_usuario USU, dbo.categoria CAT WHERE ART.id_registro_usuario != 14 AND ART.id_registro_usuario = USU.id AND ART.id_categoria = CAT.id AND CAT.id = 4 ORDER BY fecha_creacion DESC";
            }
            else if (eligeCatetoria.SelectedValue == "5")
            {
                eligeCatetoria.ClearSelection();
                eligeCatetoria.Items.FindByValue("5").Selected = true;
                SqlDataSource1.SelectCommand = "SELECT * FROM dbo.articulo ART, dbo.registro_usuario USU, dbo.categoria CAT WHERE ART.id_registro_usuario != 14 AND ART.id_registro_usuario = USU.id AND ART.id_categoria = CAT.id AND CAT.id = 5 ORDER BY fecha_creacion DESC";
            }
            else if (eligeCatetoria.SelectedValue == "6")
            {
                eligeCatetoria.ClearSelection();
                eligeCatetoria.Items.FindByValue("6").Selected = true;
                SqlDataSource1.SelectCommand = "SELECT * FROM dbo.articulo ART, dbo.registro_usuario USU, dbo.categoria CAT WHERE ART.id_registro_usuario != 14 AND ART.id_registro_usuario = USU.id AND ART.id_categoria = CAT.id AND CAT.id = 6 ORDER BY fecha_creacion DESC";
            }
            else if (eligeCatetoria.SelectedValue == "7")
            {
                eligeCatetoria.ClearSelection();
                eligeCatetoria.Items.FindByValue("7").Selected = true;
                SqlDataSource1.SelectCommand = "SELECT * FROM dbo.articulo ART, dbo.registro_usuario USU, dbo.categoria CAT WHERE ART.id_registro_usuario != 14 AND ART.id_registro_usuario = USU.id AND ART.id_categoria = CAT.id ORDER BY fecha_creacion DESC";
            }
            else
                SqlDataSource1.SelectCommand = "SELECT * FROM dbo.articulo ART, dbo.registro_usuario USU, dbo.categoria CAT WHERE ART.id_registro_usuario != 14 AND ART.id_registro_usuario = USU.id AND ART.id_categoria = CAT.id ORDER BY fecha_creacion DESC";
        }

        protected void search_TextChanged(object sender, EventArgs e)
        {
            string s = search.Text;
            SqlDataSource1.SelectCommand = "SELECT * FROM dbo.articulo ART, dbo.registro_usuario USU, dbo.categoria CAT WHERE ART.id_registro_usuario != 14 AND ART.id_registro_usuario = USU.id AND ART.id_categoria = CAT.id AND (ART.contenido LIKE '%" + s + "%' OR ART.titulo LIKE '%" + s + "%') ORDER BY fecha_creacion DESC";
        }
    }
}

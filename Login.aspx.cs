using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data.SqlClient;
using System.Configuration;

namespace WebSite
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usr_status"] != null)
            {
                //Response.Redirect("miPerfil.aspx");
                Response.Redirect("Default.aspx");
            }
        }

        protected void submit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string usr_email = email.Text;
                string usr_pass = encript(contrasena.Text);

                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["CCT2013ConnectionString"].ToString());
                SqlCommand cmd = new SqlCommand("SELECT * FROM registro_usuario WHERE email LIKE '" + usr_email+"' and contrasena LIKE '"+usr_pass+"'", conn);
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    string nombre = reader["nombre"].ToString();
                    string id_user = reader["id"].ToString();
                    string usr_nombre = reader["nombre"].ToString();
                    Session["usr_email"] = email;
                    Session["usr_id"] = id_user;
                    Session["usr_status"] = "activo";
                    Session["usr_nombre"] = usr_nombre;
                    Response.Redirect("comparteConsejos.aspx");
                }
                else {
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
    }
}
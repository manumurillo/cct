﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data.SqlClient;
using System.Configuration;
using System.Diagnostics;
using System.Data;

namespace WebSite
{
    public partial class Default : System.Web.UI.Page
    {
        public bool muestra = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Request.QueryString["tip"] == "1")
            {
                muestra = true;
            }

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
            cargarTip();
        }

        protected void compartir_Click(object sender, EventArgs e)
        {
            if (Session["usr_status"]!=null)
            {
                int usr_id = Convert.ToInt32(Session["usr_id"]); 
                string c_titulo = titulo.Text;
                string c_categoria = categoria.SelectedItem.Value;
                string c_consejo = consejo.Text;

                string insertSQL = "INSERT INTO articulo (titulo, contenido, id_categoria, id_registro_usuario, tipo)";
                insertSQL += "VALUES (@titulo, @contenido, @id_categoria, @id_registro_usuario, @tipo)";

                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["CCT2013ConnectionString"].ToString());
                SqlCommand cmd = new SqlCommand(insertSQL, conn);
                
                cmd.Parameters.AddWithValue("@titulo", c_titulo);
                cmd.Parameters.AddWithValue("@contenido", c_consejo);
                cmd.Parameters.AddWithValue("@id_categoria", c_categoria);
                cmd.Parameters.AddWithValue("@id_registro_usuario", usr_id);
                cmd.Parameters.AddWithValue("@tipo", 2);

                int added = 0;
                try
                {
                    conn.Open();
                    added = cmd.ExecuteNonQuery();
                    titulo.Text = categoria.Text = consejo.Text = "";
                }
                catch (Exception)
                {
                    Mensaje.InnerText = "Ha ocurrido un error. ";
                }
                finally
                {
                    conn.Close();
                }
                Response.Redirect("comparteConsejos.aspx");
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
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
                    Mensaje.InnerText = "Bienvenid@ "+ usr_nombre;
                }
                else
                {
                    Mensaje.InnerText = "Usuario o contraseña incorrectos.";
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

                    if (userExist(usr_email))
                    {
                        Mensaje.InnerText = "La dirección " + usr_email + " ya está registrada.";
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
                            Mensaje.InnerText = "Registro Exitoso";

                            string query2 = "SELECT id, nombre FROM registro_usuario WHERE email LIKE '" + usr_email + "'";
                            SqlCommand cmd2 = new SqlCommand(query2, conn);
                            SqlDataReader reader = cmd2.ExecuteReader();
                            if (reader.Read())
                            {
                                Session["usr_email"] = usr_email;
                                Session["usr_id"] = reader["id"];
                                Session["usr_status"] = "activo";
                                Session["usr_nombre"] = reader["nombre"];
                            }
                            else
                            {
                                Response.Redirect("Login.aspx");
                            }
                        }
                        catch (Exception )
                        {
                            Mensaje.InnerText = "Error al registrar sus datos. ";
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

        public void cargarTip() 
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["CCT2013ConnectionString"].ToString());
            SqlCommand cmd = new SqlCommand("SELECT TOP 1 contenido FROM tip WHERE destacado=1 ORDER BY fecha_creacion DESC", conn);
            conn.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                tip.Text = reader["contenido"].ToString();
            }
            else
            {
                tip.Text = "No hay tip";
            }
            reader.Close();
            conn.Close();
        }

    }
}
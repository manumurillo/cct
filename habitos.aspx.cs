using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Diagnostics;

namespace WebSite
{
    public partial class habitos : System.Web.UI.Page
    {
        public string[] titulos;
        public string[] ids;
        public string[] resumen;
        public string[] thumbs;
        public string[] left;
        public string[] top;
        public string[] contenido;

        public string[] art_titulos;
        public string[] art_contenidos;
        public string[] art_ids;

        public int count;

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        public string defineClass(string valor)
        {
            Debug.WriteLine("------>>"+valor);
            string retorno = "";
            if (valor == null || valor == "")
                retorno = "noLayout";
            else if (valor == "1")
                retorno = "layout_1";
            else if (valor == "2")
                retorno = "layout_2";
            else if (valor == "3")
                retorno = "layout_3";
            else if (valor == "4")
                retorno = "layout_4";
            return retorno;
        }

        public void categorias(int cat)
        {
            int i = 0;
            int j = 0;
            int count = 0;
            int count2 = 0;
            Debug.WriteLine("Iniciales: ----> Count: " + count + "----> Count2: " + count2);
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["CCT2013ConnectionString"].ToString());
            conn.Open();
            string query = "SELECT * FROM dbo.articulo ARTICULO LEFT JOIN dbo.spot SPOT ON ARTICULO.id = SPOT.id_articulo WHERE SPOT.visible = 1 and SPOT.id_categoria = " + cat + " ORDER BY ARTICULO.fecha_creacion ASC";
            SqlCommand cmd = new SqlCommand(query, conn);
            SqlDataReader reader_ = cmd.ExecuteReader();

            if (reader_.HasRows)
            {
                while (reader_.Read())
                {
                    count++;
                }
            }
            reader_.Close();
            SqlDataReader reader = cmd.ExecuteReader();

            Debug.WriteLine("Primer cambio: ----> Count: " + count + "----> Count2: " + count2);

            titulos = new string[count];
            ids = new string[count];
            resumen = new string[count];
            thumbs = new string[count];
            left = new string[count];
            top = new string[count];
            contenido = new string[count];

            while (reader.Read())
            {
                titulos[i] = reader["titulo"].ToString();
                ids[i] = reader["id"].ToString();
                resumen[i] = reader["resumen"].ToString();
                thumbs[i] = reader["thumbnail"].ToString();
                left[i] = reader["p_left"].ToString();
                top[i] = reader["p_top"].ToString();
                contenido[i] = reader["contenido"].ToString();
                i++;
            }
            Debug.WriteLine("Titulo en la posicion 2: " + titulos[2]);
            reader.Close();

            string query2 = "SELECT * FROM dbo.articulo WHERE id_categoria = " + cat + " AND id_registro_usuario = 14 ORDER BY fecha_creacion ASC";
            SqlCommand cmd2 = new SqlCommand(query2, conn);
            SqlDataReader reader2_ = cmd2.ExecuteReader();
            if (reader2_.HasRows)
            {
                while (reader2_.Read())
                {
                    count2++;
                }
            }
            reader2_.Close();
            SqlDataReader reader2 = cmd2.ExecuteReader();

            Debug.WriteLine("Segundo cambio: ----> Count: " + count + "----> Count2: " + count2);
            art_titulos = new string[count2];
            art_ids = new string[count2];
            art_contenidos = new string[count2];

            while (reader2.Read())
            {
                art_titulos[j] = reader2["titulo"].ToString();
                art_ids[j] = reader2["id"].ToString();
                art_contenidos[j] = reader2["contenido"].ToString();
                j++;
            }
            reader2.Close();
            conn.Close();
        }
    }
}
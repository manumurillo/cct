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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["en"] == "habitacion")
            {
                Page.Header.Title = "Cal-C-Tose :: Buenos Hábitos en la Habitación";
            }
            else if (Request.QueryString["en"] == "estancia")
            {
                Page.Header.Title = "Cal-C-Tose :: Buenos Hábitos en la Estancia";
            }
            else if (Request.QueryString["en"] == "estudio")
            {
                Page.Header.Title = "Cal-C-Tose :: Buenos Hábitos en el Estudio";
            }
            else if (Request.QueryString["en"] == "cocina")
            {
                Page.Header.Title = "Cal-C-Tose :: Buenos Hábitos en la Cocina";
            }
            else if (Request.QueryString["en"] == "bano")
            {
                Page.Header.Title = "Cal-C-Tose :: Buenos Hábitos en el Baño";
            }
            else if (Request.QueryString["en"] == "jardin")
            {
                Page.Header.Title = "Cal-C-Tose :: Buenos Hábitos en el Jardín";
            }
            else 
                Page.Header.Title = "Cal-C-Tose :: No hay resultados";
        }

        public string defineClass(string valor)
        {
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
            else if (valor == "5")
                retorno = "noLayout";
            return retorno;
        }
        
    }
}
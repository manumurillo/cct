using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSite
{
    public partial class Calctose : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["tema"] == null || Request.QueryString["tema"] == "" || Request.QueryString["tema"] == "presentaciones" || Request.QueryString["tema"] == "inicio")
            {
                Page.Header.Title = "Cal-C-Tose :: Presentaciones";
            }
            else if(Request.QueryString["tema"] == "ideas-para-el-desayuno")
            {
                Page.Header.Title = "Cal-C-Tose :: Ideas para el desayuno";
            }
            else if (Request.QueryString["tema"] == "la-ciencia-de-calctose")
            {
                Page.Header.Title = "Cal-C-Tose :: La ciencia de Cal-C-Tose";
            }
            else if (Request.QueryString["tema"] == "acerca-de")
            {
                Page.Header.Title = "Cal-C-Tose :: Acerca de...";
            }
            else 
            {
                Page.Header.Title = "Cal-C-Tose";
            }
        }
    }
}
<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="habitos.aspx.cs" Inherits="WebSite.habitos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <title>Cal-C-Tose :: Buenos Hábitos en el Hogar</title>
     <link href="styles/lugares.css" rel="stylesheet" type="text/css" />
     <link href="styles/tooltips.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="scripts/buenosHabitos.js"></script>
    <script src="http://code.jquery.com/jquery-1.4.2.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="scripts/jquery.lightbox_me.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <% 
   string en;
   en = Request.QueryString["en"];
   if (en == "habitacion") {
       //categorias(1);
       
%>
<!--Inicio habitación -->
    <asp:SqlDataSource runat="server" ID="spots_habitacion" ConnectionString='<%$ ConnectionStrings:CCT2013ConnectionString %>' SelectCommand="SELECT ARTICULO.id, ARTICULO.titulo, ARTICULO.resumen, ARTICULO.contenido, ARTICULO.thumbnail, ARTICULO.plantilla, ARTICULO.url_imagen, ARTICULO.pie_imagen, SPOT.id AS spot_id, SPOT.p_top, SPOT.p_left FROM articulo AS ARTICULO LEFT OUTER JOIN spot AS SPOT ON ARTICULO.id = SPOT.id_articulo WHERE (SPOT.visible = 1) AND (SPOT.id_categoria = 1) ORDER BY ARTICULO.fecha_creacion">
    </asp:SqlDataSource>
    <div class="place">
        <div id="img_habitacion">
            <div class="section-title"><p>HOGAR CAL-C-TOSE / <strong>BUENOS HÁBITOS EN LA HABITACIÓN</strong></p></div>

            <div class="menu-derecha">
			    <div class="contenedor">
				    <div class="contenedor-izquierda">
					    <div class="contenedor-izquierda-desactivado"><div class="desactivada"></div></div>
					    <div class="contenedor-izquierda-activado esconder"><div class="activada"></div></div>
				    </div>
				    <div class="contenedor-submenu">
                        <ul>
                            <asp:ListView ID="hab_list" runat="server" DataSourceID="spots_habitacion">
                                <ItemTemplate>
                                    <li class="bullet"><a href="#" class="mix more" id="more_<%# Eval("id") %>"><%# Eval("titulo") %></a></li>
                                </ItemTemplate>
                            </asp:ListView>
                        </ul>
				    </div>
			    </div>
		    </div>
            <asp:ListView ID="hab_spots" runat="server" DataSourceID="spots_habitacion">
                <ItemTemplate>
                    <div id="hab_<%# Eval("id") %>" class="tip" style="position:absolute; top:<%# Eval("p_top") %>px; left:<%# Eval("p_left") %>px;"></div>
                </ItemTemplate>
            </asp:ListView>
        </div>

        <asp:ListView ID="hab_tooltips" runat="server" DataSourceID="spots_habitacion">
            <ItemTemplate>
                <div class="tooltip" id="tip_hab_<%# Eval("id") %>">
                    <div class="col1">
                        <img src="images/bullets/expanded_bullet.png" alt="loader" />
                    </div>
                    <div class="col2">
                        <h2><%# Eval("titulo") %></h2>
                        <%#Eval("resumen").ToString() == "" ? "<p></p>" : "<p>"+Eval("resumen")+"</p>"%>

                        <%#Eval("thumbnail").ToString() == "" ? "" : " <img src='"+Eval("thumbnail")+"' alt='"+Eval("titulo")+"'/>"%>

                        <p class="right"><a href="#" class="dark more" id="more_<%# Eval("id") %>">Ver más</a></p>                
                    </div>
                </div>
            </ItemTemplate>
        </asp:ListView>
        
        <asp:ListView ID="hab_articulos" runat="server" DataSourceID="spots_habitacion">
            <ItemTemplate>
                <div class="<%# defineClass(Eval("plantilla").ToString())%>" id="show_more_<%# Eval("id") %>">
                    <div class="cerrar"><a href="#" class="light close"><img alt="Cerrar" src="images/menu_elements/close_cc.png"/></a></div>
                    <div class="title">
                        <%# Eval("titulo") %>
                    </div>
                    <div class="img">
                        <%#Eval("url_imagen").ToString() == "" ? "" : " <img src='"+Eval("url_imagen")+"' alt='"+Eval("titulo")+"'/>"%>
                        <%#Eval("pie_imagen").ToString() == "" ? "" : " <div class='img_footer'>"+Eval("pie_imagen")+"</div>"%>

                    </div>
                    <div class="content">
                        <%# Eval("contenido") %>
                    </div>
                    <div class="social">
                        <!--Twitter-->
                        <a href="https://twitter.com/share" class="twitter-share-button" data-url="http://cal-c-tose.com.mx/Articulo.aspx?numero=<%# Eval("id") %>" data-text="De interés este artículo en Cal-C-Tose:" data-lang="es" data-hashtags="CalCTose">Twittear</a> 
                        <script>!function (d, s, id) { var js, fjs = d.getElementsByTagName(s)[0], p = /^http:/.test(d.location) ? 'http' : 'https'; if (!d.getElementById(id)) { js = d.createElement(s); js.id = id; js.src = p + '://platform.twitter.com/widgets.js'; fjs.parentNode.insertBefore(js, fjs); } }(document, 'script', 'twitter-wjs');</script>
                        <!--Facebook-->
                        <div class="fb-like" data-href="http://cal-c-tose.com.mx/Articulo.aspx?numero=<%# Eval("id") %>" data-width="350" data-layout="button_count" data-action="like" data-show-faces="false" data-share="true"></div>
                        
                    </div>
                </div>
            </ItemTemplate>
        </asp:ListView>
    </div>
<!--Fin habitación -->
<% 
       
   }
%>

</asp:Content>

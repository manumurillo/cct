<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="buenosHabitos.aspx.cs" Inherits="WebSite.habitos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
%>
<!--Inicio habitación -->
    <asp:SqlDataSource runat="server" ID="spots_habitacion" ConnectionString='<%$ ConnectionStrings:CCT2013ConnectionString %>' SelectCommand="SELECT ARTICULO.id, ARTICULO.titulo, ARTICULO.resumen, ARTICULO.contenido, ARTICULO.thumbnail, ARTICULO.plantilla, ARTICULO.url_imagen, ARTICULO.pie_imagen, SPOT.id AS spot_id, SPOT.p_top, SPOT.p_left FROM articulo AS ARTICULO LEFT OUTER JOIN spot AS SPOT ON ARTICULO.id = SPOT.id_articulo WHERE (SPOT.visible = 1) AND (SPOT.id_categoria = 1) ORDER BY ARTICULO.fecha_creacion"></asp:SqlDataSource>
    <asp:SqlDataSource runat="server" ID="arts_habitacion" ConnectionString='<%$ ConnectionStrings:CCT2013ConnectionString %>' SelectCommand="SELECT ARTICULO.id, ARTICULO.titulo, ARTICULO.resumen, ARTICULO.contenido, ARTICULO.thumbnail, ARTICULO.plantilla, ARTICULO.url_imagen, ARTICULO.pie_imagen FROM articulo AS ARTICULO WHERE (ARTICULO.id_categoria = 1 AND ARTICULO.tipo = 1) ORDER BY ARTICULO.fecha_creacion"></asp:SqlDataSource>
    
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
                            <asp:ListView ID="hab_list" runat="server" DataSourceID="arts_habitacion">
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

                        <%#Eval("thumbnail").ToString() == "" ? "" : " <img src='http://www.cal-c-tose.com.mx/images/spots/"+Eval("thumbnail")+"' alt='"+Eval("titulo")+"'/>"%>

                        <p class="right"><a href="#" class="dark more" id="more_<%# Eval("id") %>">Ver más</a></p>                
                    </div>
                </div>
            </ItemTemplate>
        </asp:ListView>
        
        <asp:ListView ID="hab_articulos" runat="server" DataSourceID="arts_habitacion">
            <ItemTemplate>
                <div class="<%# defineClass(Eval("plantilla").ToString())%>" id="show_more_<%# Eval("id") %>">
                    <div class="cerrar"><a href="#" class="light close"><img alt="Cerrar" src="images/menu_elements/close_cc.png"/></a></div>
                    <div class="title">
                        <%# Eval("titulo") %>
                    </div>
                    <div class="img">
                        <%#Eval("url_imagen").ToString() == "" ? "" : " <img src='http://www.cal-c-tose.com.mx/images/articulos/"+Eval("url_imagen")+"' alt='"+Eval("titulo")+"'/>"%>
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
   else if (en == "estancia")
   {
%>
<!--Inicio estancia -->
    <asp:SqlDataSource runat="server" ID="spots_estancia" ConnectionString='<%$ ConnectionStrings:CCT2013ConnectionString %>' SelectCommand="SELECT ARTICULO.id, ARTICULO.titulo, ARTICULO.resumen, ARTICULO.contenido, ARTICULO.thumbnail, ARTICULO.plantilla, ARTICULO.url_imagen, ARTICULO.pie_imagen, SPOT.id AS spot_id, SPOT.p_top, SPOT.p_left FROM articulo AS ARTICULO LEFT OUTER JOIN spot AS SPOT ON ARTICULO.id = SPOT.id_articulo WHERE (SPOT.visible = 1) AND (SPOT.id_categoria = 2) ORDER BY ARTICULO.fecha_creacion"></asp:SqlDataSource>
    <asp:SqlDataSource runat="server" ID="arts_estancia" ConnectionString='<%$ ConnectionStrings:CCT2013ConnectionString %>' SelectCommand="SELECT ARTICULO.id, ARTICULO.titulo, ARTICULO.resumen, ARTICULO.contenido, ARTICULO.thumbnail, ARTICULO.plantilla, ARTICULO.url_imagen, ARTICULO.pie_imagen FROM articulo AS ARTICULO WHERE (ARTICULO.id_categoria = 2 AND ARTICULO.tipo = 1) ORDER BY ARTICULO.fecha_creacion"></asp:SqlDataSource>
    
    <div class="place">
        <div id="img_estancia">
            <div class="section-title"><p>HOGAR CAL-C-TOSE / <strong>BUENOS HÁBITOS EN LA ESTANCIA</strong></p></div>

            <div class="menu-derecha">
			    <div class="contenedor">
				    <div class="contenedor-izquierda">
					    <div class="contenedor-izquierda-desactivado"><div class="desactivada"></div></div>
					    <div class="contenedor-izquierda-activado esconder"><div class="activada"></div></div>
				    </div>
				    <div class="contenedor-submenu">
                        <ul>
                            <asp:ListView ID="est_list" runat="server" DataSourceID="arts_estancia">
                                <ItemTemplate>
                                    <li class="bullet"><a href="#" class="mix more" id='more_<%# Eval("id") %>'><%# Eval("titulo") %></a></li>
                                </ItemTemplate>
                            </asp:ListView>
                        </ul>
				    </div>
			    </div>
		    </div>
            <asp:ListView ID="est_spots" runat="server" DataSourceID="spots_estancia">
                <ItemTemplate>
                    <div id='est_<%# Eval("id") %>' class="tip" style="position:absolute; top:<%# Eval("p_top") %>px; left:<%# Eval("p_left") %>px;"></div>
                </ItemTemplate>
            </asp:ListView>
        </div>

        <asp:ListView ID="est_tooltips" runat="server" DataSourceID="spots_estancia">
            <ItemTemplate>
                <div class="tooltip" id='tip_est_<%# Eval("id") %>'>
                    <div class="col1">
                        <img src="images/bullets/expanded_bullet.png" alt="loader" />
                    </div>
                    <div class="col2">
                        <h2><%# Eval("titulo") %></h2>
                        <%#Eval("resumen").ToString() == "" ? "<p></p>" : "<p>"+Eval("resumen")+"</p>"%>

                        <%#Eval("thumbnail").ToString() == "" ? "" : " <img src='http://www.cal-c-tose.com.mx/images/spots/"+Eval("thumbnail")+"' alt='"+Eval("titulo")+"'/>"%>

                        <p class="right"><a href="#" class="dark more" id='more_<%# Eval("id") %>'>Ver más</a></p>                
                    </div>
                </div>
            </ItemTemplate>
        </asp:ListView>
        
        <asp:ListView ID="est_articulos" runat="server" DataSourceID="arts_estancia">
            <ItemTemplate>
                <div class="<%# defineClass(Eval("plantilla").ToString())%>" id='show_more_<%# Eval("id") %>'>
                    <div class="cerrar"><a href="#" class="light close"><img alt="Cerrar" src="images/menu_elements/close_cc.png"/></a></div>
                    <div class="title">
                        <%# Eval("titulo") %>
                    </div>
                    <div class="img">
                        <%#Eval("url_imagen").ToString() == "" ? "" : " <img src='http://www.cal-c-tose.com.mx/images/articulos/"+Eval("url_imagen")+"' alt='"+Eval("titulo")+"'/>"%>
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
<!--Fin estancia -->
<% 
       
   }
   else if (en == "estudio")
   {
%>
<!--Inicio estudio -->
    <asp:SqlDataSource runat="server" ID="spots_estudio" ConnectionString='<%$ ConnectionStrings:CCT2013ConnectionString %>' SelectCommand="SELECT ARTICULO.id, ARTICULO.titulo, ARTICULO.resumen, ARTICULO.contenido, ARTICULO.thumbnail, ARTICULO.plantilla, ARTICULO.url_imagen, ARTICULO.pie_imagen, SPOT.id AS spot_id, SPOT.p_top, SPOT.p_left FROM articulo AS ARTICULO LEFT OUTER JOIN spot AS SPOT ON ARTICULO.id = SPOT.id_articulo WHERE (SPOT.visible = 1) AND (SPOT.id_categoria = 3) ORDER BY ARTICULO.fecha_creacion"></asp:SqlDataSource>
    <asp:SqlDataSource runat="server" ID="arts_estudio" ConnectionString='<%$ ConnectionStrings:CCT2013ConnectionString %>' SelectCommand="SELECT ARTICULO.id, ARTICULO.titulo, ARTICULO.resumen, ARTICULO.contenido, ARTICULO.thumbnail, ARTICULO.plantilla, ARTICULO.url_imagen, ARTICULO.pie_imagen FROM articulo AS ARTICULO WHERE (ARTICULO.id_categoria = 3 AND ARTICULO.tipo = 1) ORDER BY ARTICULO.fecha_creacion"></asp:SqlDataSource>
    
    <div class="place">
        <div id="img_estudio">
            <div class="section-title"><p>HOGAR CAL-C-TOSE / <strong>BUENOS HÁBITOS EN EL ESTUDIO</strong></p></div>

            <div class="menu-derecha">
			    <div class="contenedor">
				    <div class="contenedor-izquierda">
					    <div class="contenedor-izquierda-desactivado"><div class="desactivada"></div></div>
					    <div class="contenedor-izquierda-activado esconder"><div class="activada"></div></div>
				    </div>
				    <div class="contenedor-submenu">
                        <ul>
                            <asp:ListView ID="std_list" runat="server" DataSourceID="arts_estudio">
                                <ItemTemplate>
                                    <li class="bullet"><a href="#" class="mix more" id='more_<%# Eval("id") %>'><%# Eval("titulo") %></a></li>
                                </ItemTemplate>
                            </asp:ListView>
                        </ul>
				    </div>
			    </div>
		    </div>
            <asp:ListView ID="std_spots" runat="server" DataSourceID="spots_estudio">
                <ItemTemplate>
                    <div id='std_<%# Eval("id") %>' class="tip" style="position:absolute; top:<%# Eval("p_top") %>px; left:<%# Eval("p_left") %>px;"></div>
                </ItemTemplate>
            </asp:ListView>
        </div>

        <asp:ListView ID="std_tooltips" runat="server" DataSourceID="spots_estudio">
            <ItemTemplate>
                <div class="tooltip" id='tip_std_<%# Eval("id") %>'>
                    <div class="col1">
                        <img src="images/bullets/expanded_bullet.png" alt="loader" />
                    </div>
                    <div class="col2">
                        <h2><%# Eval("titulo") %></h2>
                        <%#Eval("resumen").ToString() == "" ? "<p></p>" : "<p>"+Eval("resumen")+"</p>"%>

                        <%#Eval("thumbnail").ToString() == "" ? "" : " <img src='http://www.cal-c-tose.com.mx/images/spots/"+Eval("thumbnail")+"' alt='"+Eval("titulo")+"'/>"%>

                        <p class="right"><a href="#" class="dark more" id='more_<%# Eval("id") %>'>Ver más</a></p>                
                    </div>
                </div>
            </ItemTemplate>
        </asp:ListView>
        
        <asp:ListView ID="std_articulos" runat="server" DataSourceID="arts_estudio">
            <ItemTemplate>
                <div class="<%# defineClass(Eval("plantilla").ToString())%>" id='show_more_<%# Eval("id") %>'>
                    <div class="cerrar"><a href="#" class="light close"><img alt="Cerrar" src="images/menu_elements/close_cc.png"/></a></div>
                    <div class="title">
                        <%# Eval("titulo") %>
                    </div>
                    <div class="img">
                        <%#Eval("url_imagen").ToString() == "" ? "" : " <img src='http://www.cal-c-tose.com.mx/images/articulos/"+Eval("url_imagen")+"' alt='"+Eval("titulo")+"'/>"%>
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
<!--Fin estudio -->
<% 
       
   }
   else if (en == "cocina")
   {
%>
<!--Inicio cocina -->
    <asp:SqlDataSource runat="server" ID="spots_cocina" ConnectionString='<%$ ConnectionStrings:CCT2013ConnectionString %>' SelectCommand="SELECT ARTICULO.id, ARTICULO.titulo, ARTICULO.resumen, ARTICULO.contenido, ARTICULO.thumbnail, ARTICULO.plantilla, ARTICULO.url_imagen, ARTICULO.pie_imagen, SPOT.id AS spot_id, SPOT.p_top, SPOT.p_left FROM articulo AS ARTICULO LEFT OUTER JOIN spot AS SPOT ON ARTICULO.id = SPOT.id_articulo WHERE (SPOT.visible = 1) AND (SPOT.id_categoria = 4) ORDER BY ARTICULO.fecha_creacion"></asp:SqlDataSource>
    <asp:SqlDataSource runat="server" ID="arts_cocina" ConnectionString='<%$ ConnectionStrings:CCT2013ConnectionString %>' SelectCommand="SELECT ARTICULO.id, ARTICULO.titulo, ARTICULO.resumen, ARTICULO.contenido, ARTICULO.thumbnail, ARTICULO.plantilla, ARTICULO.url_imagen, ARTICULO.pie_imagen FROM articulo AS ARTICULO WHERE (ARTICULO.id_categoria = 4 AND ARTICULO.tipo = 1) ORDER BY ARTICULO.fecha_creacion"></asp:SqlDataSource>
    
    <div class="place">
        <div id="img_cocina">
            <div class="section-title"><p>HOGAR CAL-C-TOSE / <strong>BUENOS HÁBITOS EN LA COCINA</strong></p></div>

            <div class="menu-derecha">
			    <div class="contenedor">
				    <div class="contenedor-izquierda">
					    <div class="contenedor-izquierda-desactivado"><div class="desactivada"></div></div>
					    <div class="contenedor-izquierda-activado esconder"><div class="activada"></div></div>
				    </div>
				    <div class="contenedor-submenu">
                        <ul>
                            <asp:ListView ID="coc_list" runat="server" DataSourceID="arts_cocina">
                                <ItemTemplate>
                                    <li class="bullet"><a href="#" class="mix more" id='more_<%# Eval("id") %>'><%# Eval("titulo") %></a></li>
                                </ItemTemplate>
                            </asp:ListView>
                        </ul>
				    </div>
			    </div>
		    </div>
            <asp:ListView ID="coc_spots" runat="server" DataSourceID="spots_cocina">
                <ItemTemplate>
                    <div id='coc_<%# Eval("id") %>' class="tip" style="position:absolute; top:<%# Eval("p_top") %>px; left:<%# Eval("p_left") %>px;"></div>
                </ItemTemplate>
            </asp:ListView>
        </div>

        <asp:ListView ID="coc_tooltips" runat="server" DataSourceID="spots_cocina">
            <ItemTemplate>
                <div class="tooltip" id='tip_coc_<%# Eval("id") %>'>
                    <div class="col1">
                        <img src="images/bullets/expanded_bullet.png" alt="loader" />
                    </div>
                    <div class="col2">
                        <h2><%# Eval("titulo") %></h2>
                        <%#Eval("resumen").ToString() == "" ? "<p></p>" : "<p>"+Eval("resumen")+"</p>"%>

                        <%#Eval("thumbnail").ToString() == "" ? "" : " <img src='http://www.cal-c-tose.com.mx/images/spots/"+Eval("thumbnail")+"' alt='"+Eval("titulo")+"'/>"%>

                        <p class="right"><a href="#" class="dark more" id='more_<%# Eval("id") %>'>Ver más</a></p>                
                    </div>
                </div>
            </ItemTemplate>
        </asp:ListView>
        
        <asp:ListView ID="coc_articulos" runat="server" DataSourceID="arts_cocina">
            <ItemTemplate>
                <div class="<%# defineClass(Eval("plantilla").ToString())%>" id='show_more_<%# Eval("id") %>'>
                    <div class="cerrar"><a href="#" class="light close"><img alt="Cerrar" src="images/menu_elements/close_cc.png"/></a></div>
                    <div class="title">
                        <%# Eval("titulo") %>
                    </div>
                    <div class="img">
                        <%#Eval("url_imagen").ToString() == "" ? "" : " <img src='http://www.cal-c-tose.com.mx/images/articulos/"+Eval("url_imagen")+"' alt='"+Eval("titulo")+"'/>"%>
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
<!--Fin cocina -->
<% 
       
   }
   else if (en == "bano")
   {
%>
<!--Inicio baño -->
    <asp:SqlDataSource runat="server" ID="spots_bano" ConnectionString='<%$ ConnectionStrings:CCT2013ConnectionString %>' SelectCommand="SELECT ARTICULO.id, ARTICULO.titulo, ARTICULO.resumen, ARTICULO.contenido, ARTICULO.thumbnail, ARTICULO.plantilla, ARTICULO.url_imagen, ARTICULO.pie_imagen, SPOT.id AS spot_id, SPOT.p_top, SPOT.p_left FROM articulo AS ARTICULO LEFT OUTER JOIN spot AS SPOT ON ARTICULO.id = SPOT.id_articulo WHERE (SPOT.visible = 1) AND (SPOT.id_categoria = 5) ORDER BY ARTICULO.fecha_creacion"></asp:SqlDataSource>
    <asp:SqlDataSource runat="server" ID="arts_bano" ConnectionString='<%$ ConnectionStrings:CCT2013ConnectionString %>' SelectCommand="SELECT ARTICULO.id, ARTICULO.titulo, ARTICULO.resumen, ARTICULO.contenido, ARTICULO.thumbnail, ARTICULO.plantilla, ARTICULO.url_imagen, ARTICULO.pie_imagen FROM articulo AS ARTICULO WHERE (ARTICULO.id_categoria = 5 AND ARTICULO.tipo = 1) ORDER BY ARTICULO.fecha_creacion"></asp:SqlDataSource>
    <div class="place">
        <div id="img_bano">
            <div class="section-title"><p>HOGAR CAL-C-TOSE / <strong>BUENOS HÁBITOS EN EL BAÑO</strong></p></div>

            <div class="menu-derecha">
			    <div class="contenedor">
				    <div class="contenedor-izquierda">
					    <div class="contenedor-izquierda-desactivado"><div class="desactivada"></div></div>
					    <div class="contenedor-izquierda-activado esconder"><div class="activada"></div></div>
				    </div>
				    <div class="contenedor-submenu">
                        <ul>
                            <asp:ListView ID="ban_list" runat="server" DataSourceID="arts_bano">
                                <ItemTemplate>
                                    <li class="bullet"><a href="#" class="mix more" id='more_<%# Eval("id") %>'><%# Eval("titulo") %></a></li>
                                </ItemTemplate>
                            </asp:ListView>
                        </ul>
				    </div>
			    </div>
		    </div>
            <asp:ListView ID="ban_spots" runat="server" DataSourceID="spots_bano">
                <ItemTemplate>
                    <div id='ban_<%# Eval("id") %>' class="tip" style="position:absolute; top:<%# Eval("p_top") %>px; left:<%# Eval("p_left") %>px;"></div>
                </ItemTemplate>
            </asp:ListView>
        </div>

        <asp:ListView ID="ban_tooltips" runat="server" DataSourceID="spots_bano">
            <ItemTemplate>
                <div class="tooltip" id='tip_ban_<%# Eval("id") %>'>
                    <div class="col1">
                        <img src="images/bullets/expanded_bullet.png" alt="loader" />
                    </div>
                    <div class="col2">
                        <h2><%# Eval("titulo") %></h2>
                        <%#Eval("resumen").ToString() == "" ? "<p></p>" : "<p>"+Eval("resumen")+"</p>"%>

                        <%#Eval("thumbnail").ToString() == "" ? "" : " <img src='http://www.cal-c-tose.com.mx/images/spots/"+Eval("thumbnail")+"' alt='"+Eval("titulo")+"'/>"%>

                        <p class="right"><a href="#" class="dark more" id='more_<%# Eval("id") %>'>Ver más</a></p>                
                    </div>
                </div>
            </ItemTemplate>
        </asp:ListView>
        
        <asp:ListView ID="ban_articulos" runat="server" DataSourceID="arts_bano">
            <ItemTemplate>
                <div class="<%# defineClass(Eval("plantilla").ToString())%>" id='show_more_<%# Eval("id") %>'>
                    <div class="cerrar"><a href="#" class="light close"><img alt="Cerrar" src="images/menu_elements/close_cc.png"/></a></div>
                    <div class="title">
                        <%# Eval("titulo") %>
                    </div>
                    <div class="img">
                        <%#Eval("url_imagen").ToString() == "" ? "" : " <img src='http://www.cal-c-tose.com.mx/images/articulos/"+Eval("url_imagen")+"' alt='"+Eval("titulo")+"'/>"%>
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
<!--Fin baño -->
<% 
       
   }
   else if (en == "jardin")
   {
%>
<!--Inicio jardín -->
    <asp:SqlDataSource runat="server" ID="spots_jardin" ConnectionString='<%$ ConnectionStrings:CCT2013ConnectionString %>' SelectCommand="SELECT ARTICULO.id, ARTICULO.titulo, ARTICULO.resumen, ARTICULO.contenido, ARTICULO.thumbnail, ARTICULO.plantilla, ARTICULO.url_imagen, ARTICULO.pie_imagen, SPOT.id AS spot_id, SPOT.p_top, SPOT.p_left FROM articulo AS ARTICULO LEFT OUTER JOIN spot AS SPOT ON ARTICULO.id = SPOT.id_articulo WHERE (SPOT.visible = 1) AND (SPOT.id_categoria = 6) ORDER BY ARTICULO.fecha_creacion"></asp:SqlDataSource>
    <asp:SqlDataSource runat="server" ID="arts_jardin" ConnectionString='<%$ ConnectionStrings:CCT2013ConnectionString %>' SelectCommand="SELECT ARTICULO.id, ARTICULO.titulo, ARTICULO.resumen, ARTICULO.contenido, ARTICULO.thumbnail, ARTICULO.plantilla, ARTICULO.url_imagen, ARTICULO.pie_imagen FROM articulo AS ARTICULO WHERE (ARTICULO.id_categoria = 6 AND ARTICULO.tipo = 1) ORDER BY ARTICULO.fecha_creacion"></asp:SqlDataSource>
    <div class="place">
        <div id="img_jardin">
            <div class="section-title"><p>HOGAR CAL-C-TOSE / <strong>BUENOS HÁBITOS EN EL JARDÍN</strong></p></div>

            <div class="menu-derecha">
			    <div class="contenedor">
				    <div class="contenedor-izquierda">
					    <div class="contenedor-izquierda-desactivado"><div class="desactivada"></div></div>
					    <div class="contenedor-izquierda-activado esconder"><div class="activada"></div></div>
				    </div>
				    <div class="contenedor-submenu">
                        <ul>
                            <asp:ListView ID="jar_list" runat="server" DataSourceID="arts_jardin">
                                <ItemTemplate>
                                    <li class="bullet"><a href="#" class="mix more" id='more_<%# Eval("id") %>'><%# Eval("titulo") %></a></li>
                                </ItemTemplate>
                            </asp:ListView>
                        </ul>
				    </div>
			    </div>
		    </div>
            <asp:ListView ID="jar_spots" runat="server" DataSourceID="spots_jardin">
                <ItemTemplate>
                    <div id='jar_<%# Eval("id") %>' class="tip" style="position:absolute; top:<%# Eval("p_top") %>px; left:<%# Eval("p_left") %>px;"></div>
                </ItemTemplate>
            </asp:ListView>
        </div>

        <asp:ListView ID="jar_tooltips" runat="server" DataSourceID="spots_jardin">
            <ItemTemplate>
                <div class="tooltip" id='tip_jar_<%# Eval("id") %>'>
                    <div class="col1">
                        <img src="images/bullets/expanded_bullet.png" alt="loader" />
                    </div>
                    <div class="col2">
                        <h2><%# Eval("titulo") %></h2>
                        <%#Eval("resumen").ToString() == "" ? "<p></p>" : "<p>"+Eval("resumen")+"</p>"%>

                        <%#Eval("thumbnail").ToString() == "" ? "" : " <img src='http://www.cal-c-tose.com.mx/images/spots/"+Eval("thumbnail")+"' alt='"+Eval("titulo")+"'/>"%>

                        <p class="right"><a href="#" class="dark more" id='more_<%# Eval("id") %>'>Ver más</a></p>                
                    </div>
                </div>
            </ItemTemplate>
        </asp:ListView>
        
        <asp:ListView ID="jar_articulos" runat="server" DataSourceID="arts_jardin">
            <ItemTemplate>
                <div class="<%# defineClass(Eval("plantilla").ToString())%>" id='show_more_<%# Eval("id") %>'>
                    <div class="cerrar"><a href="#" class="light close"><img alt="Cerrar" src="images/menu_elements/close_cc.png"/></a></div>
                    <div class="title">
                        <%# Eval("titulo") %>
                    </div>
                    <div class="img">
                        <%#Eval("url_imagen").ToString() == "" ? "" : " <img src='http://www.cal-c-tose.com.mx/images/articulos/"+Eval("url_imagen")+"' alt='"+Eval("titulo")+"'/>"%>
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
<!--Fin jardin -->
<% 
       
   }
   else {
   
%>
    <div class="place">
        <div class="section-title"><p>NO HAY RESULTADOS</p></div>
    </div>
<% 
       
   }
   
%>
</asp:Content>

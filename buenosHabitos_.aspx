<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="buenosHabitos.aspx.cs" Inherits="WebSite.buenosHabitos" %>
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
       categorias(1);
%>
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
                       <%
                           for (int i = 0; i < art_contenidos.Length; i++)
                           {
                       %>
                           <li class="bullet"><a href="#" class="mix more" id="more_<%=art_ids[i]%>"><%=art_titulos[i]%></a></li>
                       <%   }
                        %>
                       </ul>
				    </div>
			    </div>
		    </div>

            <%                     
               for (int i = 0; i < titulos.Length; i++)
               {           
            %>
            <div id="hab_<%=ids[i]%>" class="tip" style="position:absolute; top:<%=top[i]%>px; left:<%=left[i]%>px;"></div>
            <%} %>
        </div>

        <%
           for (int i = 0; i < titulos.Length; i++)
           {           
            %>
            <div class="tooltip" id="tip_hab_<%=ids[i]%>">
                <div class="col1">
                    <img src="images/bullets/expanded_bullet.png" alt="loader" />
                </div>
                <div class="col2">
                    <h2><%=titulos[i]%></h2>
                    <%if (resumen[i] != "")
                      {
                           %>
                    <p><%=resumen[i]%></p>

                    <%}
                      if (thumbs[i] != "")
                      {
                           %>
                    <img src="<%=thumbs[i]%>" alt="imagen" />
                    <%} %>
                    <p class="right"><a href="#" class="dark more" id="more_<%=ids[i]%>">Ver más</a></p>                
                </div>
            </div>
            <% }
       %>
    
    <%
        for(int i=0;i < art_titulos.Length; i++ ){
    %>

    <div id="show_more_<%=art_ids[i]%>" class="show_more">
        <div class="cerrar"><a href="#" class="light close"><img alt="Cerrar" src="images/menu_elements/close_cc.png" /></a></div>
        <div class="titulo"><h2><%=art_titulos[i]%></h2></div>
        <div class="contenido">
            <%=art_contenidos[i]%>
            <br />
           <div class="social">
               <!--Twitter-->
               <a href="https://twitter.com/share" class="twitter-share-button" data-url="http://cal-c-tose.com.mx/Articulo.aspx?numero=<%=art_ids[i]%>" data-text="De interés este artículo en Cal-C-Tose:" data-lang="es" data-hashtags="CalCTose">Twittear</a> 
               <script>!function (d, s, id) { var js, fjs = d.getElementsByTagName(s)[0], p = /^http:/.test(d.location) ? 'http' : 'https'; if (!d.getElementById(id)) { js = d.createElement(s); js.id = id; js.src = p + '://platform.twitter.com/widgets.js'; fjs.parentNode.insertBefore(js, fjs); } }(document, 'script', 'twitter-wjs');</script>
               <!--Facebook-->
               <div class="fb-like" data-href="http://cal-c-tose.com.mx/Articulo.aspx?numero=<%=art_ids[i]%>" data-width="350" data-layout="standard" data-action="like" data-show-faces="false" data-share="true"></div>
            </div>
        </div>
    </div>

    <% }
    %>
</div>

<% 
       
   }
   else if (en == "estancia") {
       categorias(2);
%>
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
                       <%
                       if(art_contenidos.Length>=1)
                       {
                           for (int i = 0; i < art_contenidos.Length; i++)
                           {
                       %>
                           <li class="bullet"><a href="#" class="mix more" id="more_<%=art_ids[i]%>"><%=art_titulos[i]%></a></li>
                       <%   }
                        } %>
                       </ul>
				    </div>
			    </div>
		    </div>

            <%
            if (titulos.Length >= 1)
            {                      
               for (int i = 0; i < titulos.Length; i++)
               {           
            %>
            <div id="hab_<%=ids[i]%>" class="tip" style="position:absolute; top:<%=top[i]%>px; left:<%=left[i]%>px;"></div>
            <%} %>
        </div>

        <%
           for (int i = 0; i < titulos.Length; i++)
           {           
            %>
            <div class="tooltip" id="tip_hab_<%=ids[i]%>">
                <div class="col1">
                    <img src="images/bullets/expanded_bullet.png" alt="loader" />
                </div>
                <div class="col2">
                    <h2><%=titulos[i]%></h2>
                    <%if (resumen[i] != "")
                      {
                           %>
                    <p><%=resumen[i]%></p>

                    <%}
                      if (thumbs[i] != "")
                      {
                           %>
                    <img src="<%=thumbs[i]%>" alt="imagen" />
                    <%} %>
                    <p class="right"><a href="#" class="dark more" id="more_<%=ids[i]%>">Ver más</a></p>                
                </div>
            </div>
            <% }
       }%>
    
    <%
    if(art_titulos.Length>=1)
    {
        for(int i=0;i < art_titulos.Length; i++ ){
    %>

    <div id="show_more_<%=art_ids[i]%>" class="show_more">
        <div class="cerrar"><a href="#" class="light close"><img alt="Cerrar" src="images/menu_elements/close_cc.png" /></a></div>
        <div class="titulo"><h2><%=art_titulos[i]%></h2></div>
        <div class="contenido">
            <%=art_contenidos[i]%>
            <br />
           <div class="social">
               <!--Twitter-->
               <a href="https://twitter.com/share" class="twitter-share-button" data-url="http://cal-c-tose.com.mx/Articulo.aspx?numero=<%=art_ids[i]%>" data-text="De interés este artículo en Cal-C-Tose:" data-lang="es" data-hashtags="CalCTose">Twittear</a> 
               <script>!function (d, s, id) { var js, fjs = d.getElementsByTagName(s)[0], p = /^http:/.test(d.location) ? 'http' : 'https'; if (!d.getElementById(id)) { js = d.createElement(s); js.id = id; js.src = p + '://platform.twitter.com/widgets.js'; fjs.parentNode.insertBefore(js, fjs); } }(document, 'script', 'twitter-wjs');</script>
               <!--Facebook-->
               <div class="fb-like" data-href="http://cal-c-tose.com.mx/Articulo.aspx?numero=<%=art_ids[i]%>" data-width="350" data-layout="standard" data-action="like" data-show-faces="false" data-share="true"></div>
            </div>
        </div>
    </div>

    <% }
    }%>
    </div>
<% 
       
   }
   else if (en == "estudio") {
       categorias(3);
%>
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
                       <%
                       if(art_contenidos.Length>=1)
                       {
                           for (int i = 0; i < art_contenidos.Length; i++)
                           {
                       %>
                           <li class="bullet"><a href="#" class="mix more" id="more_<%=art_ids[i]%>"><%=art_titulos[i]%></a></li>
                       <%   }
                        } %>
                       </ul>
				    </div>
			    </div>
		    </div>

            <%
            if (titulos.Length >= 1)
            {                      
               for (int i = 0; i < titulos.Length; i++)
               {           
            %>
            <div id="hab_<%=ids[i]%>" class="tip" style="position:absolute; top:<%=top[i]%>px; left:<%=left[i]%>px;"></div>
            <%} %>
        </div>

        <%
           for (int i = 0; i < titulos.Length; i++)
           {           
            %>
            <div class="tooltip" id="tip_hab_<%=ids[i]%>">
                <div class="col1">
                    <img src="images/bullets/expanded_bullet.png" alt="loader" />
                </div>
                <div class="col2">
                    <h2><%=titulos[i]%></h2>
                    <%if (resumen[i] != "")
                      {
                           %>
                    <p><%=resumen[i]%></p>

                    <%}
                      if (thumbs[i] != "")
                      {
                           %>
                    <img src="<%=thumbs[i]%>" alt="imagen" />
                    <%} %>
                    <p class="right"><a href="#" class="dark more" id="more_<%=ids[i]%>">Ver más</a></p>                
                </div>
            </div>
            <% }
       }%>
    
    <%
    if(art_titulos.Length>=1)
    {
        for(int i=0;i < art_titulos.Length; i++ ){
    %>

    <div id="show_more_<%=art_ids[i]%>" class="show_more">
        <div class="cerrar"><a href="#" class="light close"><img alt="Cerrar" src="images/menu_elements/close_cc.png" /></a></div>
        <div class="titulo"><h2><%=art_titulos[i]%></h2></div>
        <div class="contenido">
            <%=art_contenidos[i]%>
            <br />
           <div class="social">
               <!--Twitter-->
               <a href="https://twitter.com/share" class="twitter-share-button" data-url="http://cal-c-tose.com.mx/Articulo.aspx?numero=<%=art_ids[i]%>" data-text="De interés este artículo en Cal-C-Tose:" data-lang="es" data-hashtags="CalCTose">Twittear</a> 
               <script>!function (d, s, id) { var js, fjs = d.getElementsByTagName(s)[0], p = /^http:/.test(d.location) ? 'http' : 'https'; if (!d.getElementById(id)) { js = d.createElement(s); js.id = id; js.src = p + '://platform.twitter.com/widgets.js'; fjs.parentNode.insertBefore(js, fjs); } }(document, 'script', 'twitter-wjs');</script>
               <!--Facebook-->
               <div class="fb-like" data-href="http://cal-c-tose.com.mx/Articulo.aspx?numero=<%=art_ids[i]%>" data-width="350" data-layout="standard" data-action="like" data-show-faces="false" data-share="true"></div>
            </div>
        </div>
    </div>

    <% }
    }%>
    </div>
<% 
       
   }
   else if (en == "cocina") {
       categorias(4);
   
%>
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
                       <%
                       if(art_contenidos.Length>=1)
                       {
                           for (int i = 0; i < art_contenidos.Length; i++)
                           {
                       %>
                           <li class="bullet"><a href="#" class="mix more" id="more_<%=art_ids[i]%>"><%=art_titulos[i]%></a></li>
                       <%   }
                        } %>
                       </ul>
				    </div>
			    </div>
		    </div>

            <%
            if (titulos.Length >= 1)
            {                      
               for (int i = 0; i < titulos.Length; i++)
               {           
            %>
            <div id="hab_<%=ids[i]%>" class="tip" style="position:absolute; top:<%=top[i]%>px; left:<%=left[i]%>px;"></div>
            <%} %>
        </div>

        <%
           for (int i = 0; i < titulos.Length; i++)
           {           
            %>
            <div class="tooltip" id="tip_hab_<%=ids[i]%>">
                <div class="col1">
                    <img src="images/bullets/expanded_bullet.png" alt="loader" />
                </div>
                <div class="col2">
                    <h2><%=titulos[i]%></h2>
                    <%if (resumen[i] != "")
                      {
                           %>
                    <p><%=resumen[i]%></p>

                    <%}
                      if (thumbs[i] != "")
                      {
                           %>
                    <img src="<%=thumbs[i]%>" alt="imagen"/>
                    <%} %>
                    <p class="right"><a href="#" class="dark more" id="more_<%=ids[i]%>">Ver más</a></p>                
                </div>
            </div>
            <% }
       }%>
    
    <%
    if(art_titulos.Length>=1)
    {
        for(int i=0;i < art_titulos.Length; i++ ){
    %>

    <div id="show_more_<%=art_ids[i]%>" class="show_more">
        <div class="cerrar"><a href="#" class="light close"><img alt="Cerrar" src="images/menu_elements/close_cc.png" /></a></div>
        <div class="titulo"><h2><%=art_titulos[i]%></h2></div>
        <div class="contenido">
            <%=art_contenidos[i]%>
            <br />
          <div class="social">
               <!--Twitter-->
               <a href="https://twitter.com/share" class="twitter-share-button" data-url="http://cal-c-tose.com.mx/Articulo.aspx?numero=<%=art_ids[i]%>" data-text="De interés este artículo en Cal-C-Tose:" data-lang="es" data-hashtags="CalCTose">Twittear</a> 
               <script>!function (d, s, id) { var js, fjs = d.getElementsByTagName(s)[0], p = /^http:/.test(d.location) ? 'http' : 'https'; if (!d.getElementById(id)) { js = d.createElement(s); js.id = id; js.src = p + '://platform.twitter.com/widgets.js'; fjs.parentNode.insertBefore(js, fjs); } }(document, 'script', 'twitter-wjs');</script>
               <!--Facebook-->
               <div class="fb-like" data-href="http://cal-c-tose.com.mx/Articulo.aspx?numero=<%=art_ids[i]%>" data-width="350" data-layout="standard" data-action="like" data-show-faces="false" data-share="true"></div>
            </div>
        </div>
    </div>

    <% }
    }%>
     </div>
<% 
       
   }
   else if (en == "bano") {
       categorias(5);
   
%>
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
                       <%
                       if(art_contenidos.Length>=1)
                       {
                           for (int i = 0; i < art_contenidos.Length; i++)
                           {
                       %>
                           <li class="bullet"><a href="#" class="mix more" id="more_<%=art_ids[i]%>"><%=art_titulos[i]%></a></li>
                       <%   }
                        } %>
                       </ul>
				    </div>
			    </div>
		    </div>

            <%
            if (titulos.Length >= 1)
            {                      
               for (int i = 0; i < titulos.Length; i++)
               {           
            %>
            <div id="hab_<%=ids[i]%>" class="tip" style="position:absolute; top:<%=top[i]%>px; left:<%=left[i]%>px;"></div>
            <%} %>
        </div>

        <%
           for (int i = 0; i < titulos.Length; i++)
           {           
            %>
            <div class="tooltip" id="tip_hab_<%=ids[i]%>">
                <div class="col1">
                    <img src="images/bullets/expanded_bullet.png" alt="loader" />
                </div>
                <div class="col2">
                    <h2><%=titulos[i]%></h2>
                    <%if (resumen[i] != "")
                      {
                           %>
                    <p><%=resumen[i]%></p>

                    <%}
                      if (thumbs[i] != "")
                      {
                           %>
                    <img src="<%=thumbs[i]%>" alt="imagen" />
                    <%} %>
                    <p class="right"><a href="#" class="dark more" id="more_<%=ids[i]%>">Ver más</a></p>                
                </div>
            </div>
            <% }
       }%>
    
    <%
    if(art_titulos.Length>=1)
    {
        for(int i=0;i < art_titulos.Length; i++ ){
    %>

    <div id="show_more_<%=art_ids[i]%>" class="show_more">
        <div class="cerrar"><a href="#" class="light close"><img alt="Cerrar" src="images/menu_elements/close_cc.png" /></a></div>
        <div class="titulo"><h2><%=art_titulos[i]%></h2></div>
        <div class="contenido">
            <%=art_contenidos[i]%>
            <br />
           <div class="social">
               <!--Twitter-->
               <a href="https://twitter.com/share" class="twitter-share-button" data-url="http://cal-c-tose.com.mx/Articulo.aspx?numero=<%=art_ids[i]%>" data-text="De interés este artículo en Cal-C-Tose:" data-lang="es" data-hashtags="CalCTose">Twittear</a> 
               <script>!function (d, s, id) { var js, fjs = d.getElementsByTagName(s)[0], p = /^http:/.test(d.location) ? 'http' : 'https'; if (!d.getElementById(id)) { js = d.createElement(s); js.id = id; js.src = p + '://platform.twitter.com/widgets.js'; fjs.parentNode.insertBefore(js, fjs); } }(document, 'script', 'twitter-wjs');</script>
               <!--Facebook-->
               <div class="fb-like" data-href="http://cal-c-tose.com.mx/Articulo.aspx?numero=<%=art_ids[i]%>" data-width="350" data-layout="standard" data-action="like" data-show-faces="false" data-share="true"></div>
            </div>
        </div>
    </div>

    <% }
    }%>
    </div>
<% 
       
   }
   else if (en == "jardin") {
       categorias(6);
   
%>
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
                       <%
                       if(art_contenidos.Length>=1)
                       {
                           for (int i = 0; i < art_contenidos.Length; i++)
                           {
                       %>
                           <li class="bullet"><a href="#" class="mix more" id="more_<%=art_ids[i]%>"><%=art_titulos[i]%></a></li>
                       <%   }
                        } %>
                       </ul>
				    </div>
			    </div>
		    </div>

            <%
            if (titulos.Length >= 1)
            {                      
               for (int i = 0; i < titulos.Length; i++)
               {           
            %>
            <div id="hab_<%=ids[i]%>" class="tip" style="position:absolute; top:<%=top[i]%>px; left:<%=left[i]%>px;"></div>
            <%} %>
        </div>

        <%
           for (int i = 0; i < titulos.Length; i++)
           {           
            %>
            <div class="tooltip" id="tip_hab_<%=ids[i]%>">
                <div class="col1">
                    <img src="images/bullets/expanded_bullet.png" alt="loader" />
                </div>
                <div class="col2">
                    <h2><%=titulos[i]%></h2>
                    <%if (resumen[i] != "")
                      {
                           %>
                    <p><%=resumen[i]%></p>

                    <%}
                      if (thumbs[i] != "")
                      {
                           %>
                    <img src="<%=thumbs[i]%>" alt="imagen" />
                    <%} %>
                    <p class="right"><a href="#" class="dark more" id="more_<%=ids[i]%>">Ver más</a></p>                
                </div>
            </div>
            <% }
       }%>
    
    <%
    if(art_titulos.Length>=1)
    {
        for(int i=0;i < art_titulos.Length; i++ ){
    %>

    <div id="show_more_<%=art_ids[i]%>" class="show_more">
        <div class="cerrar"><a href="#" class="light close"><img alt="Cerrar" src="images/menu_elements/close_cc.png" /></a></div>
        <div class="titulo"><h2><%=art_titulos[i]%></h2></div>
        <div class="contenido">
            <%=art_contenidos[i]%>
            <br />
           <div class="social">
               <!--Twitter-->
               <a href="https://twitter.com/share" class="twitter-share-button" data-url="http://cal-c-tose.com.mx/Articulo.aspx?numero=<%=art_ids[i]%>" data-text="De interés este artículo en Cal-C-Tose:" data-lang="es" data-hashtags="CalCTose">Twittear</a> 
               <script>!function (d, s, id) { var js, fjs = d.getElementsByTagName(s)[0], p = /^http:/.test(d.location) ? 'http' : 'https'; if (!d.getElementById(id)) { js = d.createElement(s); js.id = id; js.src = p + '://platform.twitter.com/widgets.js'; fjs.parentNode.insertBefore(js, fjs); } }(document, 'script', 'twitter-wjs');</script>
               <!--Facebook-->
               <div class="fb-like" data-href="http://cal-c-tose.com.mx/Articulo.aspx?numero=<%=art_ids[i]%>" data-width="350" data-layout="standard" data-action="like" data-show-faces="false" data-share="true"></div>
            </div>
        </div>
    </div>

    <% }
    }%>
    </div>
<% 
       
   }
   else { 
   
%>
    <div class="place">
        <div class="section-title"><p>ERROR! NO EXISTE LA HABITACIÓN</p></div>
    </div>
<% 
       
   }
   
%>

</asp:Content>

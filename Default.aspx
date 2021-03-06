﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebSite.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Cal-C-Tose :: Hogar</title>
    <link rel="stylesheet" href="styles/jquery-ui.css" />
    <script type="text/javascript" src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
    <script type="text/javascript" src="scripts/home.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <a name="tip"></a>
<div id="img_principal">
    <img src="images/home/casa_cal-c-tose.jpg" alt="Casa Cal-C-Tose" usemap="#home" class="img" />
    <map name="home" id="home">
        <area shape="rect" alt="Buenos hábitos en la habitación" coords="0,98,349,236" href="buenosHabitos.aspx?en=habitacion" title="BUENOS HÁBITOS EN LA HABITACIÓN" class="area_map" />
        <area shape="rect" alt="Buenos hábitos en el estudio" coords="354,98,801,236" href="buenosHabitos.aspx?en=estudio" title="BUENOS HÁBITOS EN EL ESTUDIO" class="area_map" />
        <area shape="rect" alt="Buenos hábitos en la cocina" coords="0,250,260,413" href="buenosHabitos.aspx?en=cocina" title="BUENOS HÁBITOS EN LA COCINA" class="area_map" />
        <area shape="rect" alt="Buenos hábitos en la estancia" coords="272,250,625,413" href="buenosHabitos.aspx?en=estancia" title="BUENOS HÁBITOS EN LA ESTANCIA" class="area_map" />
        <area shape="rect" alt="Buenos hábitos en el baño" coords="632,250,802,413" href="buenosHabitos.aspx?en=bano" title="BUENOS HÁBITOS EN EL BAÑO" class="area_map" />
        <area shape="rect" alt="Tip del día" coords="876,364,907,405" title="TIP DEL DÍA" href="#tip" class="area_map" onclick="muestraTip(document.getElementById('tip_del_dia'));" />
        <area shape="rect" alt="Buenos hábitos en el jardín" coords="826,100,980,470" href="buenosHabitos.aspx?en=jardin" title="BUENOS HÁBITOS EN EL JARDÍN" class="area_map" />
        
    </map>
    <div class="globo" onclick="muestraTip(document.getElementById('tip_del_dia'));" title="TIP DEL DÍA">
        Hay un nuevo TIP
    </div>
    <div class="anotaciones">
        <div class="texto">
            Siéntate con tus hijos a recorrer el HOGAR CAL-C-TOSE y juntos descubran los consejos que tenemos para ti en cada espacio.<br />
            Encuentra nuevos contenidos cada tercer día.
        </div>
        <div class="cerrar">
            <img src="images/bullets/closebox.png" alt="Cerrar"/>
        </div>
    </div>
    <% string ds= "";

       if (muestra) 
           ds = "block"; 
       else 
           ds = "none";%>
    <div id="tip_del_dia" style="display: <%=ds%>">
        <div class="tip-texto">
            
            <asp:Label ID="tip" runat="server" Text=""></asp:Label>
        </div>
        <div class="cerrar">
            <img src="images/bullets/closebox.png" alt="Cerrar"/>
        </div>
    </div>
</div>
    <div id="col1-3">
        <p class="title">LO MÁS DESTACADO</p>
        <p class="subtitle">PONTE AL DÍA CON LOS CONSEJOS MÁS RECIENTES</p>
        <div class="space-10"></div>
        
        <div id="destacado" class="sliderContainer">

        </div>
    </div>
    
    <div id="col2-3">
        <p class="title">COMPARTE TUS CONSEJOS</p>
        <p class="subtitle">CON OTRAS MAMÁS</p>
        <div class="space-5"></div>
        <div class="mensaje" runat="server" id="Mensaje"></div>
        <div class="space-5"></div>
        
        <%
            if (Session["usr_status"] != null)
            {
        %>
        <div class="gen_form" id="form_consejos">
       
            <div class="result center">
                <asp:Label ID="resultado_consejo" runat="server"></asp:Label>
            </div>
            <div class="space-5"></div>
           
            <asp:Label runat="server" CssClass="label">TÍTULO</asp:Label><br />
            <asp:TextBox ID="titulo" CssClass="input-text" runat="server" TabIndex="1" ToolTip="Escriba el título de su consejo"></asp:TextBox>
            <div class="space-5"></div>
            <asp:Label ID="Label1" runat="server" CssClass="label">CATEGORÍA</asp:Label><br />
             <asp:DropDownList ID="categoria" runat="server" TabIndex="2" ToolTip="Seleccione la categoría a la que pertenecerá su consejo">
                <asp:ListItem Value="1">Habitación</asp:ListItem>
                <asp:ListItem Value="2">Estancia</asp:ListItem>
                <asp:ListItem Value="3">Estudio</asp:ListItem>
                <asp:ListItem Value="4">Cocina</asp:ListItem>
                <asp:ListItem Value="5">Baño</asp:ListItem>
                <asp:ListItem Value="6">Jardín</asp:ListItem>
            </asp:DropDownList>
            <div class="space-5"></div>

            <asp:Label ID="Label3" runat="server" CssClass="label">TU CONSEJO</asp:Label><br />
            <asp:TextBox ID="consejo" CssClass="input-text" runat="server" TextMode="MultiLine" Height="103px" TabIndex="3" ToolTip="Redacte aquí el consejo que quiere compartir"></asp:TextBox>
            <div class="space-10"></div>
            <asp:Button ID="compartir" runat="server" CssClass="button" Text="COMPARTIR" OnClick="compartir_Click" TabIndex="4" />

            <div class="space-10"></div>
            <div class="center">
                <p class="normal">Para conocer los consejos de otras mamás</p>
                <p class="strong"><a href="comparteConsejos.aspx" class="dark">Haz clic aquí</a></p>
            </div>
            
            <div class="space-10"></div>
            
            <asp:RequiredFieldValidator ID="requiredTitulo" runat="server" ErrorMessage="El título es requerido" ControlToValidate="titulo" CssClass="errorMsg" SetFocusOnError="True" Display="Dynamic" Visible="True"></asp:RequiredFieldValidator>
            <br />
            <asp:RequiredFieldValidator ID="requiredCategoria" runat="server" ErrorMessage="La categoría es requerida" ControlToValidate="categoria" SetFocusOnError="True" Display="Dynamic" CssClass="errorMsg"></asp:RequiredFieldValidator>
            <br />
            <asp:RequiredFieldValidator ID="requiredConsejo" runat="server" ErrorMessage="El consejo es requerido" ControlToValidate="consejo" SetFocusOnError="True" Display="Dynamic" CssClass="errorMsg"></asp:RequiredFieldValidator>
        </div>
        <%}
            else{ 
        %>
        <div class="gen_form" id="form_buttons">
            <p class="subtitle"><b>PARA COMPARTIR TUS CONSEJOS...</b></p>
            <div class="space-10"></div>
            
            <asp:Button ID="login" runat="server" CssClass="button" Text="INICIA SESIÓN" TabIndex="1" />
            <div class="space-10"></div>
            <asp:Button ID="registro" runat="server" CssClass="button" Text="REGÍSTRATE AQUÍ" TabIndex="2" />
        </div>  

        <div class="gen_form" id="log_form" style="display:none;">
            <div class="subtitle">Por favor, indique su dirección de correo y contraseña para iniciar sesión.</div>
            <div class="space-10"></div>
        
            <asp:Label ID="labelEmail_l" runat="server" Text="Correo Electrónico" CssClass="label"></asp:Label><br />
            <asp:TextBox ID="email_l" runat="server" CssClass="input-text" MaxLength="60" ToolTip="Escriba su dirección de correo electrónico" CausesValidation="True" TabIndex="1"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredEmail_l" runat="server" ErrorMessage="El email es requerido" ValidationGroup="ValidacionLogin" ControlToValidate="email_l" CssClass="errorMsg" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="ValidateEmail_l" runat="server" ErrorMessage="Formato no válido" ValidationGroup="ValidacionLogin" ControlToValidate="email_l" Display="Dynamic" CssClass="errorMsg" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            <div class="space-5"></div>

            <asp:Label ID="labelContrasena_l" runat="server" CssClass="label" Text="Contraseña"></asp:Label> <br />
            <asp:TextBox ID="contrasena_l" runat="server" MaxLength="10" CssClass="input-text" TextMode="Password" CausesValidation="True" ToolTip="Escriba su contraseña" TabIndex="2"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredContrasena_l" runat="server" ErrorMessage="Escriba su contraseña" ValidationGroup="ValidacionLogin" ControlToValidate="contrasena_l" Display="Dynamic" CssClass="errorMsg"></asp:RequiredFieldValidator>
            <div class="space-5"></div>

            <p class="normal text-right"><a href="recuperarContrasena.aspx" class="mix">Olvidé mi contraseña</a></p>
            <div class="space-10"></div>
            <asp:Button ID="loginSubmit" runat="server" Text="Iniciar sesión" CssClass="button" OnClick="loginSubmit_Click" ControlToValidate="email_l" ViewStateMode="Inherit" ValidationGroup="ValidacionLogin" TabIndex="3" />
            <div class="space-10"></div>
        </div>

        <div id="form_registro" class="gen_form" style="display:none;">
            <div class="title">Regístrate</div>
            <div class="subtitle">Todos los campos son obligatorios.</div>
            <div class="space-10"></div>
                <asp:Label ID="LabelNombre" runat="server" CssClass="label" Text="Nombre"></asp:Label><br />
                <asp:TextBox ID="nombre" runat="server" CssClass="input-text small" MaxLength="100" ToolTip="Escriba su(s) nombre(s)" TabIndex="1"></asp:TextBox>
                    <br /><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Escriba su nombre" SetFocusOnError="True" ControlToValidate="nombre" Display="Dynamic" CssClass="errorMsg"></asp:RequiredFieldValidator>
                <div class="space-5"></div>

                <asp:Label ID="LabelAP" runat="server" CssClass="label" Text="Apellido paterno"></asp:Label><br />
                <asp:TextBox ID="apPaterno" runat="server" ToolTip="Escriba su apellido paterno" MaxLength="100" CssClass="input-text small" TabIndex="2"></asp:TextBox>
                    <br /><asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Escriba su apellido paterno" SetFocusOnError="True" ControlToValidate="apPaterno" Display="Dynamic" CssClass="errorMsg"></asp:RequiredFieldValidator>
                <div class="space-5"></div>

                <asp:Label ID="LabelAM" runat="server" CssClass="label" Text="Apellido materno"></asp:Label><br />
                <asp:TextBox ID="apMaterno" runat="server" CssClass="input-text small" ToolTip="Escriba su apellido materno" MaxLength="100" TabIndex="3"></asp:TextBox>
                 <br /><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Escriba su apellido materno" SetFocusOnError="True" ControlToValidate="apMaterno" Display="Dynamic" CssClass="errorMsg"></asp:RequiredFieldValidator>
                <div class="space-5"></div>

                <asp:Label ID="LabelEstado" runat="server" CssClass="label" Text="Estado"></asp:Label><br />
                <asp:DropDownList ID="estado" runat="server" CssClass="dropDownList" ToolTip="Seleccione el estado donde vive" TabIndex="4">
                    <asp:ListItem>Aguascalientes</asp:ListItem>
                    <asp:ListItem>Baja California</asp:ListItem>
                    <asp:ListItem>Baja California Sur</asp:ListItem>
                    <asp:ListItem>Campeche</asp:ListItem>
                    <asp:ListItem>Chiapas</asp:ListItem>
                    <asp:ListItem>Chihuahua</asp:ListItem>
                    <asp:ListItem>Coahuila</asp:ListItem>
                    <asp:ListItem>Colima</asp:ListItem>
                    <asp:ListItem>Distrito Federal</asp:ListItem>
                    <asp:ListItem>Durango</asp:ListItem>
                    <asp:ListItem>Estado de México</asp:ListItem>
                    <asp:ListItem>Guanajuato</asp:ListItem>
                    <asp:ListItem>Guerrero</asp:ListItem>
                    <asp:ListItem>Hidalgo</asp:ListItem>
                    <asp:ListItem>Jalisco</asp:ListItem>
                    <asp:ListItem>Michoacán</asp:ListItem>
                    <asp:ListItem>Morelos</asp:ListItem>
                    <asp:ListItem>Nayarit</asp:ListItem>
                    <asp:ListItem>Nuevo León</asp:ListItem>
                    <asp:ListItem>Oaxaca</asp:ListItem>
                    <asp:ListItem>Puebla</asp:ListItem>
                    <asp:ListItem>Querétaro</asp:ListItem>
                    <asp:ListItem>Quintana Roo</asp:ListItem>
                    <asp:ListItem>San Luis Potosí</asp:ListItem>
                    <asp:ListItem>Sinaloa</asp:ListItem>
                    <asp:ListItem>Sonora</asp:ListItem>
                    <asp:ListItem>Tabasco</asp:ListItem>
                    <asp:ListItem>Tamaulipas</asp:ListItem>
                    <asp:ListItem>Tlaxcala</asp:ListItem>
                    <asp:ListItem>Veracruz</asp:ListItem>
                    <asp:ListItem>Yucatán</asp:ListItem>
                    <asp:ListItem>Zacatecas</asp:ListItem>
                </asp:DropDownList>
            <br />
            <asp:RequiredFieldValidator ID="RequiredEstado" runat="server" ErrorMessage="Seleccione el estado donde vive" Display="Dynamic" CssClass="errorMsg" ControlToValidate="estado"></asp:RequiredFieldValidator>
                
                <div class="space-5"></div>

                <asp:Label ID="LabelFechaNac" runat="server" CssClass="label" Text="Fecha de nacimiento"></asp:Label>
                <br />
                <asp:DropDownList ID="dia" runat="server" TabIndex="5">
                    <asp:ListItem Value="">Día</asp:ListItem>
                </asp:DropDownList> 
                <asp:DropDownList ID="mes" runat="server" TabIndex="6">
                    <asp:ListItem Value="">Mes</asp:ListItem>
                    <asp:ListItem Value="01">Enero</asp:ListItem>
                    <asp:ListItem Value="02">Febrero</asp:ListItem>
                    <asp:ListItem Value="03">Marzo</asp:ListItem>
                    <asp:ListItem Value="04">Abril</asp:ListItem>
                    <asp:ListItem Value="05">Mayo</asp:ListItem>
                    <asp:ListItem Value="06">Junio</asp:ListItem>
                    <asp:ListItem Value="07">Julio</asp:ListItem>
                    <asp:ListItem Value="08">Agosto</asp:ListItem>
                    <asp:ListItem Value="09">Septiembre</asp:ListItem>
                    <asp:ListItem Value="10">Octubre</asp:ListItem>
                    <asp:ListItem Value="11">Noviembre</asp:ListItem>
                    <asp:ListItem Value="12">Diciembre</asp:ListItem>
                </asp:DropDownList> 
                <asp:DropDownList ID="anio" runat="server" TabIndex="7">
                     <asp:ListItem Value="">Año</asp:ListItem>
                </asp:DropDownList>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Seleccione el día" Display="Dynamic" CssClass="errorMsg" ControlToValidate="dia"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Seleccione el mes" Display="Dynamic" CssClass="errorMsg" ControlToValidate="mes"></asp:RequiredFieldValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Seleccione el año" Display="Dynamic" CssClass="errorMsg" ControlToValidate="anio"></asp:RequiredFieldValidator>
                <div class="errorMsg"><asp:Label ID="errorFNac" runat="server" Text=""></asp:Label></div>
                <div class="space-5"></div>

                <asp:Label ID="LabelEmail" runat="server" CssClass="label" Text="Correo electrónico"></asp:Label><br />
                <asp:TextBox ID="email" runat="server" ToolTip="Escriba su e-mail" MaxLength="100" CssClass="input-text small" TabIndex="8" Rows="8"></asp:TextBox>
                    <br /><asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Escriba su email" SetFocusOnError="True" ControlToValidate="email" Display="Dynamic" CssClass="errorMsg"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="El formato del correo no es válido" CssClass="errorMsg" Display="Dynamic" ControlToValidate="email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                <div class="space-5"></div>
                
                <asp:Label ID="LabelContrasena1" runat="server" CssClass="label" Text="Contraseña"></asp:Label><br />
                <asp:TextBox ID="contrasena" runat="server" ToolTip="Escriba una contraseña para esta cuenta" MaxLength="20" CssClass="input-text small" TabIndex="9" TextMode="Password" Rows="9"></asp:TextBox>
                    <br /><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Escriba su contraseña" SetFocusOnError="True" ControlToValidate="contrasena" Display="Dynamic" CssClass="errorMsg"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegExp1" runat="server" ErrorMessage="La contraseña debe tener entre 8 y 10 caracteres" Display="Dynamic" CssClass="errorMsg" ControlToValidate="contrasena" ValidationExpression="^[a-zA-Z0-9'@&#.\s]{8,10}$" />
                <div class="space-5"></div>

                <asp:Label ID="LabelContrasena2" runat="server" CssClass="label" Text="Confirmar contraseña"></asp:Label><br />
                <asp:TextBox ID="confirmContrasena" runat="server" ToolTip="Escriba de nuevo su contraseña" MaxLength="20" CssClass="input-text small" TabIndex="10" TextMode="Password" Rows="10"></asp:TextBox>
                    <br /><asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Las contraseñas no coinciden" ControlToValidate="confirmContrasena" ControlToCompare="contrasena" CssClass="errorMsg" Display="Dynamic"></asp:CompareValidator>    
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Confirme la contraseña" SetFocusOnError="True" ControlToValidate="confirmContrasena" Display="Dynamic" CssClass="errorMsg"></asp:RequiredFieldValidator>
                <div class="space-5"></div>

                <asp:CheckBox ID="acepto" runat="server" ToolTip="Acepto los Términos y Condiciones" CssClass="checkBox" TabIndex="11" />
                <asp:Label ID="LabelTyC" runat="server" CssClass="label" Text="Acepto los Términos y Condiciones y las Políticas de Privacidad"></asp:Label>
                    <br /><div class="errorMsg"><asp:Label ID="errorAcepto" runat="server" Text=""></asp:Label></div>
                <div class="space-5"></div>

                <asp:Button ID="regiterSubmit" runat="server" Text="Registrarme" ToolTip="Registrarme en Cal-C-Tose" CssClass="button small" TabIndex="12" OnClick="registerSubmit_Click" />
           </div>
        <%
        }
%>
    </div>
    
    <div id="col3-3">
        <p class="title">PROMOCIONES</p>
        <p class="subtitle">DISFRUTA DE LAS MEJORES PROMOCIONES QUE CAL-C-TOSE TIENE PARA TI</p>
        <div class="space-10"></div>

        <div id="promociones" class="sliderContainer">

        </div>

    </div>

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CCT2013ConnectionString2 %>" SelectCommand="SELECT * FROM [articulo]"></asp:SqlDataSource>
</asp:Content>

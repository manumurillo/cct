<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="WebSite.Registro" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Cal-C-Tose :: Formulario de Registro</title>
    <script type="text/javascript" src="scripts/form.js"></script>
    <script type="text/javascript" src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
    <script type="text/javascript" src="scripts/jquery.maskedinput.js"></script>
    <link rel="stylesheet" href="styles/jquery-ui.css" />
    <script type="text/javascript">
        jQuery(function () {
            jQuery("#ContentPlaceHolder1_fechaNacimiento").mask("9999/99/99");
        });
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="title">Regístrate</div>
    <div class="subtitle">Forma parte de nuestra comunidad para formar un <strong>Hogar Cal-C-Tose</strong></div>
        
    <div id="registro_form">
        <div class="column1">
            <asp:Label ID="LabelNombre" runat="server" CssClass="label" Text="Nombre"></asp:Label><br />
            <asp:TextBox ID="nombre" runat="server" CssClass="input-text small" MaxLength="100" ToolTip="Escriba su(s) nombre(s)" TabIndex="1"></asp:TextBox>
            <br /><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Escriba su nombre" SetFocusOnError="True" ControlToValidate="nombre" Display="Dynamic" CssClass="errorMsg"></asp:RequiredFieldValidator>
            <div class="space-10"></div>

            <asp:Label ID="LabelAM" runat="server" CssClass="label" Text="Apellido materno"></asp:Label>
            <br />
            <asp:TextBox ID="apMaterno" runat="server" CssClass="input-text small" ToolTip="Escriba su apellido materno" MaxLength="100" TabIndex="3"></asp:TextBox>
            <br /><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Escriba su apellido materno" SetFocusOnError="True" ControlToValidate="apMaterno" Display="Dynamic" CssClass="errorMsg"></asp:RequiredFieldValidator>
            <div class="space-10"></div>

            <asp:Label ID="LabelFechaNac" runat="server" CssClass="label" Text="Fecha de nacimiento"></asp:Label>
            <br />
            <asp:DropDownList ID="dia" runat="server">
                <asp:ListItem Value="">Día</asp:ListItem>
            </asp:DropDownList> 
            <asp:DropDownList ID="mes" runat="server">
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
            <asp:DropDownList ID="anio" runat="server">
                 <asp:ListItem Value="">Año</asp:ListItem>
            </asp:DropDownList>
            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Seleccione el día" Display="Dynamic" CssClass="errorMsg" ControlToValidate="dia"></asp:RequiredFieldValidator>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Seleccione el mes" Display="Dynamic" CssClass="errorMsg" ControlToValidate="mes"></asp:RequiredFieldValidator>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Seleccione el año" Display="Dynamic" CssClass="errorMsg" ControlToValidate="anio"></asp:RequiredFieldValidator>
            <div class="errorMsg"><asp:Label ID="errorFNac" runat="server" Text=""></asp:Label></div>
            <div class="space-10"></div>

            <asp:Label ID="LabelContrasena1" runat="server" CssClass="label" Text="Contraseña"></asp:Label><br />
            <asp:TextBox ID="contrasena" runat="server" ToolTip="Escriba una contraseña para esta cuenta" MaxLength="20" CssClass="input-text small" TabIndex="7" TextMode="Password"></asp:TextBox>
            <br /><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Escriba su contraseña" SetFocusOnError="True" ControlToValidate="contrasena" Display="Dynamic" CssClass="errorMsg"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegExp1" runat="server" ErrorMessage="La contraseña debe tener entre 8 y 10 caracteres" Display="Dynamic" CssClass="errorMsg" ControlToValidate="contrasena" ValidationExpression="^[a-zA-Z0-9'@&#.\s]{8,10}$" />
            <div class="space-10"></div>
        </div>

        <div class="column2">
            <asp:Label ID="LabelAP" runat="server" CssClass="label" Text="Apellido paterno"></asp:Label><br />
            <asp:TextBox ID="apPaterno" runat="server" ToolTip="Escriba su apellido paterno" MaxLength="100" CssClass="input-text small" TabIndex="2"></asp:TextBox>
            <br /><asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Escriba su apellido paterno" SetFocusOnError="True" ControlToValidate="apPaterno" Display="Dynamic" CssClass="errorMsg"></asp:RequiredFieldValidator>
            <div class="space-10"></div>

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
            <div class="space-10"></div>

            <asp:Label ID="LabelEmail" runat="server" CssClass="label" Text="Correo electrónico"></asp:Label><br />
            <asp:TextBox ID="email" runat="server" ToolTip="Escriba su e-mail" MaxLength="100" CssClass="input-text small" TabIndex="6"></asp:TextBox>
            <br /><asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Escriba su email" SetFocusOnError="True" ControlToValidate="email" Display="Dynamic" CssClass="errorMsg"></asp:RequiredFieldValidator>            
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="El formato del correo no es válido" CssClass="errorMsg" Display="Dynamic" ControlToValidate="email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            <div class="space-10"></div>

            <asp:Label ID="LabelContrasena2" runat="server" CssClass="label" Text="Confirmar contraseña"></asp:Label><br />
            <asp:TextBox ID="confirmContrasena" runat="server" ToolTip="Escriba de nuevo su contraseña" MaxLength="20" CssClass="input-text small" TabIndex="8" TextMode="Password"></asp:TextBox>
            <br /><asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Confirme la contraseña" SetFocusOnError="True" ControlToValidate="confirmContrasena" Display="Dynamic" CssClass="errorMsg"></asp:RequiredFieldValidator>
            <div class="space-10"></div>
        </div>

        <div class="center">
            <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Las contraseñas no coinciden" ControlToValidate="confirmContrasena" ControlToCompare="contrasena" CssClass="errorMsg"></asp:CompareValidator>
            <div class="space-10"></div>
            <asp:CheckBox ID="acepto" runat="server" ToolTip="Acepto los Términos y Condiciones" CssClass="checkBox" />
            <asp:Label ID="LabelTyC" runat="server" CssClass="label" Text="Acepto los Términos y Condiciones y las Políticas de Privacidad" TabIndex="9"></asp:Label>
            <br /><div class="errorMsg"><asp:Label ID="errorAcepto" runat="server" Text=""></asp:Label></div>
            <div class="space-10"></div>

            <asp:Button ID="submit" runat="server" Text="Registrarme" ToolTip="Registrarme en Cal-C-Tose" CssClass="button small" TabIndex="10" OnClick="submit_Click" />
        </div>
        <div class="space-10"></div>

        <asp:Label ID="resultado" runat="server" Text=""></asp:Label>
    </div>
</asp:Content>

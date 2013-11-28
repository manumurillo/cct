<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="recuperarContrasena.aspx.cs" Inherits="WebSite.recuperarContrasena" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Cal-C-Tose :: Recuperar contraseña</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="login_form" runat="server" style="width:300px; margin-left:60px;">
        <div class="title">¿Olvidó su contraseña?
        </div>
        <div class="subtitle">Por favor, indique su dirección de correo. Le enviaremos los pasos para que pueda recuperar su contraseña.</div> <br />
        <asp:Label ID="errorRecovery" runat="server" CssClass="errorMsg"></asp:Label>
    
            <div class="space-10"></div>
        
        <asp:Label ID="labelEmail" runat="server" Text="Correo Electrónico*" CssClass="label"></asp:Label><br />
            <asp:RequiredFieldValidator ID="RequiredEmail" runat="server" ErrorMessage="El email es requerido" ValidationGroup="ValidacionLogin" ControlToValidate="email" CssClass="errorMsg" Display="Dynamic"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="ValidateEmail" runat="server" ErrorMessage="Formato no válido" ValidationGroup="ValidacionLogin" ControlToValidate="email" Display="Dynamic" CssClass="errorMsg" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
        <br />
        <asp:TextBox ID="email" runat="server" CssClass="input-text" MaxLength="60" ToolTip="Dirección de correo electrónico" CausesValidation="True"></asp:TextBox>
        <div class="space-5"></div>

        <div class="space-10"></div>
        <asp:Button ID="submit" runat="server" Text="Enviar" CssClass="button" OnClick="submit_Click" ViewStateMode="Inherit" ValidationGroup="ValidacionLogin" />
        <div class="space-10"></div>
    </div>

    <div id="respuesta" runat="server">
        <div class="title">¡En horabuena!</div>
        <div class="subtitle">Su petición ha sido enviada con éxito. Revise su e-mail para continuar con el proceso de recuperación de su contraseña.</div> <br />
    </div>
</asp:Content>

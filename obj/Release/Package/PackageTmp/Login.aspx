<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebSite.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Cal-C-Tose :: Iniciar sesión</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="login_form">
        <div class="subtitle">Por favor, indique su dirección de correo y contraseña para iniciar sesión.</div> <br />
        <asp:Label ID="errorSesion" runat="server" Text=""></asp:Label>
    
            <div class="space-10"></div>
        
        <asp:Label ID="labelEmail" runat="server" Text="Correo Electrónico" CssClass="label"></asp:Label>
            <asp:RequiredFieldValidator ID="RequiredEmail" runat="server" ErrorMessage="El email es requerido" ValidationGroup="ValidacionLogin" ControlToValidate="email" CssClass="errorMsg" Display="Dynamic"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="ValidateEmail" runat="server" ErrorMessage="Formato no válido" ValidationGroup="ValidacionLogin" ControlToValidate="email" Display="Dynamic" CssClass="errorMsg" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
        <br />
        <asp:TextBox ID="email" runat="server" CssClass="input-text" MaxLength="60" ToolTip="Dirección de correo electrónico" CausesValidation="True"></asp:TextBox>
        <div class="space-5"></div>

        <asp:Label ID="labelContrasena" runat="server" CssClass="label" Text="Contraseña"></asp:Label> 
            <asp:RequiredFieldValidator ID="RequiredContrasena" runat="server" ErrorMessage="Escriba su contraseña" ValidationGroup="ValidacionLogin" ControlToValidate="contrasena" Display="Dynamic" CssClass="errorMsg"></asp:RequiredFieldValidator>    <br />
        <asp:TextBox ID="contrasena" runat="server" MaxLength="10" CssClass="input-text" TextMode="Password" CausesValidation="True"></asp:TextBox>
        <div class="space-5"></div>

        <p class="normal text-right"><a href="recuperarContrasena" class="mix">Olvidé mi contraseña</a></p>
        <div class="space-10"></div>
        <asp:Button ID="submit" runat="server" Text="Iniciar sesión" CssClass="button" OnClick="submit_Click" ControlToValidate="email" ViewStateMode="Inherit" ValidationGroup="ValidacionLogin" />
        <div class="space-10"></div>
    </div>
</asp:Content>

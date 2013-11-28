<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="cambiarContrasena.aspx.cs" Inherits="WebSite.cambiarContrasena" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="login_form" runat="server" style="width:300px; margin-left:60px;">
        <div class="title">Recuperación de contraseña
        </div>
        <div class="subtitle">A continuación, introduzca la clave que le fue proporcionada a través de su dirección de correo electrónico y  proceda a cambiar su contraseña. </div> <br />
        <asp:Label ID="errorRecovery" runat="server" CssClass="errorMsg"></asp:Label>
    
            <div class="space-10"></div>
        
        <asp:Label ID="LabelCveRecuperacion" runat="server" Text="Clave de recuperación*" CssClass="label"></asp:Label><br />
        <asp:TextBox ID="cveRecuperacion" runat="server" CssClass="input-text" MaxLength="60" ToolTip="Clave de recuperación de contraseña" CausesValidation="True" TabIndex="1"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredCve" runat="server" ErrorMessage="Clave de recuperación obligatoria" ValidationGroup="ValidacionLogin" ControlToValidate="cveRecuperacion" CssClass="errorMsg" Display="Dynamic"></asp:RequiredFieldValidator>
        <div class="space-5"></div>

        <asp:Label ID="LabelContrasena" runat="server" Text="Contraseña nueva*" CssClass="label"></asp:Label><br />
        <asp:TextBox ID="contrasena" runat="server" CssClass="input-text" MaxLength="10" ToolTip="Escriba su nueva contraseña" CausesValidation="True" TextMode="Password" TabIndex="2"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Escriba su contraseña" ValidationGroup="ValidacionLogin" ControlToValidate="contrasena" CssClass="errorMsg" Display="Dynamic"></asp:RequiredFieldValidator> 
            &nbsp;<asp:RegularExpressionValidator ID="RegExp1" runat="server" ErrorMessage="La contraseña debe tener entre 8 y 10 caracteres" Display="Dynamic" CssClass="errorMsg" ControlToValidate="contrasena" ValidationExpression="^[a-zA-Z0-9'@&#.\s]{8,10}$" /> 
        <div class="space-5"></div>

        <asp:Label ID="LabelContrasena2" runat="server" CssClass="label" Text="Confirmar contraseña"></asp:Label><br /> 
        <asp:TextBox ID="confirmContrasena" runat="server" ToolTip="Escriba de nuevo su contraseña" MaxLength="20" CssClass="input-text" TabIndex="3" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Confirme la contraseña" SetFocusOnError="True" ControlToValidate="confirmContrasena" Display="Dynamic" CssClass="errorMsg"></asp:RequiredFieldValidator>
            &nbsp;<asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Las contraseñas no coinciden" ControlToValidate="confirmContrasena" ControlToCompare="contrasena" CssClass="errorMsg"></asp:CompareValidator>
         <div class="space-10"></div>

        <asp:Button ID="submit" runat="server" Text="Cambiar contraseña" CssClass="button" OnClick="submit_Click" ViewStateMode="Inherit" ValidationGroup="ValidacionLogin" TabIndex="4" />
        <div class="space-10"></div>
    </div>

    <div id="respuesta" runat="server">
        <div class="title">¡En horabuena!</div>
        <div class="subtitle">Su contraseña ha sido cambiada con éxito. Por favor, revise su correo electrónico. </div> <br />
    </div>

    <div id="error" runat="server">
        <div class="title err">¡Error!</div>
        <div class="subtitle">La página que ha solicitado no es válida o ha caducado. </div> <br />
    </div>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Sample.aspx.cs" Inherits="WebSite.Sample" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="id" DataSourceID="SqlDataSource1">
        <ItemTemplate>
            <span style="">id:
            <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
            <br />
            titulo:
            <asp:Label ID="tituloLabel" runat="server" Text='<%# Eval("titulo") %>' />
            <br />
            resumen:
            <asp:Label ID="resumenLabel" runat="server" Text='<%# Eval("resumen") %>' />
            <br />
            contenido:
            <asp:Label ID="contenidoLabel" runat="server" Text='<%# Eval("contenido") %>' />
            <br />
            thumbnail:
            <asp:Label ID="thumbnailLabel" runat="server" Text='<%# Eval("thumbnail") %>' />
            <br />
            vistas:
            <asp:Label ID="vistasLabel" runat="server" Text='<%# Eval("vistas") %>' />
            <br />
            fecha_creacion:
            <asp:Label ID="fecha_creacionLabel" runat="server" Text='<%# Eval("fecha_creacion") %>' />
            <br />
            fecha_actualizacion:
            <asp:Label ID="fecha_actualizacionLabel" runat="server" Text='<%# Eval("fecha_actualizacion") %>' />
            <br />
            id_categoria:
            <asp:Label ID="id_categoriaLabel" runat="server" Text='<%# Eval("id_categoria") %>' />
            <br />
            id_registro_usuario:
            <asp:Label ID="id_registro_usuarioLabel" runat="server" Text='<%# Eval("id_registro_usuario") %>' />
            <br />
            plantilla:
            <asp:Label ID="plantillaLabel" runat="server" Text='<%# Eval("plantilla") %>' />
            <br />
            id1:
            <asp:Label ID="id1Label" runat="server" Text='<%# Eval("id1") %>' />
            <br />
            nombre:
            <asp:Label ID="nombreLabel" runat="server" Text='<%# Eval("nombre") %>' />
            <br />
            apellidoPaterno:
            <asp:Label ID="apellidoPaternoLabel" runat="server" Text='<%# Eval("apellidoPaterno") %>' />
            <br />
            apellidoMaterno:
            <asp:Label ID="apellidoMaternoLabel" runat="server" Text='<%# Eval("apellidoMaterno") %>' />
            <br />
            email:
            <asp:Label ID="emailLabel" runat="server" Text='<%# Eval("email") %>' />
            <br />
            estado:
            <asp:Label ID="estadoLabel" runat="server" Text='<%# Eval("estado") %>' />
            <br />
            contrasena:
            <asp:Label ID="contrasenaLabel" runat="server" Text='<%# Eval("contrasena") %>' />
            <br />
            fechaIngreso:
            <asp:Label ID="fechaIngresoLabel" runat="server" Text='<%# Eval("fechaIngreso") %>' />
            <br />
            fechaNacimiento:
            <asp:Label ID="fechaNacimientoLabel" runat="server" Text='<%# Eval("fechaNacimiento") %>' />
            <br />
            id2:
            <asp:Label ID="id2Label" runat="server" Text='<%# Eval("id2") %>' />
            <br />
            nombre1:
            <asp:Label ID="nombre1Label" runat="server" Text='<%# Eval("nombre1") %>' />
            <br />
            descripcion:
            <asp:Label ID="descripcionLabel" runat="server" Text='<%# Eval("descripcion") %>' />
            <br />
            <br />
            </span>
        </ItemTemplate>
        <LayoutTemplate>
            <div id="itemPlaceholderContainer" runat="server" style="">
                <span runat="server" id="itemPlaceholder" />
            </div>
            <div style="">
                <asp:DataPager ID="DataPager1" runat="server">
                    <Fields>
                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                        <asp:NumericPagerField />
                        <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" />
                    </Fields>
                </asp:DataPager>
            </div>
        </LayoutTemplate>
    </asp:ListView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CCT2013ConnectionString %>" SelectCommand="SELECT * FROM dbo.articulo ART LEFT JOIN dbo.registro_usuario USU ON USU.id = ART.id_registro_usuario LEFT JOIN dbo.categoria CAT ON CAT.id = ART.id_categoria WHERE ART.id_registro_usuario != 14 ORDER BY fecha_creacion DESC"></asp:SqlDataSource>
</asp:Content>

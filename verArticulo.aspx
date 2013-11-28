<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="verArticulo.aspx.cs" Inherits="WebSite.verArticulo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px" AutoGenerateRows="False" DataSourceID="SqlDataSource1" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" GridLines="None">
        <EditRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White"></EditRowStyle>
        <Fields>
            <asp:BoundField DataField="titulo" HeaderText="titulo" SortExpression="titulo"></asp:BoundField>
            <asp:BoundField DataField="resumen" HeaderText="resumen" SortExpression="resumen"></asp:BoundField>
            <asp:BoundField DataField="contenido" HeaderText="contenido" SortExpression="contenido"></asp:BoundField>
            <asp:BoundField DataField="fecha_creacion" HeaderText="fecha_creacion" SortExpression="fecha_creacion"></asp:BoundField>
            <asp:BoundField DataField="cat_nombre" HeaderText="cat_nombre" SortExpression="cat_nombre"></asp:BoundField>
            <asp:BoundField DataField="nombre" HeaderText="nombre" SortExpression="nombre"></asp:BoundField>
        </Fields>
        <FooterStyle BackColor="#C6C3C6" ForeColor="Black"></FooterStyle>

        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF"></HeaderStyle>

        <PagerStyle HorizontalAlign="Right" BackColor="#C6C3C6" ForeColor="Black"></PagerStyle>

        <RowStyle BackColor="#DEDFDE" ForeColor="Black"></RowStyle>
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:CCT2013ConnectionString %>' SelectCommand="SELECT art.titulo, art.resumen, art.contenido, art.fecha_creacion, cat.nombre AS cat_nombre, usu.nombre FROM articulo AS art, categoria AS cat, registro_usuario AS usu 
WHERE (art.id = @id) and art.id_registro_usuario = usu.id and art.id_categoria = cat.id">
        <SelectParameters>
            <asp:QueryStringParameter QueryStringField="numero" Name="id" Type="Int32"></asp:QueryStringParameter>
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

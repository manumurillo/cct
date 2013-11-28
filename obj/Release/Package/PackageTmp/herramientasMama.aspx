<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="herramientasMama.aspx.cs" Inherits="WebSite.herramientasMama" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Cal-C-Tose :: Herramientas de mamá</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="wrapper">
        <div id="Div1">
            <div id="top">
                <div id="columnaIzq">
                    La Tabla de pesos y medidas
                </div>
                <div id="columnaCen">
                    <p style="width: 555; margin: 6px 55px 0 40px;">
                        A continuaci&oacute;n, se muestra una tabla de pesos y medidas en los ni&ntilde;os y ni&ntilde;as para identificar
                        si nuestro hijo est&aacute; en el peso y talla adecuado seg&uacute;n su edad.
                    </p>
                </div>
                <div id="columnaDer">
                    <a href="Default.aspx"><img src="images/menu_elements/calctose_home.png" class="img" alt="Home"/></a>
                </div>
            </div>
            <div id="tabla">
                <table cellpadding="1" cellspacing="1">
                <tr>
                    <td colspan="4" align="center"></td>
                </tr>
                <tr>
                    <td colspan="4">&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td colspan="2" align="center" style="color:#4e292b; font-family:Helvetical, Arial; font-size:10pt; font-weight:bold ">Ni&ntilde;os</td>
                    <td colspan="2" align="center" style="color:#4e292b; font-family:Helvetical, Arial; font-size:10pt; font-weight:bold;">Ni&ntilde;as</td>
                </tr>
                <tr style="color:#fff; font-family:Helvetical, Arial; font-size:10pt;">
                    <th align="center" bgcolor="#4e292b">Edad Peso (grs.)</th>
                    <th align="center" bgcolor="#4e292b">Peso(grs.)</th>
                    <th align="center" bgcolor="#4e292b">Altura (cm.)</th>
                    <th align="center" bgcolor="#4e292b">Peso(grs.)</th>
                    <th align="center" bgcolor="#4e292b">Altura(cm.)</th>
                </tr>
                <tr>
                    <td align="center" class="celda cafe">3 a&ntilde;os</td>
                    <td align="center" class="celda azul">14.3</td>
                    <td align="center" class="celda azul">96.1</td>
                    <td align="center" class="celda rosa">13.9</td>
                    <td align="center" class="celda rosa">95.1</td>
                </tr>
                <tr>
                    <td align="center" class="celda cafe">4 a&ntilde;os</td>
                    <td align="center" class="celda azul">16.3</td>
                    <td align="center" class="celda azul">103.3</td>
                    <td align="center" class="celda rosa">16.1</td>
                    <td align="center" class="celda rosa">102.7</td>
                </tr>
                <tr>
                    <td align="center" class="celda cafe">5 a&ntilde;os</td>
                    <td align="center" class="celda azul">18.3</td>
                    <td align="center" class="celda azul">110.0</td>
                    <td align="center" class="celda rosa">18.2</td>
                    <td align="center" class="celda rosa">109.4</td>
                </tr>
                <tr>
                    <td align="center" class="celda cafe">6 a&ntilde;os</td>
                    <td align="center" class="celda azul">20.5</td>
                    <td align="center" class="celda azul">116.0</td>
                    <td align="center" class="celda rosa">20.2</td>
                    <td align="center" class="celda rosa">115.1</td>
                </tr>
                <tr>
                    <td align="center" class="celda cafe">7 a&ntilde;os</td>
                    <td align="center" class="celda azul">22.9</td>
                    <td align="center" class="celda azul">121.7</td>
                    <td align="center" class="celda rosa">22.4</td>
                    <td align="center" class="celda rosa">120.8</td>
                </tr>
                <tr>
                    <td align="center" class="celda cafe"> 8 a&ntilde;os</td>
                    <td align="center" class="celda azul">25.4</td>
                    <td align="center" class="celda azul">127.3</td>
                    <td align="center" class="celda rosa">25.0</td>
                    <td align="center" class="celda rosa">126.6</td>
                </tr>
                <tr>
                    <td align="center" class="celda cafe">9 a&ntilde;os</td>
                    <td align="center" class="celda azul">28.1</td>
                    <td align="center" class="celda azul">132.6</td>
                    <td align="center" class="celda rosa">28.2</td>
                    <td align="center" class="celda rosa">132.5</td>
                </tr>
                <tr>
                    <td align="center" class="celda cafe">10 a&ntilde;os</td>
                    <td align="center" class="celda azul">31.2</td>
                    <td align="center" class="celda azul">137.8</td>
                    <td align="center" class="celda rosa">31.9</td>
                    <td align="center" class="celda rosa">138.6</td>
                </tr>
                <tr>
                    <td align="center" class="celda cafe">11 a&ntilde;os</td>
                    <td align="center" class="celda azul">34.6</td>
                    <td align="center" class="celda azul">143.1</td>
                    <td align="center" class="celda rosa">35.5</td>
                    <td align="center" class="celda rosa">145.0</td>
                </tr>
                </table>
            </div>
            <div id="referencias"  class="references">
                <p><span class="referencesLi">ALIM&Eacute;NTATE SANAMENTE</span></p>
                <p>
                    NOTA: <span class="referencesLi">Para un monitoreo adecuado y personalizado del crecimiento consulta
                    a un profesional de la salud.</span>
                </p>
                <p>
                    <span >&nbsp;&nbsp;&nbsp;&nbsp;*Peso edad de 5 a 19 a&ntilde;os:</span> 
                    <a href="http://www.who.int/growthref/who2007_weight_for_age/en/index.html">
                    http://www.who.int/growthref/who2007_weight_for_age/en/index.html</a>
                </p>
                <p>
                    <span>&nbsp;&nbsp;&nbsp;&nbsp;*Altura edad de 5 a 19 a&ntilde;os:</span>
                    <a href="http://www.who.int/growthref/who2007_height_for_age/en/index.html">
                    http://www.who.int/growthref/who2007_height_for_age/en/index.html</a>
                </p>
                <p>
                    <span>&nbsp;&nbsp;&nbsp;&nbsp;*Peso edad de 0 a 5 a&ntilde;os:</span>
                    <a href="http://www.who.int/childgrowth/standards/chts_wfa_girls_z/en/index.html">
                    http://www.who.int/childgrowth/standards/chts_wfa_girls_z/en/index.html</a>
                </p>
                <p>
                    <span>&nbsp;&nbsp;&nbsp;&nbsp;*Altura edad de 0 a 5 a&ntilde;os:</span>
                    <a href="http://www.who.int/childgrowth/standards/height_for_age/en/index.html">
                    http://www.who.int/childgrowth/standards/height_for_age/en/index.html</a>
                </p><br />
                <p   class="referencesFoot">Descubre pr&oacute;ximamente una colecci&oacute;n de herramientas para    apoyar tus tareas diarias de mam&aacute;</p>
            </div>
        </div>
    </div>
</asp:Content>

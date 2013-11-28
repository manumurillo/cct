<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="comparteConsejos.aspx.cs" Inherits="WebSite.comparteConsejos" %>
<%@ Register assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI.DataVisualization.Charting" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>cal-C-Tose :: Comparte tus consejos</title>
    <link rel="stylesheet" href="styles/jquery-ui.css" />
    <script type="text/javascript" src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
    <style type="text/css">
        div#content{ background: #ffffff; font-size: 12px; border: 0; }
        div#raya{ border-bottom: 1px solid #AAC438; width: 950px; height: 2px; opacity: .5;}
        div#raya2{ border-bottom: 1px solid #AAC438; width: 100%; height: 2px; opacity: .5;}
    </style>
    <script type="text/javascript">
        jQuery(function () {
            jQuery(document).tooltip({
                track: true
            });

            jQuery("#ContentPlaceHolder1_login").on("click", function (e) {
                e.preventDefault();
                jQuery("#form_buttons").fadeOut(100);
                jQuery("#log_form").fadeIn(100);
                //jQuery("#ContentPlaceHolder1_email_l").focus();
            });

            jQuery("#ContentPlaceHolder1_registro").on("click", function (e) {
                e.preventDefault();
                jQuery("#form_buttons").fadeOut(100);
                jQuery("#form_registro").fadeIn(100);
                //jQuery("#ContentPlaceHolder1_nombre").focus();
                jQuery("#col2-3").css("height", "860px");

            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="wrapper">
        <div id="content" class="sec_consejos">
            <div id="top_comparte">
                <p>COMPARTE TUS CONSEJOS</p>
                <div id="raya"></div>
                <div id="elige_cat">
                    ELIGE UNA CATEGOR&Iacute;A:&nbsp;
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource3" DataTextField="nombre" DataValueField="id" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged1" AutoPostBack="True"></asp:DropDownList>
                    <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:CCT2013ConnectionString %>' SelectCommand="SELECT [id], [nombre] FROM [categoria] ORDER BY [id] DESC"></asp:SqlDataSource>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CCT2013ConnectionString %>" SelectCommand="SELECT [nombre], [id] FROM [categoria] ORDER BY [id] DESC"></asp:SqlDataSource>
                </div>
                <div id="busca_tip" style="text-align: right;">
                    <!--BUSCAR:
                    <input type="text" />-->
                </div>
            </div>
            <div id="consejos">
                <div id="colIzq">
                    <div class="consejo">
                        <asp:DataList ID="DataList1" runat="server" DataKeyField="id" DataSourceID="SqlDataSource1" RepeatLayout="Flow">
                            <ItemTemplate>
                                <div class="consejo_title">
                                    <span class="titulo">
                                        <asp:Label ID="tituloLabel" runat="server" Text='<%# Eval("titulo") %>' /></span>
                                    <span class="fecha">
                                        <span class="categoria">
                                            <asp:Label ID="nombre1Label" runat="server" Text='<%# Eval("nombre1") %>' /></span> - 
                                        <asp:Label ID="fecha_creacionLabel" runat="server" Text='<%# Eval("fecha_creacion") %>' />
                                    </span>

                                </div>
                                <div class="consejo_body">
                                    <div class="consejo_txt">
                                        <p>
                                            <asp:Label ID="resumenLabel" runat="server" Text='<%# Eval("resumen") %>' />
                                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "Articulo.aspx?numero=" + Eval("id1").ToString() %>' Text='Leer más' CssClass="light">
                                            </asp:HyperLink>
                                        </p>
                                        <!--<span>Twitter</span><span>Facebook</span>-->
                                    </div>
                                    <div class="consejo_img">
                                        <img src="images/user.png">
                                        <p>
                                            <asp:Label ID="nombreLabel" runat="server" Text='<%# Eval("nombre") %>' />
                                            <asp:Label ID="apellidoPaternoLabel" runat="server" Text='<%# Eval("apellidoPaterno") %>' />
                                        </p>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:DataList>
                    </div>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CCT2013ConnectionString %>" SelectCommand="SELECT * FROM dbo.articulo ART LEFT JOIN dbo.registro_usuario USU ON USU.id = ART.id_registro_usuario LEFT JOIN dbo.categoria CAT ON CAT.id = ART.id_categoria;"></asp:SqlDataSource>
            </div>
            <div id="colDer">
            <!--<div id="redes">
                <p><strong>S&Iacute;GUENOS EN TWITTER Y FACEBOOK</strong></p>
                <div class="twitter">TWITTER</div>
                <div class="face">FACEBOOK</div>
            </div>-->
            <div id="raya2"></div>
            <div id="compartir">
                <p class="title">COMPARTE TUS CONSEJOS</p>
                <p class="subtitle">CON OTRAS MAMÁS</p>
                <div class="space-10"></div>
        
                <%
                    if (Session["usr_status"] != null)
                    {
                %>
                <div class="gen_form" id="form_consejos">
       
                    <div class="result center">
                        <asp:Label ID="resultado_consejo" runat="server"></asp:Label>
                    </div>
                    <div class="space-5"></div>
           
                    <asp:Label ID="Label1" runat="server" CssClass="label">TÍTULO</asp:Label><br />
                    <asp:TextBox ID="titulo" CssClass="input-text" runat="server"></asp:TextBox>
                    <div class="space-5"></div>
                    <asp:Label ID="Label2" runat="server" CssClass="label">CATEGORÍA</asp:Label><br />
                    <asp:DropDownList ID="categoria" runat="server" DataSourceID="SqlDataSource2" DataTextField="nombre" DataValueField="id">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:CCT2013ConnectionString %>" SelectCommand="SELECT [id], [nombre] FROM [categoria] ORDER BY [id]"></asp:SqlDataSource>
                    <div class="space-5"></div>
            
                    <asp:Label ID="Label3" runat="server" CssClass="label">TU CONSEJO</asp:Label><br />
                    <asp:TextBox ID="consejo" CssClass="input-text" runat="server" TextMode="MultiLine" Height="100px"></asp:TextBox>
                    <div class="space-10"></div>
                    <asp:Button ID="Button1" runat="server" CssClass="button" Text="COMPARTIR" OnClick="compartir_Click" />
            
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
                    <div class="space-10"></div>
                    <p class="subtitle"><b>PARA COMPARTIR TUS CONSEJOS...</b></p>

                    <div class="space-10"></div>
                    <asp:Button ID="login" runat="server" CssClass="button" Text="INICIA SESIÓN" OnClick="login_Click" />

                    <div class="space-10"></div>
                    <asp:Button ID="registro" runat="server" CssClass="button" Text="REGÍSTRATE AQUÍ" OnClick="registro_Click" />
                </div>  

                <div class="gen_form" id="log_form" style="display:none;">
                    <div class="subtitle">Por favor, indique su dirección de correo y contraseña para iniciar sesión.</div> <br />
                    <asp:Label ID="errorSesion" runat="server" Text=""></asp:Label>
    
                        <div class="space-10"></div>
        
                    <asp:Label ID="labelEmail_l" runat="server" Text="Correo Electrónico" CssClass="label"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredEmail_l" runat="server" ErrorMessage="El email es requerido" ValidationGroup="ValidacionLogin" ControlToValidate="email_l" CssClass="errorMsg" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="ValidateEmail_l" runat="server" ErrorMessage="Formato no válido" ValidationGroup="ValidacionLogin" ControlToValidate="email_l" Display="Dynamic" CssClass="errorMsg" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    <br />
                    <asp:TextBox ID="email_l" runat="server" CssClass="input-text" MaxLength="60" ToolTip="Escriba su dirección de correo electrónico" CausesValidation="True"></asp:TextBox>
                    <div class="space-5"></div>

                    <asp:Label ID="labelContrasena_l" runat="server" CssClass="label" Text="Contraseña"></asp:Label> 
                        <asp:RequiredFieldValidator ID="RequiredContrasena_l" runat="server" ErrorMessage="Escriba su contraseña" ValidationGroup="ValidacionLogin" ControlToValidate="contrasena_l" Display="Dynamic" CssClass="errorMsg"></asp:RequiredFieldValidator>    <br />
                    <asp:TextBox ID="contrasena_l" runat="server" MaxLength="10" CssClass="input-text" TextMode="Password" CausesValidation="True" ToolTip="Escriba su contraseña"></asp:TextBox>
                    <div class="space-5"></div>

                    <p class="normal text-right"><a href="recuperarContrasena" class="mix">Olvidé mi contraseña</a></p>
                    <div class="space-10"></div>
                    <asp:Button ID="loginSubmit" runat="server" Text="Iniciar sesión" CssClass="button" OnClick="loginSubmit_Click" ControlToValidate="email_l" ViewStateMode="Inherit" ValidationGroup="ValidacionLogin" />
                    <div class="space-10"></div>
                </div>

                <div id="form_registro" class="gen_form" style="display:none;">
                    <div class="title">Regístrate</div>
                    <div class="subtitle">Forma parte de nuestra comunidad para formar un <strong>Hogar Cal-C-Tose</strong></div>
                    <div class="space-10"></div>
                        <asp:Label ID="LabelNombre" runat="server" CssClass="label" Text="Nombre"></asp:Label><br />
                        <asp:TextBox ID="nombre" runat="server" CssClass="input-text small" MaxLength="100" ToolTip="Escriba su(s) nombre(s)" TabIndex="1"></asp:TextBox>
                        <br /><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Escriba su nombre" SetFocusOnError="True" ControlToValidate="nombre" Display="Dynamic" CssClass="errorMsg"></asp:RequiredFieldValidator>
                        <div class="space-5"></div>

                        <asp:Label ID="LabelAP" runat="server" CssClass="label" Text="Apellido paterno"></asp:Label><br />
                        <asp:TextBox ID="apPaterno" runat="server" ToolTip="Escriba su apellido paterno" MaxLength="100" CssClass="input-text small" TabIndex="2"></asp:TextBox>
                        <br /><asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Escriba su apellido paterno" SetFocusOnError="True" ControlToValidate="apPaterno" Display="Dynamic" CssClass="errorMsg"></asp:RequiredFieldValidator>
                        <div class="space-5"></div>

                        <asp:Label ID="LabelAM" runat="server" CssClass="label" Text="Apellido materno"></asp:Label>
                        <br />
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
                        <div class="space-5"></div>

                        <asp:Label ID="LabelEmail" runat="server" CssClass="label" Text="Correo electrónico"></asp:Label><br />
                        <asp:TextBox ID="email" runat="server" ToolTip="Escriba su e-mail" MaxLength="100" CssClass="input-text small" TabIndex="6"></asp:TextBox>
                        <br /><asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Escriba su email" SetFocusOnError="True" ControlToValidate="email" Display="Dynamic" CssClass="errorMsg"></asp:RequiredFieldValidator>            
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="El formato del correo no es válido" CssClass="errorMsg" Display="Dynamic" ControlToValidate="email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                        <div class="space-5"></div>
                
                        <asp:Label ID="LabelContrasena1" runat="server" CssClass="label" Text="Contraseña"></asp:Label><br />
                        <asp:TextBox ID="contrasena" runat="server" ToolTip="Escriba una contraseña para esta cuenta" MaxLength="20" CssClass="input-text small" TabIndex="7" TextMode="Password"></asp:TextBox>
                        <br /><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Escriba su contraseña" SetFocusOnError="True" ControlToValidate="contrasena" Display="Dynamic" CssClass="errorMsg"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegExp1" runat="server" ErrorMessage="La contraseña debe tener entre 8 y 10 caracteres" Display="Dynamic" CssClass="errorMsg" ControlToValidate="contrasena" ValidationExpression="^[a-zA-Z0-9'@&#.\s]{8,10}$" />
                        <div class="space-5"></div>

                        <asp:Label ID="LabelContrasena2" runat="server" CssClass="label" Text="Confirmar contraseña"></asp:Label><br />
                        <asp:TextBox ID="confirmContrasena" runat="server" ToolTip="Escriba de nuevo su contraseña" MaxLength="20" CssClass="input-text small" TabIndex="8" TextMode="Password"></asp:TextBox>
                        <br /><asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Las contraseñas no coinciden" ControlToValidate="confirmContrasena" ControlToCompare="contrasena" CssClass="errorMsg"></asp:CompareValidator>    
                        <br /><asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Confirme la contraseña" SetFocusOnError="True" ControlToValidate="confirmContrasena" Display="Dynamic" CssClass="errorMsg"></asp:RequiredFieldValidator>
                        <div class="space-5"></div>

                        <asp:CheckBox ID="acepto" runat="server" ToolTip="Acepto los Términos y Condiciones" CssClass="checkBox" />
                        <asp:Label ID="LabelTyC" runat="server" CssClass="label" Text="Acepto los Términos y Condiciones y las Políticas de Privacidad" TabIndex="9"></asp:Label>
                        <br /><div class="errorMsg"><asp:Label ID="errorAcepto" runat="server" Text=""></asp:Label></div>
                        <div class="space-5"></div>

                        <asp:Button ID="regiterSubmit" runat="server" Text="Registrarme" ToolTip="Registrarme en Cal-C-Tose" CssClass="button small" TabIndex="10" OnClick="registerSubmit_Click" />

                        <div class="space-5"></div>

                    <asp:Label ID="resultado" runat="server" Text=""></asp:Label>
                </div>
                <%
                }
        %>
            </div>
                  
            </div>
        </div> 
    </div>

  </div> 
</asp:Content>

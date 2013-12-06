<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Calctose.aspx.cs" Inherits="WebSite.Calctose" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="http://code.jquery.com/jquery-1.4.2.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="scripts/jquery.lightbox_me.js"></script>
    <script type="text/javascript">
        jQuery(document).ready(function () {
            jQuery('#showTN').click(function (e) {
                jQuery('#tablaNutrimental').lightbox_me();
                e.preventDefault();
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="wrapper">
        <div id="content1">
    <%
        if (Request.QueryString["tema"] == null || Request.QueryString["tema"] == "" || Request.QueryString["tema"] == "inicio")
        {
    %>
            <div class="top">
                <div class="columnaIzq">
                    Presentaciones
                </div>
                <div class="raya"></div>
            </div>
            <div id="cal-c-tose">
                <div>
                    <a href="Calctose.aspx?tema=presentaciones" class="mix">Presentaciones</a> |
                    <a href="Calctose.aspx?tema=ideas-de-menus-nutritivos" class="mix">Ideas de menús nutritivos</a> |
                    <a href="Calctose.aspx?tema=la-ciencia-de-calctose" class="mix">La Ciencia de CAL-C-TOSE</a> |
                    <a href="Calctose.aspx?tema=acerca-de" class="mix">Acerca de la Marca</a>
                </div>
            </div>

    <%
        }
        else if (Request.QueryString["tema"] == "presentaciones") {
    
    %>
            <div class="top">
                <div class="columnaIzq">
                    Presentaciones
                </div>
                <div class="columnaDer">
                    Puedes incluir todas la ma&ntilde;anas un vaso de Cal-C-Tose* en su desayuno, que con sus nutrimentos apoye a dar una 
                    nutrici&oacute;n m&aacute;s completa. <span class="note">*Un vaso con 230 mL de leche semidescremada</span>.
                </div>
                <div class="raya"></div>
            </div>
            <div id="presentaciones">
            </div>

    <%
        }
        else if (Request.QueryString["tema"] == "ideas-de-menus-nutritivos")
        {
    %>
            <div class="top">
                <div class="columnaIzq">
                    Ideas para el desayuno
                </div>
                <div class="columnaDer">
                    El desayuno es el alimento inicial y por ello debe proporcionar a tu hijo la energ&iacute;a necesaria
                    para afrontar bien el d&iacute;a. Aqu&iacute; algunas ideas para preparar 8 desayunos completos.
                </div>
                <div class="raya"></div>
            </div>
            <div id="desayuno">
                    <p>
                    Los men&uacute;s presentados son &uacute;nicamente ejemplos y no gu&iacute;as para una alimentaci&oacute;n personalizada.
                    </p>
                <div id="desayunos">
                    <div class="desayunosMenu">
                        <img src="images/desayuno/menu1_01.jpg" alt="Desayuno01"/> <img src="images/desayuno/menu1_02.jpg" alt="Desayuno01"/>
                    </div>
                    <div class="desayunosMenu">
                        <img src="images/desayuno/menu2_01.jpg" alt="Desayuno02"/> <img src="images/desayuno/menu2_02.png" alt="Desayuno02"/>
                    </div>
                    <div class="desayunosMenu">
                        <img src="images/desayuno/menu3_01.jpg" alt="Desayuno03"/> <img src="images/desayuno/menu3_02.png" alt="Desayuno03"/>
                    </div>
                    <div class="desayunosMenu">
                        <img src="images/desayuno/menu4_01.jpg" alt="Desayuno04"/> <img src="images/desayuno/menu4_02.png" alt="Desayuno04"/>
                    </div>
                    <div class="desayunosMenu">
                        <img src="images/desayuno/menu5_01.jpg" alt="Desayuno05"/> <img src="images/desayuno/menu5_02.png" alt="Desayuno05"/>
                    </div>
                    <div class="desayunosMenu">
                        <img src="images/desayuno/menu6_01.jpg" alt="Desayuno06"/> <img src="images/desayuno/Desyuno_5-Af.png" alt="Desayuno06"/>
                    </div>
                    <div class="desayunosMenu">
                        <img src="images/desayuno/menu7_01.jpg" alt="Desayuno07"/>
                    </div>
                    <div class="desayunosMenu">
                        <img src="images/desayuno/menu8_01.jpg" alt="Desayuno08"/>
                    </div>
                </div>
            </div>

    <%
        }
        else if (Request.QueryString["tema"] == "la-ciencia-de-calctose") {
    %>
            <div class="top">
                <div class="columnaIzq">
                    La ciencia de Cal-C-Tose
                </div>
                <div class="raya"></div>
            </div>
            <div id="ciencia">
                <div class="space-10"></div>
                <div class="generica"><img src="images/marca/cct_ciencia_choco.jpg" alt="Ciencia de Cal-C-Tose"/></div>
                <div class="sabiasQue">
                    <p><span>&iquest;Sabías que?</span></p>
                    <br />
                    <p>
                    Un vaso de Cal-C-Tose contiene 26 nutrimentos importantes como: el Hierro, Zinc y &Aacute;cido F&oacute;lico que ayudan 
                    a complementar la nutrici&oacute;n diaria de tu hijo.
                    </p>
                    <br />
                    <a href="#" id="showTN" class="mix">Ver tabla nutrimental</a>
                    <br /><br />
                    <p>
                        <span>El Calcio: </span>favorece al crecimiento de huesos y dientes fuertes.<br />
                        <span>El Hierro, Zinc y &Aacute;cido F&oacute;lico: </span>Apoyan al desarrollo mental.<br />
                        <span>Las Vitaminas A, C, E y Minerales como Zinc y Hierro: </span>ayudan a fortalecer/favorecer el sistema de defensas.
                        <br />
                        <br />
                        <span>Vitaminas como:</span>
                    </p>
                    <br /><br />
                    <ul>
                        <li>Vitamina A que ayuda en el mantenimiento de una visi&oacute;n sana.</li>
                        <li>Vitamina B1 y B12 que soportan la funci&oacute;n del sistema nervioso.</li>
                        <li>Vitamina B2 que contribuye en la absorci&oacute;n del hierro.</li>
                        <li>Vitamina B6 que ayuda a las enzimas involucradas en la funci&oacute;n neurotransmisora.</li>
                        <li>Vitamina C importante antioxidante que apoya al sistema de defensas.</li>
                        <li>Vitamina D ayuda al desarrollo de los huesos y dientes.</li>
                        <li>Vitamina E que favorece al sistema inmunitario.</li>
                        <li>Niacina ayuda al crecimiento y desarrollo.</li>
                    </ul>
                    <br /><br />
                    <p><span>Minerales como:</span></p>
                    <br /><br />
                    <ul>
                        <li>Calcio y f&oacute;sforo que ayudan en el desarrollo de huesos y dientes.</li>
                        <li>Hierro y zinc que benefician el desarrollo mental.</li>
                        <li>Potasio que ayuda al transporte de nutrientes.</li>
                        <li>Cobre favorece el sistema inmunitario.</li>
                        <li>Prote&iacute;nas, que favorecen la formaci&oacute;n de los tejidos.</li>
                        <li>Carbohidratos, que son fuente de energ&iacute;a para el cerebro.</li>
                    </ul>
                    <br /><br />
                    <p>
                        Cal-C-Tose es un alimento en polvo fortificado con sabor a chocolate que le brinda a las mam&aacute;s una herramienta
                        para apoyar la alimentaci&oacute;n y nutrici&oacute;n completa de sus hijos d&iacute;a a d&iacute;a. Contiene 26 
                        nutrimentos importantes que forman parte de los diferentes grupos de alimentos y que apoyen una alimentaci&oacute;n 
                        correcta.
                    </p>
                    <br />
                    <p class="pie">
                    **%IDR (Ingesta Di&aacute;ria Recomendada)-NOM-086-SSA1-1994 <br />
                    Nota: informaci&oacute;n dirigida al mercado mexicano. 
                    </p>
                </div>
            </div>

    <%
        }
        else if (Request.QueryString["tema"] == "acerca-de") {
    %>
            <div class="top">
                <div class="columnaIzq">
                    Acerca de la marca
                </div>
                <div class="raya"></div>
            </div>
            <div id="acerca_de">
                <div class="pie">
                    <p>
                    <strong>Cal-C-Tose</strong> es un alimento en polvo fortificado con sabor a chocolate, que le brinda a las mam&aacute;s
                    una herramienta para apoyar la alimentaci&oacute;n y nutrici&oacute;n completa de sus hijos d&iacute;a a d&iacute;a.
                    Contiene 26 nutrimentos importantes que forman parte de los diferentes grupos de alimentos y que apoyan una 
                    alimentaci&oacute;n correcta. 
                    </p>
                </div>
            </div>
    <%
        } 
    %>
        </div>
    </div>

    <div id="tablaNutrimental">
        <a href="#" id="close_x" class="close light">Cerrar</a>
        <img src="images/marca/tablanutri.jpg" alt="Tabla Nutricional" />
    </div>
</asp:Content>

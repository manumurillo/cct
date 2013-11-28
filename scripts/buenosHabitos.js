jQuery(document).ready(function () {
    var ancho = $(window).width();

    jQuery(".contenedor-izquierda-desactivado").hide();
    jQuery(".contenedor-izquierda-activado").show();

    jQuery(".menu-derecha").animate({ width: "309px", left: "670px" }, 2000).delay(4000);
    jQuery(".contenedor-izquierda-desactivado").show();
    jQuery(".contenedor-izquierda-activado").hide();
    jQuery(".menu-derecha").animate({ width: "35px", left: "945px" }, 2000);

    jQuery(".tip").mouseenter(function (e) {
        var x = 0;
        var y = 0;
        var id = jQuery(this).attr("id");
        var pos = jQuery(this).position();
        var off = jQuery(this).offset();
        var posY = pos.top;
        var posX = pos.left;

        //console.log("Posicion absoluta: X: " + posX + " Posicion Y: " + posY + "\nPosicion relativa: X: " + off.left + " Posicion Y: " + off.top);
        var element = jQuery("#tip_" + id);

        if (e.pageX < ((ancho) / 2)) {
            x = posX-15;
            y = posY-15;
        }
        else {
            x = posX-165;
            y = posY-15;
            jQuery(element).children(".col1").css("float", "right");
            jQuery(element).children(".col2").css("float", "left");
        }

        //console.log("Posicion spot: Posicion X: " + posX + " Posicion Y: " + posY+"\nPosicion div: Posicion X: " + x + " Posicion Y: " + y);
        jQuery(element).css("left", x);
        jQuery(element).css("top", y);
        jQuery(element).fadeIn(200);
        jQuery(this).fadeOut(200);

    });

    jQuery(".tooltip").mouseleave(function (e) {
        var id = jQuery(this).attr("id");
        var tipId = id.substring(4);
        jQuery(this).fadeOut(200);
        jQuery("#"+tipId).fadeIn(200);

    });

    //INICIO MENU DERECHA
    jQuery('.contenedor-izquierda-desactivado').click(function () {
        jQuery(".contenedor-izquierda-desactivado").hide();
        jQuery(".contenedor-izquierda-activado").show();
        var md = jQuery(".menu-derecha");

        jQuery(md).animate({ width: "309px", left: "670px"}, 2000);
    });
    jQuery('.contenedor-izquierda-activado').click(function () {
        jQuery(".contenedor-izquierda-desactivado").show();
        jQuery(".contenedor-izquierda-activado").hide();
        jQuery(".menu-derecha").animate({ width: "35px", left: "945px"}, 2000);
    });
    //FIN MENU DERECHA

    //Mostrar div de más info
    jQuery('.more').click(function (e) {
        var id = jQuery(this).attr("id");
        jQuery('#show_' + id).lightbox_me({
            overlayCSS : {background: 'black', opacity: .5},
            modalCSS : {top: '60px'}
        });
            e.preventDefault();
        });
});
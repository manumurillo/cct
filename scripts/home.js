jQuery(function () {
    jQuery(document).tooltip({
        track: true
    });

    jQuery(".cerrar").on("click", function (e) {
        jQuery(this).parent().fadeOut(100);
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
        jQuery("#col2-3").css("height", "700px");

    });

    
});

function muestraTip(element) {
    jQuery(element).fadeIn(200);
}
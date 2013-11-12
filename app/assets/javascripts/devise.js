//= require jquery
//= require jquery_ujs

$(document).ready(function() {
    size5  = $(window).width() / 5
    size10 = $(window).width() / 10

    $('input[type="submit"]').css('font-size', size10 + 'px');
    $('div.logo').css('font-size', size5 + 'px');

    if ($('div.errors').length > 0) {
        $('input[type="email"], input[type="password"], input[type="submit"], div.logo').css({'box-shadow': 'none', 'text-shadow': 'none' });
        $('body').css('background-color', '#000');
        $('div.logo').addClass('hinge animated');

        setTimeout(function() {
            $('div.logo').remove();
            $('div.errors').fadeIn();
        }, 2500);
    }
});

$(window).resize(function() {
    size5  = $(window).width() / 5
    size10 = $(window).width() / 10

    $('input[type="submit"]').css('font-size', size10 + 'px');
    $('div.logo').css('font-size', size5 + 'px');
});

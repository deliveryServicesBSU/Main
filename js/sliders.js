+(function()
{
    $(window).scroll(function(){
        var distanceTop = $('#show').offset().top - $(window).height();
        if  ($(window).scrollTop() > ($(window).width())-($("div.slider").position().top)+10)
            $('#slidebox').animate({'right':0},300);
        else
            $('#slidebox').stop(true).animate({'right': ($(window).width())},200);
    });

});

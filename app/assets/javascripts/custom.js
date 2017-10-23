

$(document).ready(function(){


  $.fn.randomize = function(selector){
    var $elems = selector ? $(this).find(selector) : $(this).children(),
        $parents = $elems.parent();

    $parents.each(function(){
        $(this).children(selector).sort(function(){
            return Math.round(Math.random()) - 0.5;
        }).detach().appendTo(this);
    });

    return this;
  };

  // randomize the slides and then call slick
  $('.body-image').randomize('.body-image__image');



  $('.body-image').slick({
    dots: false,
    infinite: true,
    speed: 2000,
    fade: true,
    autoplay: true,
    autoplaySpeed: 4000,
    cssEase: 'linear'
  });
});

var ready;
ready = function() {
  $('body').addClass('loaded');
    var mainSlider = $('#main-slider');
    mainSlider.camera({
        height: 'auto',
        loader: 'pie',
        fx: 'random',
        pagination: false,
        thumbnails: false,
        hover: false,
        opacityOnGrid: false,
        imagePath: '../img/'
    });

    new WOW().init();

    var vbSelector = $('.img_popup');
    vbSelector.venobox({
      numeratio: true,
      infinigall: true
    });

    var counterSelector = $('.counter');
    counterSelector.counterUp({
      delay: 10,
      time: 1000
    });


  var testiCarousel = $('#testi_carousel');
  testiCarousel.owlCarousel({
        loop: true,
        autoplay: true,
        smartSpeed: 800,
        margin: 20,
        responsive : {
            // breakpoint from 0 up
            0 : {
                items: 1
            },
            // breakpoint from 480 up
            520 : {
                items: 1
            },
            // breakpoint from 768 up
            768 : {
                items: 3
            }
        }
    });

   $(window).on( 'scroll', function () {
        if ($(this).scrollTop() > 100) {
            $('#scroll-to-top').fadeIn();
        } else {
            $('#scroll-to-top').fadeOut();
        }
    });
};

$(document).on('turbolinks:load', ready);


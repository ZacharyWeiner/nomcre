
$(document).ready(function() {

    $(window).on('load', function() {
        $('body').addClass('loaded');
    });

/*=========================================================================
  Sticky Header
=========================================================================*/
  $(function() {
    var header = $("#header"),
      yOffset = 0,
      triggerPoint = 80;
    $(window).on( 'scroll', function() {
      yOffset = $(window).scrollTop();

      if (yOffset >= triggerPoint) {
        header.addClass("navbar-fixed-top");
      } else {
        header.removeClass("navbar-fixed-top");
      }

    });
  });

/*=========================================================================
    Main Slider
=========================================================================*/
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

/*=========================================================================
  Testimonial Carousel
=========================================================================*/
  var testiCarousel = $('#testi_carousel');
  testiCarousel.owlCarousel({
        loop: true,
        autoplay: false,
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
/*=========================================================================
  Counter Up Active
=========================================================================*/
  var counterSelector = $('.counter');
  counterSelector.counterUp({
    delay: 10,
    time: 1000
  });

/*=========================================================================
  Initialize smoothscroll plugin
=========================================================================*/
  smoothScroll.init({
    offset: 60
  });

/*=========================================================================
  Active venobox
=========================================================================*/
  var vbSelector = $('.img_popup');
  vbSelector.venobox({
    numeratio: true,
    infinigall: true
  });

/*=========================================================================
  Active Tooltip
=========================================================================*/
  $('[data-toggle="tooltip"]').tooltip();

/*=========================================================================
    Flickr Feed
=========================================================================*/
  $('#flickr-feed').jflickrfeed({
    limit: 16,
    qstrings: {
      id: '152704974@N02'
    },
    itemTemplate: '<div class="feed-media">'+
            '<a class="flickr-light" href="{{image_b}}" title="{{title}}">' +
              '<img src="{{image_m}}" alt="{{title}}" />' +
            '</a>' +
            '</li>'
  }, function(data) {
    $('.flickr-light').venobox({
      numeratio: true,
      infinigall: true
    });
  });

/*=========================================================================
    wow Settings
=========================================================================*/
    var wow = new WOW( {
        mobile: false,
        offset: 0
    });
    wow.init();

/*=========================================================================
  Scroll To Top
=========================================================================*/
    $(window).on( 'scroll', function () {
        if ($(this).scrollTop() > 100) {
            $('#scroll-to-top').fadeIn();
        } else {
            $('#scroll-to-top').fadeOut();
        }
    });



})(jQuery);


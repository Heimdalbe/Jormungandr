/**
 * Template Name: Squadfree - v2.0.1
 * Template URL: https://bootstrapmade.com/squadfree-free-bootstrap-template-creative/
 * Author: BootstrapMade.com
 * License: https://bootstrapmade.com/license/
 */
!(function ($) {
    "use strict";

    // Smooth scroll for the navigation menu and links with .scrollto classes
    $(document).on('click', '.nav-menu a, .mobile-nav a, .scrollto', function (e) {
        if (location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '') && location.hostname == this.hostname) {
            e.preventDefault();
            var target = $(this.hash);
            if (target.length) {
                var scrollto = target.offset().top;
                var scrolled = 20;
                if ($('#header').length) {
                    scrollto -= $('#header').outerHeight()
                    if (!$('#header').hasClass('header-scrolled')) {
                        scrollto += scrolled;

                    }
                }
                if ($(this).attr("href") == '#header') {
                    scrollto = 0;
                }
                $('html, body').animate({
                    scrollTop: scrollto
                }, 1500, 'easeInOutExpo');
                if ($(this).parents('.nav-menu, .mobile-nav').length) {
                    $('.nav-menu .active, .mobile-nav .active').removeClass('active');
                    $(this).closest('li').addClass('active');
                }
                if ($('body').hasClass('mobile-nav-active')) {
                    $('body').removeClass('mobile-nav-active');
                    $('.mobile-nav-toggle i').toggleClass('icofont-navigation-menu icofont-close');
                    $('.mobile-nav-overly').fadeOut();
                }
                return false;
            }
        }
    });

    // Mobile Navigation
    if ($('.nav-menu').length) {
        var $mobile_nav = $('.nav-menu').clone().prop({
            class: 'mobile-nav d-lg-none'
        });
        $('body').append($mobile_nav);
        $('body').prepend('<button type="button" class="mobile-nav-toggle d-lg-none"><i class="icofont-navigation-menu"></i></button>');
        $('body').append('<div class="mobile-nav-overly"></div>');
        $(document).on('click', '.mobile-nav-toggle', function (e) {
            $('body').toggleClass('mobile-nav-active');
            $('.mobile-nav-toggle i').toggleClass('icofont-navigation-menu icofont-close');
            $('.mobile-nav-overly').toggle();
        });
        $(document).on('click', '.mobile-nav .drop-down > a', function (e) {
            e.preventDefault();
            $(this).next().slideToggle(300);
            $(this).parent().toggleClass('active');
        });
        $(document).click(function (e) {
            var container = $(".mobile-nav, .mobile-nav-toggle");
            if (!container.is(e.target) && container.has(e.target).length === 0) {
                if ($('body').hasClass('mobile-nav-active')) {
                    $('body').removeClass('mobile-nav-active');
                    $('.mobile-nav-toggle i').toggleClass('icofont-navigation-menu icofont-close');
                    $('.mobile-nav-overly').fadeOut();
                }
            }
        });
    } else if ($(".mobile-nav, .mobile-nav-toggle").length) {
        $(".mobile-nav, .mobile-nav-toggle").hide();
    }

    // Toggle .header-scrolled class to #header when page is scrolled

    $(window).scroll(function () {
        if ($(this).scrollTop() > 30) {
            $('#header').addClass('header-scrolled');
            $('.drop-down').addClass('header-scrolled');
            $('.mobile-nav-toggle').addClass('header-scrolled');
            $(".banner-logo").attr("src", "../../../static/img/Heimdal Banner white.png");

        } else {
            $('#header').removeClass('header-scrolled');
            $('.drop-down').removeClass('header-scrolled');
            $('.mobile-nav-toggle').removeClass('header-scrolled');
            $(".banner-logo").attr("src", "../../../static/img/Heimdal Banner black.png");
        }
    });
    if ($(window).scrollTop() > 100) {
        $('#header').addClass('header-scrolled');
    }

    // Back to top button
    $(window).scroll(function () {
        if ($(this).scrollTop() > 100) {
            $('.back-to-top').fadeIn('slow');
        } else {
            $('.back-to-top').fadeOut('slow');
        }
    });
    $('.back-to-top').click(function () {
        $('html, body').animate({
            scrollTop: 0
        }, 1500, 'easeInOutExpo');
        return false;
    });

    // jQuery counterUp
    $('[data-toggle="counter-up"]').counterUp({
        delay: 10,
        time: 1000
    });

    // Porfolio isotope and filter
    $(window).on('load', function () {
        var portfolioIsotope = $('.portfolio-container').isotope({
            itemSelector: '.portfolio-item',
            layoutMode: 'fitRows'
        });
        $('#portfolio-flters li').on('click', function () {
            $("#portfolio-flters li").removeClass('filter-active');
            $(this).addClass('filter-active');
            portfolioIsotope.isotope({
                filter: $(this).data('filter')
            });
            aos_init();
        });
    });

    // Testimonials carousel (uses the Owl Carousel library)
    $(".portfolio-details-carousel").owlCarousel({
        autoplay: false,
        dots: true,
        loop: false,
        responsive: {
            0: {
                items: 1
            },
        }
    });

    // Picture carousel (uses the Owl Carousel library)
    $(".picture-carousel").owlCarousel({
        autoplay: true,
        autoHeight: false,
        dots: true,
        loop: true,
        responsive: {
            0: {
                items: 1,
            },
        }
    });

    // Events carousel (uses the Owl Carousel library)
    $(".events-carousel").owlCarousel({
        autoplay: false,
        autoHeight: false,
        dots: true,
        loop: false,
        responsive: {
            0: {
                items: 1,
            },
            // breakpoint from 768 up
            700: {
               items: 2,
            },
            1200: {
               items: 3,
            },
        }
    });

    // Initi AOS
    function aos_init() {
        AOS.init({
            duration: 800,
            easing: "ease-in-out"
        });
    }

    aos_init();

})(jQuery);
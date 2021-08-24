/* -------------------- */
/* -------------------- */
/* -------------------- */
/* HOMEPAGE (Homepage.aspx) */
/* -------------------- */
/* -------------------- */
/* -------------------- */

/* -------------------------------------------------------------------------------------- */
/* PRE LOADER */
/* -------------------------------------------------------------------------------------- */
var preloader = document.getElementById("loading");

function preloaderFunction() {
    preloader.style.display = 'none';
}

/* -------------------------------------------------------------------------------------- */
/* FOR THE STICKY NAVIGATION */
/* -------------------------------------------------------------------------------------- */

/* this ensures that the code will run after the document has been loaded */
$(document).ready(function() {
    
    /* direction is a parameter from which we'll know that in which direction user is scrolling the webpage down or up */
    $('.js--section-features').waypoint(function(direction) {
        
        if (direction == "down") {    
            $('nav').addClass('sticky');    
        } else {
            $('nav').removeClass('sticky');
        }
        
    }, {
        
        offset: '60px;'/* sticky navigation will be viewed before 60px of section features */
        
    });
    

    /* -------------------------------------------------------------------------------------- */
    /* SCROLL ON BUTTONS */
    /* -------------------------------------------------------------------------------------- */
    
    /* Scroll to price plan section */
    $('.js--scroll-to-plans').click(function(){
        $('html, body').animate({ scrollTop: $('.js--section-plans').offset().top }, 1000);
    });
    
    /* Scroll to features section */
    $('.js--scroll-to-start').click(function(){
        $('html, body').animate({ scrollTop: $('.js--section-features').offset().top }, 1000);
    });

    /* Scroll to top of the homepage - on logo black */
    $('.sticky').click(function () {
        $('html,body').animate({ scrollTop: $('.home-page-header').offset().top }, 1000);
    });
    

    /* -------------------------------------------------------------------------------------- */
    /* NAVIGATION SCROLL */
    /* -------------------------------------------------------------------------------------- */
    
    $(function() {
      $('a[href*=#]:not([href=#])').click(function() {
        if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
          var target = $(this.hash);
          target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
          if (target.length) {
            $('html,body').animate({
              scrollTop: target.offset().top
            }, 1000);
            return false;
          }
        }
      });
    });
    
    
    /* -------------------------------------------------------------------------------------- */
    /* ANIMATION ON SCROLL */
    /* -------------------------------------------------------------------------------------- */

    /* Features Section(fadeIn) */
    $('.js--wp-1').waypoint(function(direction) {
        $('.js--wp-1').addClass('animated fadeIn');
    },{
        offset: '50%' /* semicolon is not required here */    
    });
    
    /* How it works Section(fadeInUp) */
    $('.js--wp-2').waypoint(function(direction) {
        $('.js--wp-2').addClass('animated fadeInUp');
    },{
        offset: '50%' /* semicolon is not required here */    
    });
    
    /* Cities Section(fadeIn) */
    $('.js--wp-3').waypoint(function(direction) {
        $('.js--wp-3').addClass('animated fadeIn');
    },{
        offset: '50%' /* semicolon is not required here */    
    });
    
    /* Price plan Section(pulse) */
    $('.js--wp-4').waypoint(function(direction) {
        $('.js--wp-4').addClass('animated pulse');
    },{
        offset: '50%' /* semicolon is not required here */
    });
    
    
    /* -------------------------------------------------------------------------------------- */
    /* MOBILE NAVIGATION */
    /* -------------------------------------------------------------------------------------- */
    $('.js--nav-icon').click(function() {
        var nav = $('.js--main-nav');
        var icon = $('.js--nav-icon i');
        
        nav.slideToggle(200); /* 0.2seconds = 200 milliseconds */
        
        if (icon.hasClass('ion-navicon-round')) {
            icon.addClass('ion-close-round');
            icon.removeClass('ion-navicon-round');
        } else {
            icon.addClass('ion-navicon-round');
            icon.removeClass('ion-close-round');
        }
        /* NOTE: while adding and removing, class is not requeired .(period)  */
    });
    
    
})


/* -------------------- */
/* -------------------- */
/* -------------------- */
/* LOGIN PAGE (admin, student, staff) */
/* -------------------- */
/* -------------------- */
/* -------------------- */

/* ----------------------------------------------------------------------- */
/* ONLOAD OR ON PAGE LOAD SCROLL */
/* ----------------------------------------------------------------------- */

/* SCROLL TO FORM */
function scrollToForm() {
    $('html, body').animate({ scrollTop: $('.admin-js--section').offset().top }, 1700);
}


/* ----------------------------------------------------------------------- */
/* ANIMATION ON SCROLL */
/* ----------------------------------------------------------------------- */

/* LOGIN PAGE - STICKY NAV ANIMATION - UP TO DOWN */
$('.login-js--wp-1').waypoint(function (direction) {
    $('.login-js--wp-1').addClass('animated fadeInDown');
}, {
    offset: '50%'
});

/* LOGIN PAGE - IMAGE ANIMATION - LEFT TO RIGHT */
$('.login-js--wp-2').waypoint(function (direction) {
    $('.login-js--wp-2').addClass('animated fadeInLeft');
}, {
    offset: '50%'
});


/* LOGIN PAGE - LOGIN FORM ANIMATION - DOWN TO UP */
$('.login-js--wp-3').waypoint(function (direction) {
    $('.login-js--wp-3').addClass('animated fadeInUp');
}, {
    offset: '50%'
});

/* LOGIN PAGE - LOGIN FORM ANIMATION - RIGHT TO LEFT */
$('.login-js--wp-4').waypoint(function (direction) {
    $('.login-js--wp-4').addClass('animated fadeInRight');
}, {
    offset: '50%'
});



/* -------------------------------------------------------------------------------------- */
/* SCROLL ON BUTTONS */
/* -------------------------------------------------------------------------------------- */

/* add this class to any button = admin-js--scroll-to-showmore
 * add this class to any section = admin-js--section
 * now the button will scroll to the section when clicked */
$('.admin-js--scroll-to-showmore').click(function () {
    $('html, body').animate({ scrollTop: $('.admin-js--section').offset().top }, 1000);
});


/* -------------------- */
/* -------------------- */
/* -------------------- */
/* ADMIN MODULE - Notice.aspx */
/* -------------------- */
/* -------------------- */
/* -------------------- */

/* ADD NOTICE - SCROLL */
$('.admin-js--scroll-to-add-notice').click(function () {
    $('html, body').animate({ scrollTop: $('.admin-js--add-notice').offset().top }, 500);
});

/* UPDATE NOTICE - SCROLL */
$('.admin-js--scroll-to-update-notice').click(function () {
    $('html, body').animate({ scrollTop: $('.admin-js--update-notice').offset().top }, 500);
});

/* DELETE NOTICE - SCROLL */
$('.admin-js--scroll-to-delete-notice').click(function () {
    $('html, body').animate({ scrollTop: $('.admin-js--delete-notice').offset().top }, 500);
});

/* NOTICE TABLE (GRID VIEW) - SCROLL */
$('.admin-js--scroll-to-notice-table').click(function () {
    $('html, body').animate({ scrollTop: $('.admin-js--notice-table').offset().top }, 500);
});
/* -------------------- */
/* -------------------- */
/* -------------------- */
/* ADMIN MODULE - ApproveStudent.aspx */
/* -------------------- */
/* -------------------- */
/* -------------------- */

/* ADD NOTICE - SCROLL */
$('.admin-js--scroll-to-approve-student').click(function () {
    $('html, body').animate({ scrollTop: $('.admin-js--approve-student').offset().top }, 500);
});

/* UPDATE NOTICE - SCROLL */
$('.admin-js--scroll-to-modify-student').click(function () {
    $('html, body').animate({ scrollTop: $('.admin-js--modify-student').offset().top }, 500);
});

/* DELETE NOTICE - SCROLL */
$('.admin-js--scroll-to-delete-student').click(function () {
    $('html, body').animate({ scrollTop: $('.admin-js--delete-student').offset().top }, 500);
});
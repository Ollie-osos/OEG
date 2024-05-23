$(function() {
    // Show dropdown when clicked
    $('#header-btn').on('click', function(e) {
        $('#header-menu').toggleClass('active');
        $('.nav-btn').toggleClass('active');
        $('#close-menu-text').toggle();
    });

    // Hide menu after clicking menu item
    $('.dropdown-menu li').on('click', function(e) {
        $('#header-menu').removeClass('active');
        $('.nav-btn').removeClass('active');
    });

    // scroll body to 0px on click
    $('#back-top').click(function () {
        $('body,html').animate({
          scrollTop: 0 
        }, 800);
        return false; 
    });

    // drop down menu desktop
    $('.has-sub').on('click', function(e) { // Get all dropdown menu toggles
        $('.dropdown-menu').not($(this).children('.dropdown-menu')).removeClass('dropdown-shown'); // Hide all other dropdown menus
        $('.has-sub').not($(this)).removeClass('active'); // Remove the active selector from the other dropdown toggles
        $(this).children('.dropdown-menu').toggleClass('dropdown-shown'); // Show/hide the dropdown menu associated with the toggle being clicked
        $(this).toggleClass('active'); // Toggle the active selector on the nav-item
    });

    // accessibility menu

    $('.toggle-aa').click(function() {
        // Toggle visibility of the two content elements
        $('#aa-image').toggle();
        $('#aa-content').toggle();
    });

    $('.toggle-search').click(function() {
        // Toggle visibility of the two content elements
        $('#search-image').toggle();
        $('#search-content').toggle();
    });


    // high contrast
    $('#contrast-btn').click(function() {
        $('body').toggleClass('high-contrast');

        if ($('body').hasClass('high-contrast')) {
            sessionStorage.setItem('highContrast', 'on');
        }else {
            sessionStorage.setItem('highContrast', 'off');
        }
        // var myVariable = sessionStorage.getItem('highContrast');
        // console.log('Session variable:', myVariable);
    });
    
    sal(); 
});

// fade in/out on scroll #scroll-top and navbar

// $(window).scroll(function () {
//     if ($(window).scrollTop() > 20) {
//         $('#scroll-down').fadeOut();
//         $('#navbar-desktop').addClass('nav-shrink');
//     }else{
//         $('#navbar-desktop').removeClass('nav-shrink');
//     }
// });

// if($(window).scrollTop() > 20){
//     $('#navbar-desktop').addClass('nav-shrink');
//     $('#scroll-down').fadeOut();
// }

// Back to top on scroll
$(window).scroll(function () {
    if ($(window).scrollTop() > 50) {
        $('#back-top').fadeIn();

    }else{
        $('#back-top').fadeOut();
    }
});

if($(window).scrollTop() > 50){
    $('#back-top').fadeIn();
    $('#back-top').css('display', 'flex');
}else{
    $('#back-top').fadeOut();
}

// AOS.init();
  
$(window).load(function(){
    // $('.page').addClass('fade'); 
    var myVariable = sessionStorage.getItem('highContrast');
    var currentFontSize = sessionStorage.getItem('fontSize');
    var currentLineHeight = sessionStorage.getItem('lineHeight');

    // console.log('Session variable:', myVariable);
    // console.log('Session line height:', currentLineHeight);
    
    if(myVariable == 'on'){
        $('body').addClass('high-contrast');
        // console.log('should be added');
    }else{
        $('body').removeClass('high-contrast');
        // console.log('should be removed');
    }
    // if (typeof currentFontSize === 'number') {
        $('p').css('font-size', (currentFontSize) + "px");
        $('p').css('line-height', (currentLineHeight) + "px");
        // console.log('Session line height:', currentLineHeight);
    // }
});
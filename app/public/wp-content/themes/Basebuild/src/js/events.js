
// events scripts

jQuery(document).ready(function($) {
    $('#button').click(function() {
    
        $.ajax({
            url : ajax_object.ajaxurl,
        type : 'post',
        
        data : {
            action : 'user_clicked'
        },
        success : function( response ) {
            if( response === 'ok' ) {
                button.fadeOut( function() {
                    button.replaceWith( 'already clicked' );
                })
            }
        }
    });
     
    return false;
    })
});






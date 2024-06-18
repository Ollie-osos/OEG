jQuery(document).ready(function($) {
    $('#load-more').on('click', function() {
        var button = $(this);
        var data = {
            'action': 'load_more',
            'page': current_page + 1
        };

        $.ajax({
            url: load_more_params.ajaxurl,
            data: data,
            type: 'POST',
            beforeSend: function() {
                button.text('Loading...');
            },
            success: function(response) {
                if(response) {
                    $('#post-container').append(response);
                    current_page++;
                    button.text('Load More');
                } else {
                    button.text('No more posts');
                    button.prop('disabled', true);
                }
            }
        });
    });
});
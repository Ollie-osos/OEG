<?php

get_header(); ?>

<div class="page">
    <section class="section events">
        <div class="container">
            <div class="row">
                <div id="filters">
                    <!-- <form id="filterForm" action="" method="post"> -->
                        <div>
                            <h3>Select Date Range</h3>
                            <div class="button-grid" id="dateRangeButtons">
                                <button type="button" data-value="today">Today</button>
                                <button type="button" data-value="week">This Week</button>
                                <button type="button" data-value="month">This Month</button>
                            </div>
                            <input type="hidden" name="date_range" id="dateRangeInput">
                        </div>
                        
                        <div>
                            <h3>Select Categories (Choose 1 or 2)</h3>
                            <div class="button-grid" id="categoryButtons">
                                <button type="button" data-value="" id="clear">All</button>
                                <button type="button" data-value="in-gallery">In-Gallery</button>
                                <button type="button" data-value="beyond-gallery">Beyond-Gallery</button>
                                <button type="button" data-value="exhibition">Exhibition</button>
                                <button type="button" data-value="event">Event</button>
                                <button type="button" data-value="vr">VR</button>
                                <button type="button" data-value="online">Online</button>
                            </div>
                            <input type="hidden" name="category1" id="categoryInput1">
                            <input type="hidden" name="category2" id="categoryInput2">
                        </div>

                        <button id="apply-filters" type="submit">Apply</button>
                    <!-- </form> -->

                </div>
            </div>
            <div class="row" id="posts-list"> <!-- Post data will be displayed here -->
                    
            </div>
        </div>
    </section>
</div>

<script>
$(document).ready(function(){
    // $('#apply-filters').click(function(){
        // var category = $('#category-filter').val();
        // var dateFilter = $('#date-filter').val();
        // var templateDir = "<?php // bloginfo('template_directory') ?>";

        
        // Handle date range selection
        $('#dateRangeButtons button').on('click', function() {
            $('#dateRangeButtons button').removeClass('selected');
            $(this).addClass('selected');
            $('#dateRangeInput').val($(this).data('value'));
        });

        // Handle category selection
        $('#categoryButtons button').on('click', function() {
            if (!$(this).hasClass('selected') && $('.selected-category').length < 2) {
                $(this).addClass('selected selected-category');
            } else if ($(this).hasClass('selected')) {
                $(this).removeClass('selected selected-category');
            }
            
            var selectedCategories = $('.selected-category').map(function() {
                return $(this).data('value');
            }).get();
            
            $('#categoryInput1').val(selectedCategories[0] || '');
            $('#categoryInput2').val(selectedCategories[1] || '');

        });

        // Handle form submission
        $('#apply-filters').click(function(){
            // if (!$('#dateRangeInput').val()) {
            //     alert('Please select a date range.');
            //     return false;
            // }
            // if ($('#categoryInput1').val() === '' && $('#categoryInput2').val() === '') {
            //     alert('Please select at least 1 category.');
            //     return false;
            // }
            // return true;

            var category1 = $('#categoryInput1').val();
            var category2 = $('#categoryInput2').val();
            var dateFilter = $('#dateRangeInput').val();

            // alert(category1 + category2 + dateFilter);

            $.ajax({
                url: '../ajax/get_posts.php',
                method: 'POST',
                data: {category1: category1, category2: category2, dateFilter: dateFilter},
                success: function(response){
                    $('#posts-list').html(response);
                }
            });
        });
    
        
    // });
});
</script>

<?php get_footer();

// https://www.advancedcustomfields.com/resources/date-time-picker/
// https://wpwebinfotech.com/blog/how-to-use-ajax-in-wordpress/
<?php

get_header(); ?>

<div class="page">
    <?php get_template_part( 'template-parts/title-section', null, array('archive' => 'wo_')); ?>
    <section class="section events border-bottom">
        <div class="container">
            <div class="row">
                <div class="col-sm-12 col-md-3">
                    <div class="button-grid" id="dateRangeButtons">
                        <button class="red" type="button" data-value="today">Today</button>
                        <button class="red" type="button" data-value="week">This Week</button>
                        <button class="red" type="button" data-value="month">This Month</button>
                    </div>
                    <input type="hidden" name="date_range" id="dateRangeInput">
                </div>
                <div class="col-sm-12 col-md-9">
                    <div class="button-grid" id="categoryButtons">
                        <h3>Filter Events + Exhibitions:</h3>
                        <button class="blue" type="button" data-value="" id="clear">Clear All</button>
                        <button class="blue" type="button" data-value="in-gallery">In Gallery</button>
                        <button class="blue" type="button" data-value="beyond-gallery">Beyond the Gallery</button>
                        <button class="blue" type="button" data-value="exhibition">Exhibition</button>
                        <button class="blue" type="button" data-value="event">Event</button>
                        <button class="blue" type="button" data-value="vr">VR</button>
                        <button class="blue" type="button" data-value="online">Online</button>
                        <button id="apply-filters" type="submit" class="green">Apply</button>
                    </div>
                    <input type="hidden" name="category1" id="categoryInput1">
                    <input type="hidden" name="category2" id="categoryInput2">
                    
                </div>
            </div>
            <div class="row" id="posts-list"> <!-- Post data will be displayed here -->
                
            </div>
            <button id="load-more">Load More</button>
        </div>
    </section>
    <?php get_template_part( 'template-parts/additional-links', null, array('type' => 'pv_', 'gallery' => false  )); ?>
    <?php get_template_part( 'template-parts/mailing-list'); ?>
</div>

<script>
$(document).ready(function(){

    var category1 = $('#categoryInput1').val();
    var category2 = $('#categoryInput2').val();
    var dateFilter = $('#dateRangeInput').val();

    // alert('c1 = ' + category1 + ' cat2=' + category2 + ' date=' + dateFilter);

    $.ajax({
        url: '../ajax/get_posts.php',
        method: 'POST',
        data: {category1: category1, category2: category2, dateFilter: dateFilter},
        success: function(response){
            $('#posts-list').html(response);
            const itemsPerPage = 4; // Number of items to show per click
            const items = document.querySelectorAll("#posts-list .post-item");
            let currentlyVisible = 0;

            // Function to show the next set of items
            function showNextItems() {
                const nextItems = currentlyVisible + itemsPerPage;

                for (let i = currentlyVisible; i < nextItems && i < items.length; i++) {
                    items[i].style.display = "block"; // Make the items visible
                }

                currentlyVisible = nextItems;

                // Hide the button if no more items to show
                if (currentlyVisible >= items.length) {
                    document.getElementById("load-more").style.display = "none";
                }
            }

            // Initially show the first set of items
            showNextItems();

            // Add event listener for "Load More" button
            document.getElementById("load-more").addEventListener("click", showNextItems);

        }
    });

    



    
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

    $('#clear').on('click', function() {
        $('button').removeClass('selected selected-category');
        $('#dateRangeInput').val('');
        $('#categoryInput1').val('');
        $('#categoryInput2').val('');

        $.ajax({
            url: '../ajax/get_posts.php',
            method: 'POST',
            data: {category1: category1, category2: category2, dateFilter: dateFilter},
            success: function(response){
                $('#posts-list').html(response);
                const itemsPerPage = 4; // Number of items to show per click
                const items = document.querySelectorAll("#posts-list .post-item");
                let currentlyVisible = 0;

                // Function to show the next set of items
                function showNextItems() {
                    const nextItems = currentlyVisible + itemsPerPage;

                    for (let i = currentlyVisible; i < nextItems && i < items.length; i++) {
                        items[i].style.display = "block"; // Make the items visible
                    }

                    currentlyVisible = nextItems;

                    // Hide the button if no more items to show
                    if (currentlyVisible >= items.length) {
                        document.getElementById("load-more").style.display = "none";
                    }
                }

                // Initially show the first set of items
                showNextItems();

                // Add event listener for "Load More" button
                document.getElementById("load-more").addEventListener("click", showNextItems);
            }
        });
    });


    // Handle form submission
    $('#apply-filters').click(function(){
        var category1 = $('#categoryInput1').val();
        var category2 = $('#categoryInput2').val();
        var dateFilter = $('#dateRangeInput').val();

        // alert('c1 = ' + category1 + ' cat2=' + category2 + ' date=' + dateFilter);

        $.ajax({
            url: '../ajax/get_posts.php',
            method: 'POST',
            data: {category1: category1, category2: category2, dateFilter: dateFilter},
            success: function(response){
                $('#posts-list').html(response);
            }
        });
    });
});
</script>

<?php get_footer();

// https://www.advancedcustomfields.com/resources/date-time-picker/
// https://wpwebinfotech.com/blog/how-to-use-ajax-in-wordpress/
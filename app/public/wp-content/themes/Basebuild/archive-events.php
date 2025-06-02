<?php

get_header(); ?>

<div class="page">
    <?php get_template_part( 'template-parts/title-section', null, array('archive' => 'wo_')); ?>
    <section class="section events border-bottom">
        <div class="container">
            <div class="row">
                <div class="col-sm-12 col-md-3">
                    <h3>When:</h3><br>
                    <div class="button-grid" id="dateRangeButtons">
                        <button class="red" type="button" data-value="today">Today</button>
                        <button class="red" type="button" data-value="week">This Week</button>
                        <button class="red" type="button" data-value="month">This Month</button>
                    </div>
                    <input type="hidden" name="date_range" id="dateRangeInput">
                </div>
                <div class="col-sm-12 col-md-3">
                    <h3>Where:</h3><br>
                    <div class="button-grid" id="locationButtons">
                        <button class="green solid" type="button" data-value="in-gallery">In Gallery</button>
                        <button class="green solid" type="button" data-value="beyond-gallery">Beyond the Gallery</button>
                    </div>
                    <input type="hidden" name="location" id="locationInput">
                </div>
                <div class="col-sm-12 col-md-6">
                    <h3>What:</h3><br>
                    <div class="button-grid categoryButtons" id="categoryButtons">
                        <button class="blue" type="button" data-value="exhibition">Exhibition</button>
                        <button class="blue" type="button" data-value="event">Event</button>
                        <button class="blue" type="button" data-value="vr">VR</button>
                        <button class="blue" type="button" data-value="online">Online</button>
                    </div>
                    <div class="button-grid categoryButtons">
                        <button class="black" type="button" data-value="" id="clear">Clear All</button>
                        <button id="apply-filters" type="submit" class="black">Apply</button>
                    </div>
                    <input type="hidden" name="category1" id="categoryInput1">
                    
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
    var location = $('#locationInput').val();
    var dateFilter = $('#dateRangeInput').val();

    // alert('c1 = ' + category1 + ' cat2=' + category2 + ' date=' + dateFilter);

    $.ajax({
        url: '../ajax/get_posts.php',
        method: 'POST',
        data: {category1: category1, dateFilter: dateFilter, location: location},
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
        $('#categoryButtons button').removeClass('selected');
        $(this).addClass('selected');
        $('#categoryInput1').val($(this).data('value'));
    });

    // Handle location selection
    $('#locationButtons button').on('click', function() {
        $('#locationButtons button').removeClass('selected');
        $(this).addClass('selected');
        $('#locationInput').val($(this).data('value'));
    });

    $('#clear').on('click', function() {
        $('button').removeClass('selected selected-category');
        $('button').removeClass('selected selected-location');
        $('#dateRangeInput').val('');
        $('#categoryInput1').val('');
        $('#locationInput').val('');

        $.ajax({
            url: '../ajax/get_posts.php',
            method: 'POST',
            data: {category1: category1, dateFilter: dateFilter, location: location},
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
        var dateFilter = $('#dateRangeInput').val();
        var location = $('#locationInput').val();

        // alert('c1 = ' + category1 + ' location=' + location + ' date=' + dateFilter);

        $.ajax({
            url: '../ajax/get_posts.php',
            method: 'POST',
            data: {category1: category1, dateFilter: dateFilter, location: location},
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
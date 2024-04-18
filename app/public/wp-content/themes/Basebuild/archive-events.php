<?php

get_header(); ?>

<div class="page">
    <section class="section">
        <div class="container">
            <div class="row">
                <div id="filters">
                    <!-- Filter by category -->
                    <select id="category-filter">
                        <option value="">All Categories</option>
                        <option value="in-gallery">In Gallery</option>
                        <option value="beyond-gallery">Beyond The Gallery</option>
                        <option value="exhibition">Exhibition</option>
                        <option value="event">Event</option>
                        <option value="vr">VR</option>
                        <option value="online">Online</option>
                    </select>

                    <!-- Filter by date -->
                    <select id="date-filter">
                        <option value="today">Today</option>
                        <option value="week">This Week</option>
                        <option value="month">This Month</option>
                    </select>

                    <button id="apply-filters">Apply Filters</button>
                </div>
                <div id="posts-list">
                    <!-- Post data will be displayed here -->
                </div>

            </div>
        </div>
    </section>
</div>

<script>
$(document).ready(function(){
    $('#apply-filters').click(function(){
        var category = $('#category-filter').val();
        var dateFilter = $('#date-filter').val();
        var templateDir = "<?php bloginfo('template_directory') ?>";
        $.ajax({
            url: '../ajax/get_posts.php',
            method: 'POST',
            data: {category: category, dateFilter: dateFilter},
            success: function(response){
                $('#posts-list').html(response);
            }
        });
    });
});
</script>

<?php get_footer();

// event_type 
// in-gallery : In Gallery
// beyond-gallery : Beyond The Gallery
// exhibition : Exhibition
// event : Event
// vr : VR
// online : Online


// access
// wheelchair : Wheelchair 
// toilets : toilets
// accessible-toilet : accessible-toilet
// gender-neutral : gender-neutral
// quiet-hours : quiet-hours
// hearing-loop : hearing-loop
// baby-changing : baby-changing
// refreshments : refreshments
// parking : parking
// disabled-parking : disabled-parking



// https://www.advancedcustomfields.com/resources/date-time-picker/
// https://wpwebinfotech.com/blog/how-to-use-ajax-in-wordpress/
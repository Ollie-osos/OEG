<script>
    document.addEventListener("DOMContentLoaded", function() {
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
    });
</script>
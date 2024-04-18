<?php

$id = ($args['id']) ? $args['id'] : '';
$video = ($args['video']) ? $args['video'] : '';

?>

<div class="modal" id="<?php echo $id; ?>">
    <a href="#searchModalDialog" class="modal-overlay close-btn" aria-label="Close"></a>
    <?php if ($video) { ?>
        <div class="modal-content">
            <div class="modal-header u-flex u-justify-space-between">
                <div class="modal-title">&nbsp;</div>
                <a href="#components" aria-label="Close" id="iframe-close">
                    <img src="<?php echo get_template_directory_uri() ?>/dist/img/modal.png" style="width: 55px" alt="newsletter">
                </a>
            </div>
            <div class="modal-body">
                <div class="videoWrapper">
                    <iframe width="560" height="315" src="<?php echo $video; ?>" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
                </div>
            </div>
        </div>
    <?php } ?>
</div>

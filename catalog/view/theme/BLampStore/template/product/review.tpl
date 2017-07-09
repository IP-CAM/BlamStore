<?php if ($reviews) { ?>
<?php foreach ($reviews as $review) { ?>
  <div class="con_review">
    <div class="con_review_head">
      <div class="author"><?php echo $review['author']; ?></div>
      <div class="star">
        <?php for ($i = 1; $i <= 5; $i++) { ?>
        <?php if ($review['rating'] < $i) { ?>
        <span class="fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
        <?php } else { ?>
        <span class="fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
        <?php } ?>
        <?php } ?>
      </div>
      <div class="date_added"><?php echo $review['date_added']; ?></div>
    </div>
    <div class="con_review_body">
      <?php echo $review['text']; ?>
    </div>
  </div>
<?php } ?>
<div class="text-right"><?php echo $pagination; ?></div>
<?php } else { ?>
<p><?php echo $text_no_reviews; ?></p>
<?php } ?>

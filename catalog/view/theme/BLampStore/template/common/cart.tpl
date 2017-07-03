
  <a data-toggle="dropdown" data-loading-text="<?php echo $text_loading; ?>" class="dropdown-toggle">
  <?php if ($data_in_cart["count"] == 0): ?>
    <div class="img-cart-empty">
    <img src="\catalog\view\theme\BLampStore\image\Korzina_new.png" alt="">
    </div>
  </a>
  <?php else: ?>
    <div class="img-cart-full">
    <img src="\catalog\view\theme\BLampStore\image\Korzina_full_new.png" alt="">
    <span class="cart-total"><small>x</small><?php echo $data_in_cart["count"]; ?></span>
    </div>
  </a>
  <?php endif; ?>
  <ul class="dropdown-menu pull-right">
    <?php if ($products || $vouchers) { ?>
    <li>
      <?php foreach ($products as $product) { ?>
        <div class="row items">

          <div class="col-md-2 col-sm-2 col-xs-3">
            <?php if ($product['thumb']) { ?>
                <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a>
            <?php } ?>
          </div>
          <div class="col-md-3 col-sm-3 col-xs-3">
            <a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
              <?php if ($product['option']) { ?>
              <?php foreach ($product['option'] as $option) { ?>
              <br />
              - <small><?php echo $option['name']; ?> <?php echo $option['value']; ?></small>
              <?php } ?>
              <?php } ?>
              <?php if ($product['recurring']) { ?>
              <br />
              - <small><?php echo $text_recurring; ?> <?php echo $product['recurring']; ?></small>
              <?php } ?>
          </div>
          <div class="col-md-2 col-sm-2 hidden-xs">
           x <?php echo $product['quantity']; ?>
          </div>
          <div class="col-md-3 col-sm-3 col-xs-4">
            <span class="price font-numbers"><?php echo $product['total']; ?></span>
          </div>
          <div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">
            <button type="button" id="<?= $product['cart_id'] ?>"  title="<?php echo $button_remove; ?>" class="btn-cart-remove"><i class="fa fa-times"></i></button>
          </div>

        </div>
        <?php } ?>


    </li>
    <li>
      <div class="row total">
        <div class="col-md-4 col-sm-4 col-xs-4 col-xs-offset-4  col-sm-offset-4 col-md-offset-4 text-right"><strong><?php echo $totals[1]['title'].":"; ?></strong></div>
        <div class="col-md-4 col-sm-4 col-xs-4 text-center font-numbers"><?php echo $totals[1]['text']; ?></div>
      </div>
      <div class="row cart-ref">
        <div class="col-md-6 text-center"><a class="btn btn-block btn-lg" href="<?php echo $cart; ?>"><strong><i class="fa fa-shopping-cart"></i> <?php echo $text_cart; ?></strong></a></div>
        <div class="col-md-6 text-center"><a class="btn btn-block btn-lg" href="<?php echo $checkout; ?>"><strong><i class="fa fa-share"></i> <?php echo $text_checkout; ?></strong></a></div>
      </div
    </li>
    <?php } else { ?>
    <li>
      <p class="text-center"><?php echo $text_empty; ?></p>
    </li>
    <?php } ?>
  </ul>

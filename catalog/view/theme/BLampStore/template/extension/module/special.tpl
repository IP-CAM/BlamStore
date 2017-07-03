<div class="row">
  <div class="col-md-1 col-sm-2 hidden-xs">
    <img src="/catalog/view/theme/BLampStore/image/img03_hover.png" alt="">
  </div>
  <div class="col-md-11 col-sm-10 col-xs-12">
    <h3 class="featured-name"><?php echo $heading_title; ?></h3>
  </div>
</div>
<div class="row">
  <?php foreach ($products as $product) { ?>
  <div class="product-layout col-lg-3 col-md-3 col-sm-6 col-xs-12">
    <div class="product-thumb transition">
      <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
      <div class="caption">
        <h4><a class="font-numbers" href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
        <!-- <p><?php echo $product['description']; ?></p> -->

        <div class="rating text-center">
          <?php for ($i = 1; $i <= 5; $i++) { ?>
          <?php if ($product['rating'] < $i) { ?>
          <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
          <?php } else { ?>
          <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
          <?php } ?>
          <?php } ?>
        </div>

      </div>

      <div class="row offers ">
        <div class="col-md-6 col-sm-6 col-xs-6 price font-numbers"><?php if ($product['price']) { ?>
        <!-- <p> -->
          <?php if (!$product['special']) { ?>
          <p class="price-gen"><?php echo $product['price']; ?></p>
          <?php } else { ?>
          <span class="price-new"><?php echo $product['special']; ?></span><br><span class="price-old"><?php echo $product['price']; ?></span>
          <?php } ?>
        <!-- </p> -->
        <?php } ?></div>
        <div class="col-md-6 col-sm-6 col-xs-6 submit-button text-right">
          <button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-shopping-cart"></i> <span ><?php echo $button_cart; ?></span></button>
        </div>
      </div>
    </div>
  </div>
  <?php } ?>
</div>

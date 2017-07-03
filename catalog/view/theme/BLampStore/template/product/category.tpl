<?php echo $header; ?>
<div class="container-fluid">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <h1 class="text-center"><?php echo $heading_title; ?></h1>
      <hr class="hidden-md hidden-sm hidden-lg">
      <?php if ($thumb || $description) { ?>
      <div class="row hidden-sm hidden-md hidden-lg">
        <?php if ($thumb) { ?>
        <div class="col-xs-3 hidden-480"><img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" title="<?php echo $heading_title; ?>" class="img-thumbnail" /></div>
        <?php } ?>
        <div class="col-xs-7">
          <?php if ($categories) { ?>
          <?php if (count($categories) <= 5) { ?>
          <div class="row hidden-sm hidden-md hidden-lg">

              <ul class="sub-category">
                <?php foreach ($categories as $category) { ?>
                <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>&nbsp;&nbsp;</li>
                <?php } ?>
              </ul>

          </div>
          <?php } else { ?>
          <div class="row hidden-sm hidden-md hidden-lg">
            <?php foreach (array_chunk($categories, ceil(count($categories) / 4)) as $categories) { ?>
            <div class="col-sm-3">
              <ul>
                <?php foreach ($categories as $category) { ?>
                <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
                <?php } ?>
              </ul>
            </div>
            <?php } ?>
          </div>
          <?php } ?>
          <?php } ?>

        </div>
      </div>
      <hr>
      <?php } ?>

      <?php if ($products) { ?>
      <div class="row sort-products">
        <div class="col-md-6 col-sm-8 col-xs-12">
          <div class="input-group input-group-sm">
            <label class="col-md-4 col-sm-4 col-xs-5 control-label" for="input-sort"><?php echo $text_sort; ?></label>
            <div class="col-md-8 col-sm-8 col-xs-7">
              <button id="input-sort" class="btn btn-default btn-select">
                  <input type="hidden" class="btn-select-input" id="" name="" value="" />
                  <span class="btn-select-value">Select an Item</span>
                  <span class='btn-select-arrow glyphicon glyphicon-chevron-down'></span>
                  <ul>
                    <?php foreach ($sorts as $sorts) { ?>
                    <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
                      <li class="selected"> <a href="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></a></li>
                      <?php } else { ?>
                      <li><a href="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></a></li>
                      <?php } ?>
                      <?php } ?>
                  </ul>
              </button>
            </div>
          </div>
        </div>
        <div class=" col-md-offset-3 col-md-3 hidden-sm hidden-xs">
          <div class="input-group input-group-sm">
            <div class="col-md-offset-10 col-md-2">
              <button id="input-limit" class="btn btn-default btn-select">
                  <input type="hidden" class="btn-select-input" id="" name="" value="" />
                  <span class="btn-select-value">Select an Item</span>
                  <span class='btn-select-arrow glyphicon glyphicon-chevron-down'></span>
                  <ul>
                    <?php foreach ($limits as $limits) { ?>
                    <?php if ($limits['value'] == $limit) { ?>
                      <li class="selected"> <a href="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></a></li>
                      <?php } else { ?>
                      <li><a href="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></a></li>
                      <?php } ?>
                      <?php } ?>
                  </ul>
              </button>
            </div>
          </div>
        </div>
      </div>
      <div class="row">
        <?php foreach ($products as $product) { ?>
        <div class="product-layout product-grid col-lg-4 col-md-6 col-sm-6 col-xs-12">
          <div class="product-thumb transition">
            <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
              <div class="caption">
                <h4><a class="font-numbers" href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
                <div class="rating text-center">
                  <?php for ($i = 1; $i <= 5; $i++) { ?>
                  <?php if ($product['rating'] < $i) { ?>
                  <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
                  <?php } else { ?>
                  <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
                  <?php } ?>
                  <?php } ?>
                </div>
                <?php if(key($product['stock'])) { ?>
                <p class="instock text-center"><?php echo reset($product['stock']); ?></p>
                  <?php } else { ?>
                <p class="outstock text-center"><?php echo  reset($product['stock']); ?></p>
                  <?php } ?>
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
      <div class="row">
        <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
        <div class="col-sm-6 text-right"><?php echo $results; ?></div>
      </div>
      <?php } ?>
      <?php if (!$categories && !$products) { ?>
      <p><?php echo $text_empty; ?></p>
      <div class="buttons">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
      </div>
      <?php } ?>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>

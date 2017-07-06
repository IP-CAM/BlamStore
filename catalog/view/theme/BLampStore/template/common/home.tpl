
<div class="home-header-asolute">
<?php echo $header; ?>
</div>
<div class="owl-carousel owl-theme">
  <div class="item backround_slider_lamp" >
    <div class = "s1 hidden-xs hidden-sm">
      <p>
        <strong><a href="http://lampa.te.ua/index.php?route=product/category&path=59">Каталог светильников</a></strong>
      </p>


    </div>
  </div>
  <div class="item backround_slider_ceiling_lamp" ></div>
  <div class="item backround_slider_hightech_lamp" ></div>
  <div class="item backround_slider_art_deco_lamp" ></div>
  <div class="item backround_slider_classik_lamp" ></div>
</div>

<div class="container">
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?><?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>

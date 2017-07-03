

<div class="list-group">
  <?php foreach ($categories as $category) { ?>
  <?php if ($category['category_id'] == $category_id) { ?>
    <a class="list-group-item active" data-remote="true" href="#<?php echo $category['category_id']?>" data-toggle="collapse" data-parent="#<?php echo $category['category_id']?>"  aria-expanded="true">
          <span ><?php echo $category['name']; ?></span>
          <span text-right class="menu-ico-collapse"><i class="fa fa-chevron-down"></i></span>
    </a>
  <?php if ($category['children']) { ?>
  <div class="collapse list-group-submenu collapse in" id="<?php echo $category['category_id']?>">
  <?php foreach ($category['children'] as $child) { ?>
  <?php if ($child['category_id'] == $child_id) { ?>
   <a href="<?php echo $child['href']; ?>" class="list-group-item sub-item current-sub-group" data-parent="#<?php echo $category['category_id']?>"><?php echo $child['name']; ?></a>
  <?php } else {?>
   <a href="<?php echo $child['href']; ?>" class="list-group-item sub-item" data-parent="#<?php echo $category['category_id']?>"><?php echo $child['name']; ?></a>
  <?php } ?>
  <?php } ?>
  </div>
  <?php } ?>
  <?php } else {?>
    <a class="list-group-item items" data-remote="true" href="#<?php echo $category['category_id']?>" data-toggle="collapse" data-parent="#<?php echo $category['category_id']?>">
          <span ><?php echo $category['name']; ?></span>
          <span class="menu-ico-collapse"><i class="fa fa-chevron-down"></i></span>
    </a>
  <?php if ($category['children']) { ?>
  <div class="collapse list-group-submenu" id="<?php echo $category['category_id']?>">
  <?php foreach ($category['children'] as $child) { ?>
   <a href="<?php echo $child['href']; ?>" class="list-group-item sub-item" data-parent="#<?php echo $category['category_id']?>" ><?php echo $child['name']; ?></a>
  <?php } ?>
  </div>
  <?php } ?>
  <?php } ?>
  <?php } ?>

</div>

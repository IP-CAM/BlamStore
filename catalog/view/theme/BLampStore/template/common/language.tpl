<?php if (count($languages) > 1) { ?>

<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-language">
  <div class="btn-group">
    <button class="btn btn-link dropdown-toggle" data-toggle="dropdown">

    <?php foreach ($languages as $language) { ?>
    <?php if ($language['code'] == $code) { ?>
    <img src="catalog/language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png"
    alt="<?php echo $language['name']; ?>" title="<?php echo $language['name']; ?>">
    <?php } ?>
    <?php } ?>
      <span class="hidden-xs hidden-sm hidden-md"></span></button>
    <ul class="dropdown-menu dropdown-menu-right">
      <li>

      <?php foreach ($languages as $language) { ?>

        <button class="btn btn-link btn-block language-select" type="button"
        name="<?php echo $language['code']; ?>">
        <img src="catalog/language/<?php echo $language['code']; ?>/<?php echo $language['code']; ?>.png"
        alt="<?php echo $language['name']; ?>"
        title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></button>

      <?php } ?>

    </li>
    </ul>
  </div>
  <input type="hidden" name="code" value="" />
  <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
</form>
<?php } ?>

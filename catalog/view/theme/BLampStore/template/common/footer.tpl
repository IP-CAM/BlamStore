<footer>
  <div class="container">
    <div class="row">
      <div class="col-md-3 hidden-xs hidden-sm">
        <div class="footer-logo">
        <img src="<?php echo $logo; ?>" title="Blamp logo" alt="Blamp logo"  />
        <?php echo $powered; ?>
        </div>

      </div>

      <?php if ($informations) { ?>
      <div class="col-md-3">
        <h5><?php echo $text_information; ?></h5>
        <ul class="list-unstyled">
          <?php foreach ($informations as $information) { ?>
          <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
          <?php } ?>
        </ul>
      </div>
      <?php } ?>
      <div class="col-md-3">
        <h5><?php echo $text_extra; ?></h5>
        <ul class="list-unstyled">
          <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
          <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
          <li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
        </ul>
      </div>
      <div class="col-md-3">
        <h5><?php echo $text_account; ?></h5>
        <ul class="list-unstyled">
          <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
          <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
        </ul>
      </div>
    </div>
  </div>
</footer>
</body></html>

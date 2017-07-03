<div class="row">
  <div class="col-sm-6">
    <div class="checkout__costumer">
    <h2><?php echo $text_new_customer; ?></h2>
    <p><?php echo $text_guest; ?></p>
    <p><?php echo $text_register_account; ?></p>
    </div>
    <input type="button" value="<?php echo $button_continue_without_registering; ?>" id="button-account" data-loading-text="<?php echo $text_loading; ?>" class="btn " />
  </div>
  <div class="col-sm-6">
    <div class="checkout__costumer">
    <h2><?php echo $text_returning_customer; ?></h2>
    <div class="form-group">
      <label class="control-label" for="input-email"><?php echo $entry_email; ?></label>
      <input type="text" name="email" value="" placeholder="<?php echo $entry_email; ?>" id="input-email" class="form-control" />
    </div>
    <div class="form-group">
      <label class="control-label" for="input-password"><?php echo $entry_password; ?></label>
      <input type="password" name="password" value="" placeholder="<?php echo $entry_password; ?>" id="input-password" class="form-control" />
      <a href="<?php echo $forgotten; ?>"><?php echo $text_forgotten; ?></a></div>
    </div>
    <div class="login__block">
    <input type="button" value="<?php echo $button_login; ?>" id="button-login" data-loading-text="<?php echo $text_loading; ?>" class="btn " />
    <a href="<?php echo $register; ?>" class="registration"><?php echo $button_registration; ?></a>
    </div>
  </div>
</div>

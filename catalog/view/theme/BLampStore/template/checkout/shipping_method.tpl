<?php if ($error_warning) { ?>
<div class="alert alert-warning"><i class="fa fa-exclamation-circle"></i>
  <?php echo $error_warning; ?>
</div>
<?php } ?>
<?php if ($shipping_methods) { ?>
<legend>
  <?php echo $text_shipping_method; ?>
</legend>
<div class="row">
  <!-- NP Carrier -->
  <?php if (!$shipping_methods['free']['error']) { ?>

  <?php foreach ($shipping_methods['free']['quote'] as $quote) { ?>

  <div class="col-md-4 shipping_method" id='np'>

    <div class="carrier__img">
      <img src="catalog\view\theme\BLampStore\image\np-logo.svg" alt="carrier-img" >
    </div>
    <p class="carrier__name"><strong><?php echo $shipping_methods['free']['title']; ?></strong></p>
    <label>
    <input type="radio" class="radio hidden" name="shipping_method" value="<?php echo $quote['code']; ?>" checked='checked' />
    <?php if (isset($quote['description'])) { ?>
    <br /><small><?php echo $quote['description']; ?></small>
    <?php } ?>
  </label>
    <div id="carriers-info">
      <label class="control-label" for="cities" ><?php echo $text_shipping_city; ?></label>
      <div required class="input-group">
        <input name = "city" type="text" class="form-control required" id="cities" placeholder="<?php echo $shipping_methods['free']['quote']['free']['placeholder']; ?>">
        <span class="input-group-addon"><i class="fa fa-search" aria-hidden="true"></i></span>
      </div>
      <label class="control-label" for="office"> <?php print_r($shipping_methods['free']['quote']['free']['input_title']) ?></label>
      <select name='address' disabled data-placeholder = "<?php echo $shipping_methods['free']['quote']['free']['placeholder_for_post']; ?>" id="office" class="form-control" >


      </select>
    </div>
  </div>
  <?php } ?>
  <?php } else { ?>
  <div class="alert alert-danger">
    <?php echo $shipping_methods['free']['error']; ?>
  </div>
  <?php } ?>

  <!-- pickup method -->
  <?php if (!$shipping_methods['pickup']['error']) { ?>

  <?php foreach ($shipping_methods['pickup']['quote'] as $quote) { ?>

  <div class="col-md-4 col-sm-offset-1 shipping_method" id='pu'>
    <div class="carrier__img">
      <img src="catalog\view\theme\BLampStore\image\pickup.png" alt="carrier-img" >
    </div>
    <p class="carrier__name"><strong><?php echo $shipping_methods['pickup']['title']; ?></strong></p>
    <label>
    <input class="radio hidden" type="radio" name="shipping_method" value="<?php echo $quote['code']; ?>"  />
    <?php if (isset($quote['description'])) { ?>
    <br /><small><?php echo $quote['description']; ?></small>
    <?php } ?>
  </label>
    <div id="carriers-info">
      <label class="control-label" for="city_shops"><?php echo $text_shipping_city; ?></label>
      <div class="input-group">
      <input type="text" name = "city" id="city_shops" class="form-control"  value="Тернопіль" disabled>
      <span class="input-group-addon"><i class="fa fa-search" aria-hidden="true"></i></span>
      </div>
      <label class="control-label" for="shops"> <?php print_r($shipping_methods['pickup']['quote']['pickup']['input_title']) ?></label>
      <select name='address' id="shops" class="form-control" name="">
        <option selected value="маг'Велика Лампа' Шептицького 3">маг'Велика Лампа' вул. Шептицького, 3</option>
        <option value="маг'Велика Лампа' вулиця Євгена Коновальця, 11">маг'Велика Лампа' вул. Євгена Коновальця, 11</option>

      </select>
    </div>

  </div>

  <?php } ?>

  <?php } else { ?>
  <div class="alert alert-danger">
    <?php echo $shipping_methods['pickup']['error']; ?>
  </div>
  <?php } ?>
</div>
<?php } ?>

<!-- <p><strong><?php echo $text_comments; ?></strong></p>
<p>
  <textarea name="comment" rows="8" class="form-control"><?php echo $comment; ?></textarea>
</p> -->
<div class="buttons">
  <div class="pull-left">
    <input type="button" value="<?php echo $button_continue; ?>" id="button-shipping-method" data-loading-text="<?php echo $text_loading; ?>" class="btn" />
  </div>
</div>
<script type="text/javascript">
  $(document).ready(function() {
    $('#np,#pu').on('click', function() {
    var checkRadio = $('#np,#pu').find('input[name=shipping_method]:checked');
    var parrentCheckedRadio = checkRadio.parents().find('#np,#pu');
    parrentCheckedRadio.css('background-color', 'white');
    $(this).css('background-color', '#f2d888');
    $(this).find(".radio").prop("checked", true);
    });

    $('#carriers-info > div > span').on('click', function(){

    });
    $('#cities').autocomplete({
      source: function(request, response){
        var matcher = new RegExp( "^" + $.ui.autocomplete.escapeRegex( request.term ), "i" );
        response( $.grep( Cities(), function( item ){
             return matcher.test( item.value );
         }) );
      },
      minLength: 2,
      select: function(e, ui) {
        $('#office').find('option').remove();
        $.ajax({
          type: "POST",
          dataType: "json",
          url: 'https://api.novaposhta.ua/v2.0/json/',
          data: JSON.stringify({
            "modelName": "AddressGeneral",
            "calledMethod": "getWarehouses",
            "methodProperties": {
              "CityRef": ui.item.lable,
              "Language": "ua"
            },
            "apiKey": "385167acddda86fb9c1786f437b71f4b"

          }),
          success: function(data) {
            $('#office').prop('disabled',false);
            var sel = $('#office');
            $(data.data).each(function() {
              sel.append($("<option>").attr('value', this.Description).text(this.Description));
            });
            $('#office').prop('disabled',false);
          },
         error: function(){
           var elementId = $('#np,#pu').find('input[name=shipping_method]:checked').parents()[1].id;
           var inputCity = $('#'+elementId+' input[name=\'city\']').parent();
           var select = $('#'+elementId+' select').prop('disabled',true);
           $(inputCity).after('<div class="text-danger">' + 'Произошла ошибка введите назву города еще раз' + '</div>');
         }
        })

      },

    });
  });
</script>

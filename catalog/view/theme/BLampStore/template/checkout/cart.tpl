<?php echo $header; ?>
<div class="container" id='general-cart'>
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <?php if ($attention) { ?>
  <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $attention; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <?php if ($success) { ?>
  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <?php if ($error_warning) { ?>
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <h1><?php echo $heading_title; ?>
        <?php if ($weight) { ?>
        &nbsp;(<?php echo $weight; ?>)
        <?php } ?>
      </h1>
      <form class = 'general-cart' action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
        <div class="table-responsive">
          <table class="table table-based">
            <thead>
              <tr>
                <td ></td>
                <td class="text-center"><?php echo $column_image; ?></td>
                <td class="text-left"><?php echo $column_name; ?></td>
                <td class="text-center"><?php echo $column_price; ?></td>
                <td class="text-left"><?php echo $column_quantity; ?></td>

                <td class="text-left"><?php echo $column_total; ?></td>
              </tr>
            </thead>
            <tbody>
              <?php foreach ($products as $product) { ?>
              <tr>
                <td class="text-right">
                  <button type="button" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger" onclick="cart.remove('<?php echo $product['cart_id']; ?>');" ><i class="fa fa-times-circle"></i></button> </td>
                <td class="text-center"><?php if ($product['thumb']) { ?>
                  <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-thumbnail" /></a>
                  <?php } ?></td>
                <td class="text-left"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                  <?php if (!$product['stock']) { ?>
                  <span class="text-danger">***</span>
                  <?php } ?>
                  <?php if ($product['option']) { ?>
                  <?php foreach ($product['option'] as $option) { ?>
                  <br />
                  <small><?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
                  <?php } ?>
                  <?php } ?>
                  <?php if ($product['reward']) { ?>
                  <br />
                  <small><?php echo $product['reward']; ?></small>
                  <?php } ?>
                  <?php if ($product['recurring']) { ?>
                  <br />
                  <span class="label label-info"><?php echo $text_recurring_item; ?></span> <small><?php echo $product['recurring']; ?></small>
                  <?php } ?></td>
                <td class="text-center"><?php echo $product['price']; ?></td>
                <td class="text-center"><div class="form-group ">
                      <div class="count-input space-bottom">
                        <a class="incr-btn" data-action="decrease" href="#">–</a>
                          <input class="quantity" type="text" value="<?php echo $product['quantity']; ?>" name="quantity[<?php echo $product['cart_id']; ?>]" id="input-quantity-general"/>
                        <a class="incr-btn" data-action="increase" href="#">&plus;</a>
                      </div>
                      <div>
                    </div>
                  </div>
                </td>

                <td class="text-left"><?php echo $product['total']; ?></td>
              </tr>
              <?php } ?>
              <?php foreach ($vouchers as $voucher) { ?>
              <tr>
                <td></td>
                <td class="text-left"><?php echo $voucher['description']; ?></td>
                <td class="text-left"></td>
                <td class="text-left"><div class="input-group btn-block" style="max-width: 200px;">
                    <input type="text" name="" value="1" size="1" disabled="disabled" class="form-control" />
                    <span class="input-group-btn">
                    <button type="button" data-toggle="tooltip" title="<?php echo $button_remove; ?>" class="btn btn-danger" onclick="voucher.remove('<?php echo $voucher['key']; ?>');"><i class="fa fa-times-circle"></i></button>
                    </span></div></td>
                <td class="text-right"><?php echo $voucher['amount']; ?></td>
                <td class="text-right"><?php echo $voucher['amount']; ?></td>
              </tr>
              <?php } ?>
            </tbody>
          </table>
        </div>
      </form>
      <?php if ($modules) { ?>
      <div class="panel-group" id="accordion">
        <?php foreach ($modules as $module) { ?>
        <?php echo $module; ?>
        <?php } ?>
      </div>
      <?php } ?>
      <br />
      <div class="row">
        <div class="col-sm-5 col-sm-offset-7 cart-submit-chekout">
          <table class="table table-based table-responsive">
            <?php foreach ($totals as $total) { ?>
            <tr>
              <td class="text-right"><strong><?php echo $total['title']; ?>:</strong></td>
              <td class="text-right"><?php echo $total['text']; ?></td>
            </tr>
            <?php } ?>
          </table>
          <div class="pull-right"><a href="<?php echo $checkout; ?>" class="btn btn-lg"><?php echo $button_checkout; ?></a></div>
        </div>
      </div>
      <div class="buttons clearfix">
        <div class="pull-left"><a href="<?php echo $continue; ?>" class="btn btn-default btn-lg"style="margin-top:92px; font-size:20px"><?php echo $button_shopping; ?></a></div>

      </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>
<script type="text/javascript">
$('document').ready(function(){
  $('html, body').animate({
  scrollTop: $("#general-cart").offset().top
}, 500);

});
// change general cart
function editGeneralCart () {
	$.ajax({
		url:'index.php?route=checkout/cart/edit',
		type:'post',
		data:$('.general-cart').serialize(),

		success: function(responseHtml){
      $('#content').html($(responseHtml).find('#content').html());
      $('#cart').html($(responseHtml).find('#cart').html());
      $(".incr-btn").on("click", countInput);
      var test = $(responseHtml).find('.alert-danger');
      if(test.length){
      $('.alert-danger').remove();
      $("#general-cart > div:nth-child(2)").prepend('<div class="alert alert-danger">'+test.html()+'</div>');
      }
      else {
        $('.alert-danger').remove();
      }

		}
	});

};

</script>

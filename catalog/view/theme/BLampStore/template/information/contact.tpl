<?php echo $header; ?>
<div class="container">
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


      <h3><?php echo $text_location; ?></h3>

          <div class="contact">
            <?php if ($image) { ?>
            <div class="contact__img">
              <img src="<?php echo $image; ?>" alt="<?php echo $store; ?>" title="<?php echo $store; ?>" class="img" />
            </div>
            <?php } ?>
            <div class="contact__address">
              <span><?php echo $store; ?></span><br />
              <address>
              <?php echo $address; ?>
              </address>


            </div>
            <div class="contact__info">
              <span><?php echo $text_telephone; ?></span><br>
              <?php echo $telephone; ?><br />
              <span>info@lampa.te.ua</span><br />
              <br />
            </div>
            <div class="contact__open">
              <?php if ($open) { ?>
              <span><?php echo $text_open; ?></span><br />
              <?php echo $open; ?><br />
              <br />
              <?php } ?>
              <?php if ($comment) { ?>
              <strong><?php echo $text_comment; ?></strong><br />
              <?php echo $comment; ?>
              <?php } ?>
            </div>
          </div>

  <iframe width="100%" height="450" frameborder="0" style="border:0" src="https://www.google.com/maps/embed/v1/place?q=%D0%B2%D0%B5%D0%BB%D0%B8%D0%BA%D0%B0%20%D0%BB%D0%B0%D0%BC%D0%BF%D0%B0&key=AIzaSyBg7lxgcjEoXPdtUt8a9L2yl6e__okhwUI" allowfullscreen></iframe>
  <div class="con_information">
  <button type="button" class="btn  btn-lg" data-toggle="modal" data-target="#n">
  <h1><?php echo $heading_title; ?></h1>
  <i class="fa fa-envelope-o fa-4x" aria-hidden="true"></i>
  </button>

  <div id="n" class="modal fade" role="dialog">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
           <button type="button" class="close" data-dismiss="modal">&times;</button>
           <h4 class="modal-title"><?php echo $text_contact; ?></h4>
         </div>
       <div class="info_feedback">
        <form id="feedback" action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
          <fieldset>
            <div class="form-group required">
              <label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
              <div class="col-sm-10">
                <input type="text" name="name" value="<?php echo $name; ?>" id="input-name" class="form-control" />



              </div>
            </div>
            <div class="form-group required">
              <label class="col-sm-2 control-label" for="input-email"><?php echo $entry_email; ?></label>
              <div class="col-sm-10">
                <input type="text" name="email" value="<?php echo $email; ?>" id="input-email" class="form-control" />



              </div>
            </div>
            <div class="form-group required">
              <label class="col-sm-2 control-label" for="input-enquiry"><?php echo $entry_enquiry; ?></label>
              <div class="col-sm-10">
                <textarea name="enquiry" rows="10" id="input-enquiry" class="form-control"><?php echo $enquiry; ?></textarea>

              </div>
            </div>
            <?php echo $captcha; ?>
          </fieldset>
        </form>
        </div>
        <div class="modal-footer">
         <!-- <button type="button" class="btn btn-default" data-dismiss="modal">Close</button> -->
         <button id="send_feedback" class="btn"><?php echo $button_submit; ?></button>
        </div>
      </div>
    </div>
  </div>
  </div>

      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>
<script type="text/javascript">
$('html, body').animate({
scrollTop: $("#content > h3").offset().top}, 900);

$(document).on("click","#send_feedback", function(){
  $.ajax({
      type:"POST",
      url: 'index.php?route=information/contact/sendfeedback',
      data: $("#feedback").serialize(),
      complete: function() {
          $('#send_feedback').button('reset');
      },
      success: function(json) {
      if (json['errors']){
        // remove text-denger if they are it
        var validators =  $('#feedback .text-danger');
        validators.each(function(index,element){
          $(element).remove();
        });
        // add text danger to not vaildate field
        for (i in json['errors']){
          $(":input[name='"+i+"']")
           .parent()
            .append("<div class='text-danger'>"+ json['errors'][i]+"</div>");
        }
      }
      else if(json['errors_mail']){
        $('#feedback').remove();
        $('.info_feedback').html(json['errors_mail']);
        $('#send_feedback').remove();

      }
      else if(json['success']){
        $('#feedback').remove();
        $('.info_feedback').html(json['success']);
        $('#send_feedback').remove();
      }
      },
      error: function(xhr, ajaxOptions, thrownError) {
          alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
      }
  });
})
</script>

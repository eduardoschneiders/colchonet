$(function(){
  var $review = $('.review');

  $review.bind('ajax:beforeSend', function(){
    console.log('beforeSend');
    $(this).find('input').attr('disabled', true);
  });

  $review.bind('ajax:error', function(){
    replaceButton(this, 'icon-remove', '#B94A48');
  });

  $review.bind('ajax:success', function(){
    replaceButton(this, 'icon-ok', '#468847');
  });

  function replaceButton(container, icon_class, color){
    $(container).find('input:submit').
      replaceWith($('<i/>').
                    addClass(icon_class).
                    css('color', color));
  };
});

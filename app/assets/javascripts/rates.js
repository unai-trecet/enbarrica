$(document).ready(function() {
  $('#vino_rating').raty({
    readOnly: true,
    score: $('#vino_rating').data('valoracion'),
    path: '../assets/'
  }); 
}); 

$('#valoracion_usuario').raty({
  readOnly: true,
  score: $('#vino_rating').data('valoracion'),
  path: '../assets/'
}); 

$('.btn-default').on('click', function() {
  $('#boton_cambiar_valoracion').raty({
      score: $('#vino_rating').data('valoracion'),
      path: "../assets",
      click: function(score, evt) {
        $.ajax({
          url: "/ratings/" + $('#vino_rating').data('rating_id'),
          type: 'PATCH',
          data: { valoracion: score, rating_id: $('#vino_rating').data('rating_id') } 
        });
    }              
  }).slideToggle();
});

$('.btn-default').on('click', function(){
  $('#boton_valoracion').raty({
    score: $('#vino_rating').data('valoracion'),
    path: '../assets',
    click: function(score, evt) {
      $.ajax({
        url: "/ratings",
        type: 'POST',
        data: { rating: { valoracion: score, vino_id: $('#vino_rating').data('vino_id'), user_id: "#{ current_user.id }"} } 
      });
    }              
  }).slideToggle();
});
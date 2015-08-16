$(document).ready(function() {
  
  $('#vino_rating').raty({
    readOnly: true,
    score: $('#vino_rating').data('valoracion'),
    path: '../assets/'
  });  

  $('#valoracion_usuario').raty({
    readOnly: true,
    score: $('#valoracion_usuario').data('valoracion'),
    path: '../assets/'
  }); 

  $('.btn-default').on('click', function() {
    var rating_id = $('#boton_cambiar_valoracion').data('rating');
    $('#boton_cambiar_valoracion').raty({
      score: '0',
      path: "../assets",
      click: function(score, evt) {
        $.ajax({
          url: "/ratings/" + rating_id,
          type: 'PATCH',
          data: { valoracion: score, rating_id: rating_id } 
        });
      }              
    }).slideToggle();
  });

  $('.btn-default').on('click', function(){
    $('#boton_valoracion').raty({
      score: "0",
      path: '../assets',
      click: function(score, evt) {
        $.ajax({
          url: "/ratings",
          type: 'POST',
          data: { rating: { valoracion: score, vino_id: $("#boton_valoracion").data("vino"), user_id: $("#boton_valoracion").data("user") } } 
        });
      }              
    }).slideToggle();
  });

  $('#valoracion_bodega').raty({
    readOnly: true,  
    score: $('#valoracion_bodega').data('valoracion'),
    path: '../assets'
  }); 

});
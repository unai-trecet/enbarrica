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

  $('#boton_cambiar_valoracion').on('click', function() {
    var rating_id = $('#cambiar_valoracion').data('rating');
    $('#cambiar_valoracion').raty({
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

  $('#boton_valoracion').on('click', function(){
    $('#valorar').raty({
      score: "0",
      path: '../assets',
      click: function(score, evt) {
        $.ajax({
          url: "/ratings",
          type: 'POST',
          data: { rating: { valoracion: score, vino_id: $("#valorar").data("vino"), user_id: $("#valorar").data("user") } } 
        });
      }              
    }).slideToggle();
  });

  $('#valoracion_bodega').raty({
    readOnly: true,  
    score: $('#valoracion_bodega').data('valoracion'),
    path: '../assets'
  }); 

  // $('.user_rating_in_comentario').raty({
  //   readOnly: true,
  //   score: $('.user_rating_in_comentario').data('rating'),
  //   path: '../assets/'    
  // });
});
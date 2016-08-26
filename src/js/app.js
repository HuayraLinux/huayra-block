function ocultarTodos() {
  $('.estadoDetenido').hide();
  $('.estadoJugando').hide();
  $('.estadoPierde').hide();
}

function onGameOver(score) {
  ocultarTodos();
  $('.estadoPierde').show();
}

/* Reto: Leer esto sin querer pegarse un tiro */
process.mainModule.exports.init(require('nwjs-hack').set_wmclass.bind(null, "huayra-block", true));

$('document').ready(function onready() {
  ocultarTodos();
  $('.estadoDetenido').show();

  $("#botonIniciar").click(function() {
    ocultarTodos();
    $('.game').blockrain('start');
    $('.estadoJugando').show();
  });

  $("#botonReiniciar").click(function() {
    ocultarTodos();
    $('.game').blockrain('start');
    $('.estadoJugando').show();
  });

  $("#botonVolver").click(function() {
    ocultarTodos();
    $('.game').blockrain('start');
    $('.estadoJugando').show();
  });

});

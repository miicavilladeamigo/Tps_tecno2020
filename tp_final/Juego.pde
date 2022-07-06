//ESTO SUCEDE EN LA PANTALLA 7. SI GANA, DEBE IR A LA PANTALLA 8. SI PIERDE, A LA DE CREDITOS

class Juego {
  int status;

  PFont mensajeInicial, mensajesGenericos;

  PImage fondo;

  PFont juego, narracion;

  VideoJuego videoJuego;
  AventuraGrafica aventuraGrafica;
  Resize resize;

  Juego(AventuraGrafica aventuraGrafica, Resize resize) {

    this.aventuraGrafica = aventuraGrafica;
    this.resize = resize;

    inicializar();

    juego = loadFont("BookmanOldStyle-Bold-27.vlw");
    narracion = loadFont("BookmanOldStyle-27.vlw");
  }



  void dibujar() {

    if (status == 0) {
      dibujoPantallaInicio();
    } else if (status == 1) {
      dibujarVideoJuego();
    } else if (status == 2) {
      aventuraGrafica.cambiarAPantalla(8);
      inicializar();
    } else if (status == 3) {
      aventuraGrafica.cambiarAPantalla(14);
      inicializar();
    }
  }

  void teclaPresionada() {

    if (status == 0) {
      inicial();
    } else if (status == 1) {
      videoJuego.teclaPresionada(keyCode);
    } else if (status == 2) {
      continuarAventura();
    } else if (status == 3) {
      aventuraGrafica.creditos();
    }
  }

  void dibujoPantallaInicio() {
    textAlign(CENTER);
    textSize(27);
    textFont(narracion);
    text("A su debido tiempo,se separaron y cada uno se dirigió hacia \nsu propio destino.\n"+
      "El hermano mayor siguió viajando algo más de una semana,\ny " +
      "al llegar a la aldea buscó a un mago con el que mantenía\nuna grave disputa.\n\nDerrota al enemigo", aventuraGrafica.resize.resizePosX(400), aventuraGrafica.resize.resizePosY(60));
    fill(255);
    textFont(juego);
    text("Deberás destruir 5 encantamientos para pasar a la \n siguiente pantalla, pero si te tocan 3 veces "+
      "los \nhechizos enemigos, perdes. \n Recuerda, tus hechizos para defenderte \nse disparan con la flecha de arriba\n"+
      "Presiona una tecla derecha para jugar.", aventuraGrafica.resize.resizePosX(400), aventuraGrafica.resize.resizePosY(300));
  }

  void dibujarVideoJuego() {
    videoJuego.dibujar();
    //Controlar Ganar o Perder
    if (videoJuego.controlarEstadosDelJuego() == 1) {
      status = 2;
    } else if (videoJuego.controlarEstadosDelJuego() == 2) {
      status = 3;
    }
  }

  void dibujarMensajes(String mensaje) {
    background(0);
    textAlign(CENTER);
    fill(213, 48, 50);
    text(mensaje, width/2, height/2);
  }

  void continuarAventura() {
    if (keyCode == RIGHT) {
      aventuraGrafica.pantallaActual = aventuraGrafica.pantallas[8];
    }
  }

  void inicial() {
    if (keyCode == RIGHT) {
      status = 1;
    }
  }

  void inicializar() {
    videoJuego = new VideoJuego(resize);
    status = 0;
  }
}

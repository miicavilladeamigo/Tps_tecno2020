class Juego {
  int status;
  PFont mensajeInicial, mensajesGenericos;
  PImage fondo;
  VideoJuego videoJuego;

  Juego() {
    inicializar();
    mensajeInicial = loadFont("BookmanOldStyle-20.vlw");
    mensajesGenericos = loadFont("FranklinGothic-Heavy-20.vlw");
  }

  void dibujar() {
    if (status == 0) {
      dibujoPantallaInicio();
    } else if (status == 1) {
      dibujarVideoJuego();
    } else if (status == 2) {
      dibujarMensajes("Has Derrotado al mago. Puedes avanzar en la historia");
    } else if (status == 3) {
      dibujarMensajes("El mago te ha derrotado. Presiona una tecla para volver a intentarlo");
    }
  }

  void teclaPresionada() {
    if (status == 0) {
      status = 1;
    } else if (status == 1) {
      videoJuego.teclaPresionada(keyCode);
    } else if (status == 2) {
      inicializar();
    } else if (status == 3) {
      inicializar();
    }
  }

  void dibujoPantallaInicio() {
    textAlign(CENTER);
    textFont(mensajeInicial);
    fill(0);
    text("Será reemplazada la pantalla 9, donde Antioch pelea contra el mago. \n"+
      "Deberás destruir 5 encantamientos para pasar a la siguiente pantalla, \n pero si te tocan 3 veces "+
      "los hechizos enemigos, perdes. \n"+
      "Recuerda, esto es una demo, si ganas, el juego se vuelve a reiniciar.\n"+
      "Presiona una tecla para Jugar", width/2, height/3);
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
    textFont(mensajesGenericos);
    fill(213, 48, 50);
    text(mensaje, width/2, height/2);
  }

  void inicializar() {
    videoJuego = new VideoJuego();
    status = 0;
  }
}

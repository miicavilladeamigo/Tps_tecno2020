// DIBUJA TODAS LAS PANTALLAS. A SU VEZ, INCORPORA LA CLASE DEL JUEGO

class Pantalla {
  PImage fondo;

  String texto, navegacion;

  PFont narracion, boton, fuente;

  int pantallaAIr, posX, posY;

  color colorHistoria;

  Juego juego;

  Credito creditos;
  Resize resize;

  Pantalla(PImage p_fondo, String p_texto, String p_navegacion, PFont p_fuente, color p_colorHistoria, Credito creditos, Juego juego, Resize resize) {
    fondo = p_fondo;
    texto = p_texto;
    navegacion = p_navegacion;

    boton = loadFont("Alef-Bold-35.vlw");

    this.creditos = creditos;
    this.juego = juego;
    this.resize = resize;

    fuente = p_fuente;
    colorHistoria = p_colorHistoria;
  }

  void dibujar() {
    if (fondo != null) {

      image(fondo, 0, 0, width, height);
    }

    fill(colorHistoria);


    if (fuente != null) {
      textFont(fuente);
    }

    if (texto != null) {
      text(texto, resize.resizePosX(400), resize.resizePosY(60));
    }

    if (navegacion != null) {
      textFont(boton);
      fill(#138D75);

      text(navegacion, resize.resizePosX(407), resize.resizePosY(250));
    }


    if (creditos != null) {
      creditos.dibujar();
    }
    if (juego != null) {
      juego.dibujar();
    }

    if (resize != null) {
      resize.resizePosY(posY);
      resize.resizePosX(posX);
    }
  }
  void keyPressed() {
    if (juego != null)
      juego.teclaPresionada();
  }
}

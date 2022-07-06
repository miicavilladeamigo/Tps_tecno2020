class Credito {

  String texto, navegacion;

  int pantalla14_PosY_Inicial= 650;

  int pantalla14_PosY = pantalla14_PosY_Inicial;

  PFont boton, creditos, nombres;

  Resize resize;


  Credito(Resize resize) {
    creditos = loadFont("FranklinGothic-Book-35.vlw");
    nombres = loadFont("FranklinGothic-Heavy-35.vlw");
    boton = loadFont("Alef-Bold-35.vlw");

    this.resize = resize;
  }

  void dibujar() {
    fill(255);
    textFont(creditos);
    text("Escrito por \n \n \nTraducidos del \nrúnico antiguo\n\n\nAdaptado por", resize.resizePosX(160), resize.resizePosY(pantalla14_PosY_Inicial));
    textFont(nombres);
    text("J.K ROWLING\n\n\nHERMIONE \nGRANGER \n\n\n                  Villadeamigo Micaela", resize.resizePosX(400), resize.resizePosY(pantalla14_PosY_Inicial));
    textFont(boton);
    fill(#C39BD3);
    text("Presiona la flecha izquierda para volver atrás", width/2, height/2-250);

    if (resize.resizePosY(pantalla14_PosY_Inicial) > width/6) {
      pantalla14_PosY_Inicial--;
    }
  }
}

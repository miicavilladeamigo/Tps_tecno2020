class Jugador {
  PImage varita;
  int posX, posY, tamX, tamY;
  Hechizo hechizo;//Llamo a la instacia hechizo.
  Resize resize;

  Jugador(int posX,int posY, int p_tamX, int p_tamY,  Resize resize) {
    tamX = p_tamX;
    tamY = p_tamY;
    this.posX = posX;
    this.posY = posY;

    hechizo = new Hechizo(25, resize);//Solo defino el TAMAÑO del Hechizo
    varita = loadImage("Jugador.png");
    
    this.resize = resize;
  }
  void dibujar() {
    //resize.resizePosY (posY) + tamY/5
    hechizo.dibujar(resize.resizePosX (this.posX) + tamX/2, resize.resizePosY (this.posY) + tamY/5);//el hechizo se va a dibujar en la MISMA POSICION QUE LA VARITA. La posicion en X, quedara centrado.
    image(varita,resize.resizePosX(this.posX), resize.resizePosY(this.posY),tamX, tamY);
  }
  void teclaDerecha() {

    posX = posX + tamX;
  }
  void teclaIzquierda() {

    posX = posX - tamX;
  }
  void dispararHechizo() {
    hechizo.dispararHechizo();
  }
}

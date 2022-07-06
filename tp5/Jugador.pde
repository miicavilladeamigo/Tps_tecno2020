class Jugador {
  PImage varita;
  int posX, posY, tamX, tamY, posXInicial, posYInicial;
  Hechizo hechizo;//Llamo a la instacia hechizo.


  Jugador(int p_posX, int p_posY, int p_tamX, int p_tamY) {
    posX = p_posX;
    posY = p_posY;
    tamX = p_tamX;
    tamY = p_tamY;

    hechizo = new Hechizo(25);//Solo defino el TAMAÑO del Hechizo
    posXInicial = posX;
    posYInicial = posY;
    varita = loadImage("Jugador.png");
  }
  void dibujar() {
    hechizo.dibujar(posX + tamX/2, posY + tamY/5);//el hechizo se va a dibujar en la MISMA POSICION QUE LA VARITA. La posicion en X, quedara centrado.
    image(varita, posX, posY, tamX, tamY);
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

class Hechizo {
  int posX, posY, tam; // posicion y tamaño del hechizo
  boolean disparada; // para saber si se disparó o no
  color colorHechizo;
  Resize resize;

  Hechizo(int p_tam, Resize resize) {
    tam = p_tam;
    colorHechizo = #008751;
    this.resize = resize;
  }
  void dibujar(int p_posX, int p_posY) {

    if (disparada) {
      posY -=10; // se mueve el hechizo
    } else { 
      posY = p_posY; // el hechizo queda relacionada con el parámetro del jugador
      posX = p_posX;
    }

    fill(colorHechizo);
    ellipse(posX,posY, tam/2, tam);

    if (posY<0) {
      posY = p_posY;
      disparada = false;
    }
  }

  void dispararHechizo() {
    disparada = true;
  }

  void desactivarHechizo() { // reinicio el encantamiento.
    disparada = false;
  }
}

class Encantamiento {
  int posX, posY, direccion;
  int tam;
  boolean choque;
  Encantamiento() {
    tam = 40;
    posX = round(random(tam/2, width-tam/2));
    posY = round(random(-200, -tam/2));
    direccion = round(random(1, 3));
    choque = false;
  }  

  void dibujar() {
    if (!choque) { // Esto sucede si NO CHOCAN
      fill(213, 48, 50);
      noStroke();
      ellipse(posX, posY, tam, tam);
    } else { // Si chocan, lo elimino del lugar y reinicio la bala.
      posY = height; 
      direccion = 0;
    }
  }

  void choqueEntreHechizos() {
    choque = true;
  }

  void movimiento() {

    //Esta condicion me permite mover los encantamientos
    if (posY>height) {   
      posY = round(random(-200, - tam/2));
    }
    posY+= direccion;
  }
}

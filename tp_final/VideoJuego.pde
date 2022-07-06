//SI EL JUGADOR MATA AL MAGO, LO LLEVA A LA PANTALLA DE LOS CREDITOS.

class VideoJuego {
  int estado;

  int cantidadEncantamientos = 25;

  Jugador jugador;
  Encantamiento [] encantamientos = new Encantamiento [cantidadEncantamientos];
  Hechizo hechizo;
  Punto puntos;
  Vida vidas;
  AventuraGrafica aventuraGrafica;
  Resize resize;


  VideoJuego(Resize resize) { 
    this.resize = resize;
    inicializar();//Llamo al atributo inicializar, para que posteriormente pueda llamarlo para reiniciar el Juego
  }

  void inicializar() {
    jugador = new Jugador(300, 450, 100, 150, resize);

    vidas = new Vida(50, 70);//Dibuja el contador de vidas

    puntos = new Punto(600, 70,resize);//Dibuja el contador de puntos.


    for (int i=0; i<encantamientos.length; i++) {
      encantamientos[i] = new Encantamiento(resize);
    }
  }

  void dibujar() {
    background(42, 46, 75);
    jugador.dibujar();

    for (int i=0; i< cantidadEncantamientos; i++) {
      encantamientos[i].dibujar();
      encantamientos[i].movimiento();
    }
    choque();
    pierdeVidas();
    puntos.dibujar();
    vidas.dibujar();
  }

  void choque() { 
    //CHOQUE DE LOS ENCANTAMIENTOS

    for (int i=0; i< cantidadEncantamientos; i++) {

      float distan = dist(encantamientos[i].posX, encantamientos[i].posY, jugador.hechizo.posX, jugador.hechizo.posY );

      if (distan < encantamientos[i].tam/2 ) {

        puntos.incrementar();
        encantamientos[i].choqueEntreHechizos();
        jugador.hechizo.desactivarHechizo(); //reinicio el hechizo.
      }
    }
  }

  void pierdeVidas() {

    for (int i=0; i< cantidadEncantamientos; i++) {

      //CREO el booleano para saber cuando pierde vidas.

      boolean contacto = encantamientos[i].posY > jugador.posX && encantamientos[i].posX < jugador.posX + jugador.tamX 
        && encantamientos[i].posY > jugador.posY && encantamientos[i].posY < jugador.posY + jugador.tamY;
      if (contacto) {
        vidas.pierdeVidas();
        encantamientos[i].choqueEntreHechizos(); // desactivo el encantamiento.
      }
    }
  }

  void disparar(int tecla) {
    if (tecla == UP) {
      jugador.dispararHechizo();
    }
  }

  void teclaPresionada(int tecla) {
    if (tecla == RIGHT) {
      jugador.teclaDerecha();
    }
    if (tecla == LEFT) {
      jugador.teclaIzquierda();
    }
    disparar(keyCode);
  }



  int controlarEstadosDelJuego() {
    if (puntos.controlarPuntos()) {
      return 1; //Si los puntos son igual a 5. Entonces Gana
    } else if (vidas.controlarVidas()) {
      return 2; //Si la cantidad de vidas es igual a 0, entonces pierde.
    }
    return 0; //Si no se cumple ninguna de esas condiciones, el estado no cambia.
  }
}

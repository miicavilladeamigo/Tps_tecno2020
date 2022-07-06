class AventuraGrafica {

  Pantalla pantallaActual;
  Credito creditos;
  Texto textos;
  Juego juego;
  Resize resize = new Resize();

  //SoundFile bandaSonora;

  int pantalla;
  int cantidadPantallas = 15;
  int cantImagenes = 15;

  PFont narracion, titulo;

  PImage [] fondos  = new PImage [cantImagenes];

  Pantalla [] pantallas = new Pantalla [cantidadPantallas];


  AventuraGrafica() {

    //bandaSonora = new SoundFile(pro, "sonido.mp3");
    //bandaSonora.play();
    //bandaSonora.loop();//hace que la música se siga reproduciendo. TODAS LAS PANTALLAS CONTIENEN ESTA MÚSICA


    textos = new Texto();


    cargarFondos();


    titulo = loadFont("Roboto-Black-40.vlw");
    narracion = loadFont("BookmanOldStyle-27.vlw");

    //PANTALLA INICIAL
    pantalla = 0;
    pantallas[pantalla] = new Pantalla(fondos[pantalla], textos.acomodarTexto(pantalla), textos.acomodarNavegacion(pantalla), titulo, 255, null, null, resize);

    //PANTALLA 1. INTRODUCCIÓN A LA FABULA
    pantalla = 1;
    pantallas[pantalla] = new Pantalla(fondos[pantalla], textos.acomodarTexto(pantalla), textos.acomodarNavegacion(pantalla), narracion, 255, null, null, resize);

    //CRUCE CON LA MUERTE
    pantalla = 2;
    pantallas[pantalla] = new Pantalla(fondos[pantalla], textos.acomodarTexto(pantalla), textos.acomodarNavegacion(pantalla), narracion, 255, null, null, resize);

    //REGALO HERMANO MAYOR.
    pantalla = 3;
    pantallas[pantalla] = new Pantalla(fondos[pantalla], textos.acomodarTexto(pantalla), textos.acomodarNavegacion(pantalla), narracion, 255, null, null, resize);

    //REGALO HERMANO MEDIANO
    pantalla = 4;
    pantallas[pantalla] = new Pantalla(fondos[pantalla], textos.acomodarTexto(pantalla), textos.acomodarNavegacion(pantalla), narracion, 255, null, null, resize);

    //REGALO HERMANO MENOR
    pantalla = 5;
    pantallas[pantalla] = new Pantalla(fondos[pantalla], textos.acomodarTexto(pantalla), textos.acomodarNavegacion(pantalla), narracion, 255, null, null, resize);

    //RETIRADA MUERTE
    pantalla = 6;
    pantallas[pantalla] = new Pantalla(fondos[pantalla], textos.acomodarTexto(pantalla), textos.acomodarNavegacion(pantalla), narracion, 255, null, null, resize);

    //HISTORIA HERMANO MAYOR (MINIJUEGO).
    pantalla = 7;
    juego = new Juego(this, resize);
    pantallas[pantalla] = new Pantalla(null, null, null, narracion, 255, null, juego, resize);

    //MUERTE DEL MAGO
    pantalla = 8;  
    pantallas[pantalla] = new Pantalla(fondos[pantalla], textos.acomodarTexto(pantalla), textos.acomodarNavegacion(pantalla), narracion, 255, null, null, resize);

    //MUERTE HERMANO MAYOR
    pantalla = 9;
    pantallas[pantalla] = new Pantalla(fondos[pantalla], textos.acomodarTexto(pantalla), textos.acomodarNavegacion(pantalla), narracion, 255, null, null, resize);

    //HISTORIA HERMANO MEDIANO
    pantalla = 10;
    pantallas[pantalla] = new Pantalla(fondos[pantalla], textos.acomodarTexto(pantalla), textos.acomodarNavegacion(pantalla), narracion, #922B21, null, null, resize);

    //SUICIDO CADMUS
    pantalla = 11;
    pantallas[pantalla] = new Pantalla(fondos[pantalla], textos.acomodarTexto(pantalla), textos.acomodarNavegacion(pantalla), narracion, 255, null, null, resize);

    //MUERTE CANNON
    pantalla = 12;
    pantallas[pantalla] = new Pantalla(fondos[pantalla], textos.acomodarTexto(pantalla), textos.acomodarNavegacion(pantalla), narracion, 255, null, null, resize);

    //HISTORIA HERMANO MENOR
    pantalla = 13;
    pantallas[pantalla] = new Pantalla(fondos[pantalla], textos.acomodarTexto(pantalla), textos.acomodarNavegacion(pantalla), narracion, 255, null, null, resize);

    pantalla = 14;
    creditos = new Credito(this.resize);
    pantallas[pantalla] = new Pantalla(null, null, null, null, 255, creditos, null, null);

    //Al terminar de crear las pantallas, indico la actual.
    pantallaActual = pantallas[0];
  }

  void dibujar() {
    pantallaActual.dibujar();
  }

  void cargarFondos() {
    for (int i=0; i<cantidadPantallas; i++) {
      fondos[i] = loadImage("imagen" + i + ".jpg");
    }
  }

  void keyPressed() {
    if (pantallaActual == pantallas[0]) {
      inicio();
    } else if (pantallaActual == pantallas[1]) {
      introFabula();
    } else if (pantallaActual == pantallas[2]) {
      keyPressedRigth(3);
    } else if (pantallaActual == pantallas[3]) {
      keyPressedRigth(4);
    } else if (pantallaActual == pantallas[4]) {
      keyPressedRigth(5);
    } else if (pantallaActual == pantallas[5]) {
      keyPressedRigth(6);
    } else if (pantallaActual == pantallas[6]) {
      eleccionHistoria();
    } else if (pantallaActual == pantallas[7]) {
      juego.teclaPresionada();
    } else if (pantallaActual == pantallas[8]) {
      keyPressedRigth(9);
    } else if (pantallaActual == pantallas[9]) {
      keyPressedRigth(14);
    } else if (pantallaActual == pantallas[10]) {
      historiaHermanoMediano();
    } else if (pantallaActual == pantallas[11]) {
      keyPressedRigth(14);
    } else if (pantallaActual == pantallas[12]) {
      keyPressedRigth(14);
    } else if (pantallaActual == pantallas[13]) {
      keyPressedRigth(14);
    } else if (pantallaActual == pantallas[14]) {
      creditos();
    }
  }


  void inicio() {

    if (keyCode == LEFT) {
      pantallaActual = pantallas[1];
    } else if (keyCode == RIGHT) {
      pantallaActual = pantallas[14];
    }
  }
  void introFabula() {
    if (keyCode == 'a' || keyCode == 'A' || keyCode == 'p' || keyCode == 'P') {
      pantallaActual = pantallas[2];
    }
  }

  void keyPressedRigth(int pantallaAIr) {
    if (keyCode == RIGHT) {
      pantallaActual = pantallas[pantallaAIr];
    }
  }

  void eleccionHistoria() {
    if (keyCode == 'a' || keyCode == 'A') {
      pantallaActual = pantallas[7];
    } else if (keyCode == 'c'  || keyCode == 'C') {
      pantallaActual = pantallas[10];
    } else if (keyCode == 'i'  || keyCode == 'I') {
      pantallaActual = pantallas[13];
    }
  }

  void historiaHermanoMayor() {
    if (keyCode == 'a' || keyCode == 'A' || keyCode == 'p' || keyCode == 'P') {
      pantalla = 8;
    }
  }

  void historiaHermanoMediano() {
    if (keyCode == 'e' || keyCode == 'E') {
      pantallaActual = pantallas[11];
    } else if (keyCode == 'c' || keyCode == 'C') {
      pantallaActual = pantallas[12];
    }
  }

  void creditos() {
    if (keyCode == LEFT) {
      pantallaActual = pantallas[0];      
      creditos.pantalla14_PosY_Inicial = 650;
      creditos.pantalla14_PosY = creditos.pantalla14_PosY_Inicial;
    }
  }
  void cambiarAPantalla(int numeroPantalla) { //Atributo para llamar a la pantalla que necesito en el Juego
    pantallaActual = pantallas[numeroPantalla];
  }
}

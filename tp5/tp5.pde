// La pantalla que será reemplazada, es cuando el Hermano mayor tiene una disputa con un mago en un bar. 
//Si el jugador gana, cuando este preparado el juego final, podrá avanzar hacia el final del personaje. Si pierde, deberá volver a intentarlo.
//En este caso, si gana o pierde, el juego se reiniciará 

Juego juego;

void setup() {
  size(800, 600);
  surface.setResizable(true);//permite poner la pantalla completa (redimencionarla).
  juego = new Juego();
}
void draw() {
  background(134, 115, 161);
  juego.dibujar();
}

void keyPressed() {
  juego.teclaPresionada();
}

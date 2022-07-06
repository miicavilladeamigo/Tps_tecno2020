//import processing.sound.*;

AventuraGrafica aventuraGrafica;

void setup() {
  size(800, 600);
  surface.setResizable(true);//permite poner la pantalla completa (redimencionarla).
  aventuraGrafica = new AventuraGrafica();
}
void draw() {
  background(#76448A);//Color de fondo
  aventuraGrafica.dibujar();
}
void keyPressed() {
  aventuraGrafica.keyPressed();
}

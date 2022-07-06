class Resize {

  Resize() {
  }
  int resizePosX(int valor) {
    return round(map(valor, 0, 800, 0, width));
  }
  int resizePosY(int valor) {
    return round(map(valor, 0, 600, 0, height));
  }
}

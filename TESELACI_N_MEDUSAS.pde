 void setup() {
  size(800, 800);
  background(230, 230, 250);
  noLoop();
}

void draw() {
  noStroke();
  
  int cols = 2;
  int rows = 2;
  int spacingX = width / cols;
  int spacingY = height / rows;
  
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      drawMedusa(100 + i * spacingX, 150 + j * spacingY, 150, color(255, 182, 193)); // Rosada
      drawMedusa(400 + i * spacingX, 150 + j * spacingY, 120, color(176, 224, 230)); // Azul
      drawMedusa(300 + i * spacingX, 400 + j * spacingY, 180, color(144, 238, 144)); // Verde
      drawMedusa(600 + i * spacingX, 500 + j * spacingY, 110, color(255, 239, 174)); // Amarilla
    }
  }
}

void drawMedusa(float x, float y, float size, color col) {
  fill(col);
  ellipse(x, y, size, size);
  
  // Ojos
  fill(255);
  ellipse(x - size * 0.15, y - size * 0.1, size * 0.15, size * 0.15);
  ellipse(x + size * 0.15, y - size * 0.1, size * 0.15, size * 0.15);
  
  fill(0);
  ellipse(x - size * 0.15, y - size * 0.1, size * 0.08, size * 0.08);
  ellipse(x + size * 0.15, y - size * 0.1, size * 0.08, size * 0.08);
  
  // Tentáculos
  fill(col);
  for (int i = -3; i <= 3; i++) {
    ellipse(x + i * (size * 0.1), y + size * 0.5, size * 0.08, size * 0.4);
  }
}

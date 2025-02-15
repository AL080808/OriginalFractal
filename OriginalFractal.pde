void setup() {
  size(800, 800);
  background(0);
  strokeWeight(2);
  drawFractal(width / 2, height - 100, -PI / 2, 150, 10); // Start from bottom center
}

void drawFractal(float x, float y, float angle, float length, int depth) {
  if (depth == 0) return;

  // Calculate new endpoint
  float x2 = x + cos(angle) * length;
  float y2 = y + sin(angle) * length;

  // Color variation based on depth
  stroke(lerpColor(color(255, 100, 0), color(0, 200, 255), map(depth, 0, 10, 0, 1)));
  
  // Draw the branch
  line(x, y, x2, y2);
  
  // Reduce branch size and increase recursion depth
  float newLength = length * 0.75;
  
  // Recursive calls with varying angles
  drawFractal(x2, y2, angle - PI / 6, newLength, depth - 1);
  drawFractal(x2, y2, angle + PI / 6, newLength, depth - 1);
  
  // Extra branches for complexity
  if (depth > 6) {
    drawFractal(x2, y2, angle - PI / 3, newLength * 0.8, depth - 2);
    drawFractal(x2, y2, angle + PI / 3, newLength * 0.8, depth - 2);
  }
}

class Tint {
  int r = 0;
  int g = 0;
  int b = 0;
  int step = 8;

  void moreRed() {
    r += step;
    if (r > 255) { 
      r = 255;
    }
  }
  void moreGreen() {
    g += step;
    if (g > 255) { 
      g = 255;
    }
  }
  void moreBlue() {
    b += step;
    if (b > 255) { 
      b = 255;
    }
  }
  void lessRed() {
    r -= step;
    if (r < 0) { 
      r = 0;
    }
  }
  void lessGreen() {
    g -= step;
    if (g < 0) { 
      g = 0;
    }
  }
  void lessBlue() {
    b -= step;
    if (b < 0) { 
      b = 0;
    }
  }

  color addTint(color baseColor) {
    int redBase = (baseColor >> 16) & 0xFF;  // Fast way of getting red(baseColor)
    int greenBase = (baseColor >> 8) & 0xFF;   // Fast way of getting green(baseColor)
    int blueBase = baseColor & 0xFF;          // Fast way of getting blue(baseColor)
    redBase += r;
    greenBase += g;
    blueBase += b;
    if (redBase >= 255) {
      redBase = 255;
    }
    if (greenBase >= 255) {
      greenBase = 255;
    }
    if (blueBase >= 255) {
      blueBase = 255;
    }
    return color(redBase, greenBase, blueBase);
  }

  color removeTint(color baseColor) {
    int redBase = (baseColor >> 16) & 0xFF;   // Fast way of getting red(baseColor)
    int greenBase = (baseColor >> 8) & 0xFF;  // Fast way of getting green(baseColor)
    int blueBase = baseColor & 0xFF;          // Fast way of getting blue(baseColor)
    redBase -= r;
    greenBase -= g;
    blueBase -= b;
    if (redBase <= 0) {
      redBase = 0;
    }
    if (greenBase <= 0) {
      greenBase = 0;
    }
    if (blueBase <= 0) {
      blueBase = 0;
    }
    return color(redBase, greenBase, blueBase);
  }
}


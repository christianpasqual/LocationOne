// Program: Beginning Painting App v. 3.3
// Programmer: Hope E. Moore
// Created Date: June 14, 2013
// Last Updated: October 20, 2018
// Description: This program allows users to paint by dragging their mouse or finger.
//              Users can select different paint colors, brush size, save their image, and clear the screen.

PImage outlines;

//boolean exitPromptOn = false;
boolean savePromptOn = false;

// Declaration for ColorButtons

ColorButton redButton = new ColorButton("", 50, 100, 255, 0, 0, 255);
ColorButton orangeButton = new ColorButton("", 50, 140, 255, 140, 0, 255);
ColorButton yellowButton = new ColorButton("", 50, 180, 255, 255, 0, 255);
ColorButton greenButton = new ColorButton("", 50, 220, 50, 205, 50, 255);
ColorButton blueButton = new ColorButton("", 50, 260, 0, 0, 255, 255);
ColorButton violetButton = new ColorButton("", 50, 300, 148, 0, 211, 255);
ColorButton blackButton = new ColorButton("", 50, 340, 0, 0, 0, 255);
ColorButton grayButton = new ColorButton("", 50, 380, 128, 128, 128, 255);
ColorButton whiteButton = new ColorButton("", 50, 420, 255, 255, 255, 255);

// Declaration for the Brush Buttons

BrushButton brush1Button = new BrushButton("", 58, 481, 2);
BrushButton brush2Button = new BrushButton("", 58, 496, 5);
BrushButton brush3Button = new BrushButton("", 58, 516, 10);
BrushButton brush4Button = new BrushButton("", 58, 539, 15);

// Declaration for other Buttons

Button clearButton = new Button("Clear", 125, 600);
Button exitButton = new Button("Exit", 325, 600);
Button saveButton = new Button("Save", 225, 600);

// Setup() method:
//  > Sets the background
//  > Sets the size
//  > Sets the title
//  > Draws the buttons

void setup() {
  background(175, 175, 175, 255);
  size(480, 640);

  
  // Title
  
  fill(0, 0, 0);
  textAlign(CENTER);
  textSize(18);
  text("Find out where the next QR-Code will be:", 258, 35);
  
  // Back of paint tab
  
  stroke(0, 0, 0, 50);
  fill(0, 0, 0, 100);
  rect(26, 70, 60, 384, 90, 0, 0, 90);
  
  fill(0, 0, 0);
  textAlign(CENTER);
  textSize(18);
  text("5", 18, 104);
  
  stroke(150, 150, 150, 150);
  fill(150, 150, 150, 255);
  rect(24, 68, 60, 384, 90, 0, 0, 90);
  
  // Paint tab
  
  fill(230, 230, 230, 255);
  stroke(210, 210, 210, 210);
  rect(30, 75, 40, 370, 90);
  
  // Back of brush size tab
  
  stroke(0, 0, 0, 50);
  fill(0, 0, 0, 100);
  rect(41, 462, 55, 100, 90, 0, 0, 90);
  
  stroke(150, 150, 150, 150);
  fill(150, 150, 150, 255);
  rect(39, 460, 55, 100, 90, 0, 0, 90);
  
  // Brush size tab
  
  fill(230, 230, 230, 255);
  stroke(210, 210, 210, 210);
  rect(45, 467, 25, 86, 90);
  
  fill(0, 0, 0, 255);
  stroke(0, 0, 0, 255);
  strokeWeight(1);
  
  // Painting space
  
  stroke(0, 0, 0, 50);
  fill(0, 0, 0, 100);
  rect(77, 51, 373, 537, 20);
  
  stroke(150, 150, 150, 255);
  fill(255, 255, 255, 255);
  rect(75, 49, 373, 537, 20);
  
  // Drawing the buttons
  
  drawAllButtons();
  strokeWeight(2);
 
  outlines = loadImage("111.png");
  outlines.resize(360, 533);
  image (outlines, 80, 50);
  
  
}

// The draw() method makes it work for Android devices.

void mouseDragged() {

  
  controls();
  
  // This if statement helps constrain the painting area without creating a line along the border when outside the area.
  
  if ((mouseX > 70) && (mouseX < 448) && (mouseY > 49) && (mouseY < 586)) {
    line(constrain(pmouseX, 70, 448), constrain(pmouseY, 49, 586), constrain(mouseX, 70, 448), constrain(mouseY, 49, 586));
  }
}

void draw() {
}

// When the mouse button is clicked, it runs the button controls.

void mouseClicked() {
  controls();
}

// Draws within an area in the app when the mouse or finger is dragged.

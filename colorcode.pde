JSONObject json;    // store all frame/color information
PImage frame;       // current frame to be processed
int framenumber;    // counter for the frame number
String filename;    // name of the frame image
PFont font;

void setup() {
  framenumber = 1;
  filename = "frame-" + framenumber + ".png";
  frame = loadImage(filename, "png");
  json = new JSONObject();
  noLoop();                         // run draw() only once
  size(200,200);                    // set up canvas
  font = createFont("Liberation Sans",16,true);  // set up font
}

void draw() {
  while (null != frame) {
    // do image processing
    frame = loadImage(filename, "png");
    // prepare next step
    framenumber += 1;
    filename = "frame-" + framenumber + ".png";
  }
  json.setInt("frame number", framenumber);
  saveJSONObject(json, "data/framedata.json");
  background(255);
  textFont(font,20);
  fill(0);
  text("processing done",25,100);
}

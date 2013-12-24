JSONObject json;    // store all frame/color information
PImage frame;       // current frame to be processed
int framenumber;    // counter for the frame number
PFont font;

void setup() {
  framenumber = 0;
  json = new JSONObject();
  noLoop();                         // run draw() only once
  size(200,200);                    // set up canvas
  font = createFont("Liberation Sans",16,true);  // set up font
}

void draw() {
  while (null != frame) {
    frame = loadImage("foo", "png");
  }
  json.setInt("frame number", framenumber);
  saveJSONObject(json, "data/framedata.json");
  background(255);
  textFont(font,20);
  fill(0);
  text("processing done",25,100);
}

JSONObject json;    // store all frame/color information
PImage frame;       // current frame to be processed
int framenumber;    // counter for the frame number
String filename;    // name of the frame image
color rgb;          // color values from image
IntDict colorstats;  // simple color statistics
PFont font;

void setup() {
  framenumber = 1;
  filename = "frame-" + framenumber + ".png";
  frame = loadImage(filename, "png");
  colorstats = new IntDict();
  json = new JSONObject();
  noLoop();                         // run draw() only once
  colorMode(RGB);
  size(frame.width, frame.height);  // set up canvas
  font = createFont("Liberation Sans",16,true);  // set up font
}

void draw() {
  while (null != frame) {
    // display the image
    image(frame, 0, 0);
    // do image processing
    for (int i=0; i<frame.pixels.length; i++) {
      // hex color = key in dict
      rgb = frame.pixels[i];
      if (colorstats.hasKey(hex(rgb))) {
        colorstats.add(hex(rgb), 1);
      }
    }
    // prepare next step
    framenumber += 1;
    filename = "frame-" + framenumber + ".png";
    // load potential next frame
    frame = loadImage(filename, "png");
  }
  json.setInt("frame number", framenumber);
  saveJSONObject(json, "data/framedata.json");
  background(255);
  textFont(font,20);
  fill(0);
  text("processing done",25,100);
}

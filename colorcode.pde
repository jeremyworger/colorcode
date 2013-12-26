JSONObject json;    // store all frame/color information
JSONArray frames;   // to store all frame-dicts
PImage frameimage;  // current frame to be processed
int framenumber;    // counter for the frame number
String filename;    // name of the frame image
color rgb;          // color values from image
IntDict colorstats;  // simple color statistics
PFont font;

void setup() {
  framenumber = 1;
  filename = "frame-" + framenumber + ".png";
  frameimage = loadImage(filename, "png");
  colorstats = new IntDict();
  json = new JSONObject();
  json.setString("content", "pixel statistics per frame");
  noLoop();                         // run draw() only once
  colorMode(RGB);
  size(frameimage.width, frameimage.height);  // set up canvas
  font = createFont("Liberation Sans",16,true);  // set up font
}

void draw() {
  while (null != frameimage) {
    // display the image
    image(frameimage, 0, 0);
    // do image processing
    for (int i=0; i<frameimage.pixels.length; i++) {
      // hex color = key in dict
      rgb = frameimage.pixels[i];
      if (colorstats.hasKey(hex(rgb))) {
        colorstats.add(hex(rgb), 1);
      }
    }
    // prepare next step
    framenumber += 1;
    filename = "frame-" + framenumber + ".png";
    // load potential next frame
    frameimage = loadImage(filename, "png");
  }
  json.setInt("frame number", framenumber);
  saveJSONObject(json, "data/framedata.json");
  background(255);
  textFont(font,20);
  fill(0);
  text("processing done",25,100);
}

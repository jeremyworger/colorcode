JSONObject json;    // store all frame/color information
JSONArray frames;   // to store all frame-dicts
PImage frameimage;  // current frame to be processed
int framenumber;    // counter for the frame number
String filename;    // name of the frame image
color rgb;          // color values from image
JSONObject colorstats;  // simple color statistics
PFont font;

void setup() {
  framenumber = 1;
  filename = "frame-" + framenumber + ".png";
  frameimage = loadImage(filename, "png");
  colorstats = new JSONObject();
  json = new JSONObject();
  json.setString("content", "pixel statistics per frame");
  frames = new JSONArray();
  noLoop();                         // run draw() only once
  colorMode(RGB);
  size(frameimage.width, frameimage.height);  // set up canvas
  font = createFont("Liberation Sans",16,true);  // set up font
}

void draw() {
  int oldvalue;
  while (null != frameimage) {
    println("processing frame " + framenumber);
    // display the image
    image(frameimage, 0, 0);
    // do image processing
    for (int i=0; i<frameimage.pixels.length; i++) {
      // hex color = key in dict
      rgb = frameimage.pixels[i];
      // increase count
      try {
        oldvalue = colorstats.getInt(hex(rgb));
        colorstats.setInt(hex(rgb), oldvalue+1);
      }
      catch (Exception e) {
        colorstats.setInt(hex(rgb), 1);
      }
    }
    colorstats.setInt("frame number", framenumber);
    frames.append(colorstats);
    // prepare next step
    framenumber += 1;
    filename = "frame-" + framenumber + ".png";
    colorstats = new JSONObject();
    // load potential next frame
    frameimage = loadImage(filename, "png");
  }
  json.setJSONArray("frame data", frames);
  saveJSONObject(json, "data/framedata.json");
  background(255);
  textFont(font,20);
  fill(0);
  text("processing done",25,100);
}

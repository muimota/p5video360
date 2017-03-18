import processing.video.*;
Movie movie;
PShader shader;
float yaw,pitch,fov;

void setup() {
  size(640, 360,P2D);
  yaw   = 0;
  pitch = 0;
  fov   = 80;
  shader = loadShader("data/video360.glsl");
  shader.set("resolution", float(width), float(height));
  shader.set("yaw",yaw);
  shader.set("pitch",pitch);
  shader.set("fov",fov);
  movie = new Movie(this, "video.mp4");
  movie.loop();
}

void draw() {
  shader(shader);
  image(movie, 0, 0,width,height);
}

void mouseDragged(){
  yaw   += map(mouseX - pmouseX,0,width,0,-fov);
  pitch += map(mouseY - pmouseY,0,height,0,-fov*height/float(width));
  shader.set("yaw",yaw);
  shader.set("pitch",pitch);
}

// Called every time a new frame is available to read
void movieEvent(Movie m) {
  m.read();
}
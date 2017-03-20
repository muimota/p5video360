# p5 video360

A little program that plays a 360video and lets the user look around dragging the mouse.
Made with [p5](http://processing.org)

Needs the [Video Library](https://processing.org:8443/reference/libraries/video/index.html) to be installed.

The GLSL shader is taken from this js/html [example](https://gist.github.com/fieldOfView/5106319) with some small modifications.

![video thumb](http://img.youtube.com/vi/iWyvlkWYXhY/0.jpg)

The sample video is taken from youtube [link](https://www.youtube.com/watch?v=iWyvlkWYXhY) and licensed under CC

## Ubuntu

GLVideo needs gstreamer0.10 ffmpeg plugin. I case is not working:

~~~~
sudo add-apt-repository ppa:mc3man/gstffmpeg-keep
sudo apt-get update
sudo apt-get install gstreamer0.10-plugins-good gstreamer0.10-plugins-base gstreamer0.10-alsa gstreamer0.10-x
~~~~

enjoy!

Martin Nadal martin(at)muimota.net

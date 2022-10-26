/**
 * [UI description]
 * @Author   bit2atom
 * @DateTime 2022-07-29T10:10:26+0800
 */
import controlP5.*;
import peasy.*;

ControlP5 slider;
PeasyCam cam;

void UI() {
  cam = new PeasyCam(this, 800);

  int sliderWidth = 250;
  int sliderHeight = 25;
  slider = new ControlP5(this, createFont("Consolas", 14));

  slider.addSlider("layerNum")
    .setPosition(20, 20)
    .setSize(sliderWidth, sliderHeight)
    .setRange(30, 200)
    .setValue(50)
    ;

  slider.addSlider("layerHeight")
    .setPosition(20, 60)
    .setSize(sliderWidth, sliderHeight)
    .setRange(5, 50)
    .setValue(30)
    ;

  slider.addSlider("layerWidth")
    .setPosition(20, 100)
    .setSize(sliderWidth, sliderHeight)
    .setRange(200, 800)
    .setValue(320)
    ;

  slider.addSlider("deltaWidth")
    .setPosition(20, 140)
    .setSize(sliderWidth, sliderHeight)
    .setRange(0, 200)
    .setValue(100)
    ;

  slider.addSlider("rotateRange")
    .setPosition(20, 180)
    .setSize(sliderWidth, sliderHeight)
    .setRange(0, 2 * PI)
    .setValue(PI / 2)
    ;

  slider.addSlider("r")
    .setPosition(20, 600)
    .setSize(sliderWidth, sliderHeight)
    .setRange(0, 255)
    .setValue(255)
    ;

  slider.addSlider("g")
    .setPosition(20, 640)
    .setSize(sliderWidth, sliderHeight)
    .setRange(0, 255)
    .setValue(200)
    ;

  slider.addSlider("b")
    .setPosition(20, 680)
    .setSize(sliderWidth, sliderHeight)
    .setRange(0, 255)
    .setValue(50)
    ;

  slider.setAutoDraw(false);
}

void controlEvent(ControlEvent theEvent) {
  if (theEvent.isFrom(slider.getController("layerNum")) ||
    theEvent.isFrom(slider.getController("layerHeight")) ||
    theEvent.isFrom(slider.getController("layerWidth")) ||
    theEvent.isFrom(slider.getController("deltaWidth")) ||
    theEvent.isFrom(slider.getController("rotateRange")) ||
    theEvent.isFrom(slider.getController("r")) ||
    theEvent.isFrom(slider.getController("g")) ||
    theEvent.isFrom(slider.getController("b"))) {
    setPlanes();
    linkPlanes(planes);
    linkPlanes(outerPlanes);
    linkOuter();
  }
}
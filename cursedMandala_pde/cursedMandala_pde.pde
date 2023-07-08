import oscP5.*; // -->Importan la librería oscP5.  
import netP5.*; //-->importar esta otra libreria ????
OscP5 oscP5;
NetAddress puredata;
int puerto; //--> Se define un puerto de entrada para la comunicación osc

float red,blue,green;
float posX=random(0,width);
float posY=random(0,height);
float pposX=0;
float pposY=0;
float r=random(300,width/2);
void setup(){
surface.setTitle("Islamic Mandalas Generator");
size(900,900);

puerto = 11111; // elegimos el puerto, que debe ser el mismo que está definido en el patch de PD. 
oscP5 = new OscP5(this, puerto); // Le indica a Processing que OSC recibirá los mensajes que lleguen a traves del puerto especificado.
 puredata = new NetAddress("127.0.0.1",11111);
background(0);

frameRate(6);
//strokeWeight(4);
//Paleta de colores random
stroke(random(0,255),50,random(0,255));
}
//Cantidad de puntas de la figura
int base=8;
//int base=int(random(7,10));
void draw(){
  //background(0);
  translate(width/2, height/2);
  //if(mousePressed){
    calcularStrokeW();
    for(int i=0; i<base; i++){
    rotate(TWO_PI/base);
  line(posX-width/2,posY-height/2,pposX-width/2,pposY-height/2);
  line(width/2-posX,posY-height/2,width/2-pposX,pposY-height/2);
  noFill();
  ellipse(posX,posY,r,r);
  ellipse(width/2-posX,posY,r/2,r/2);
  rotate(TWO_PI/base/2);
  line(posX-width/2,posY-height/2,pposX-width/2,pposY-height/2);
  line(width/2-posX,posY-height/2,width/2-pposX,pposY-height/2);
  noFill();
  ellipse(posX+10,posY+10,r,r);
  ellipse(width/2-posX+10,posY+10,r/2,r/2);
   oscP5.send(new OscMessage("/posX").add(posX), puredata);
   oscP5.send(new OscMessage("/posX2").add(posX+10), puredata);
   oscP5.send(new OscMessage("/posX3").add(posX-width/2), puredata);
   oscP5.send(new OscMessage("/posX4").add(width/2-posX), puredata);
   oscP5.send(new OscMessage("/posY").add(posY), puredata);
   oscP5.send(new OscMessage("/posY2").add(posY+10), puredata);
   oscP5.send(new OscMessage("/posY3").add(posY-height/2), puredata);
   oscP5.send(new OscMessage("/r").add(r), puredata);
   oscP5.send(new OscMessage("/red").add(red), puredata);
   oscP5.send(new OscMessage("/green").add(green), puredata);
   oscP5.send(new OscMessage("/blue").add(blue), puredata);
   oscP5.send(new OscMessage("/dist").add(dist(posX*TWO_PI/6,posY*TWO_PI/6,width/2,height/2)/56), puredata);
    }
  //}
  //Actualizar radios y posiciones aleatorias y posiciones anteriores
  r=random(300,width/2);
  pposX=posX;
  pposY=posY;
   posX=random(0,width);
 posY=random(0,height);
 
 //Take Automatic Screenshots
if (frameCount % 20 == 0) {
     saveFrame("auto/auto-screen-#####.png"); 
  println("screenshot saved");
}

}
void calcularStrokeW(){
  
  //Cambiar el grosor de las filas segun la posicion
  
  //para las lineas perifericas
   //if(posX<width/3 || posX>width/3*2){
     strokeWeight(dist(posX*TWO_PI/6,posY*TWO_PI/6,width/2,height/2)/56);
   //}
  
  //Actualizar paleta de colores random
   stroke(red,green,blue);
   red=random(0,255);
   green=50;
   blue=random(0,255);
  //stroke(70,random(0,255),random(0,255));
  
  
}
void mouseReleased(){

}
void keyReleased() {
 //Sacar Screenshot
 if (key == 'p'){
   saveFrame("screen-#####.png"); 
   println("screenshot saved");
 }
}

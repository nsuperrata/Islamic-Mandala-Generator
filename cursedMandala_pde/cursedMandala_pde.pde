float posX=random(0,width);
float posY=random(0,height);
float pposX=0;
float pposY=0;
void setup(){
size(900,900);
background(0);

//strokeWeight(4);
stroke(random(255),random(255),255);
}
int base=int(5);
void draw(){
  translate(width/2, height/2);
  //if(mousePressed){
    calcularStrokeW();
    for(int i=0; i<base; i++){
    rotate(TWO_PI/base);
  line(posX-width/2,posY-height/2,pposX-width/2,pposY-height/2);
  line(width/2-posX,posY-height/2,width/2-pposX,pposY-height/2);
    }
  //}
  pposX=posX;
  pposY=posY;
   posX=random(0,width);
 posY=random(0,height);
}
void calcularStrokeW(){
  
   //float d=dist(posX,posY,pposX,pposY);
   if(posX<width/3 || posX>width/3*2){
     strokeWeight(dist(posX,posY,width/2,height/2)/56);
   }
  
  stroke(random(0,255));
}
void mouseReleased(){
stroke(random(255),random(255),255);
}

import processing.serial.*;

Serial Arduino;
byte[] val;
int valore =0;

void setup() {
  
  val = new byte[10];
	size(1080,720);  //Crea finestra
	background(255); //Sfondo bianco

  Logo = loadImage("BM.png");

  Arduino = new Serial(this, "COM5", 9600);
  delay(1000);
}

void draw(){
  
  while ( Arduino.available() > 0) { val = Arduino.readBytesUntil('\n');} //Attedni finchè non finisce la comunicazione
  
  valore = 0;
  
  if((val[0]>48) && (val.length-2>0)) {
    for (int i = 0; i <(val.length-2) ;i++) {
      valore = (valore*10)+val[i]-48;
    }
  }
  
  CompilaGrafico(50-valore); //Aggiungi il valore al grafico
}
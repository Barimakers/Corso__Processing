#include "Ultrasuoni.h"

ultrasuoni::ultrasuoni(uint8_t pin1 , uint8_t pin2){
	Trig=pin1;
	Echo=pin2;	
}

void ultrasuoni::init(){
	pinMode(Trig, OUTPUT);
	pinMode(Echo, INPUT);
}

long ultrasuoni::distanza(){
	  long durata, distanza;

// Dare un corto segnale basso per poi dare un segnale alto puro:
digitalWrite(Trig, LOW);
delayMicroseconds(2);
digitalWrite(Trig, HIGH);
delayMicroseconds(10);
digitalWrite(Trig, LOW);
durata = pulseIn(Echo,HIGH);
// Converti il tempo in distanza:
return distanza = durata / 29.1 / 2 ;
}

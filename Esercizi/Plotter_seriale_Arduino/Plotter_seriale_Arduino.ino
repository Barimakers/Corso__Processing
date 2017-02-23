#include "Ultrasuoni.h"
//              (Trig, Echo)
ultrasuoni Sens1(6   , 7   );

void setup() {
  Serial.begin(9600);
  Sens1.init();
}

void loop() {
  Serial.println(Sens1.distanza());
  delay(100);
}

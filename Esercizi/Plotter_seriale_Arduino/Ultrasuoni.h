#ifndef Ultrasuoni_h
#define Ultrasuoni_h

#include <Arduino.h>

class ultrasuoni {

  public:

    ultrasuoni(uint8_t pin1 , uint8_t pin2);
    void init();
    long distanza();

  private:
    uint8_t Trig, Echo;
};
#endif

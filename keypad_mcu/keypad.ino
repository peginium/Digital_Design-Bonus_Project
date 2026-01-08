#include <Keypad.h>

const byte ROWS = 4;
const byte COLS = 4;

char buttonMat[ROWS][COLS] = {
  {'0', '1', '2', '3'},
  {'4', '5', '6', '7'},
  {'8', '9', 'A', 'b'},
  {'c', 'd', 'E', 'F'}
};

byte rowPins[ROWS] = {13, 12, 14, 27};
byte colPins[COLS] = {26, 25, 33, 32}; 

Keypad customKeypad = Keypad(makeKeymap(buttonMat), rowPins, colPins, ROWS, COLS);

void setup(){
  Serial.begin(9600);
  Serial.println("MCU Test Started.");
}
  
void loop(){
  char pressedKey = customKeypad.getKey();
  
  if (pressedKey){
    Serial.print("Pressed Key: ");
    Serial.println(pressedKey);
  }
}
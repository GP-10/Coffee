#include <DHT.h>
#include <DHT_U.h>
#include <Adafruit_Sensor.h>
#include <DHT.h>
#include <DHT_U.h>
#include "DHT.h"
#define DHTPIN A1

DHT dht(DHTPIN, DHT11);
void setup()
{
pinMode(DHTPIN, INPUT);
Serial.begin(9600);
dht.begin();
}
void loop()
{
float dht11_umidade = dht.readHumidity();
float dht11_temperatura = dht.readTemperature();
Serial.print("Umidade:");
Serial.print(dht11_umidade);
Serial.print("%");
Serial.print(";");
Serial.print("Temperatura DHT11:"); 
Serial.print(dht11_temperatura);
Serial.print(";");
int chave = digitalRead(7);
if (chave == 0)
{
Serial.print("1");
}
else
{
Serial.print("0");
}
Serial.println();
delay(5000);
}

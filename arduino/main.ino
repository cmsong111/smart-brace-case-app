#include "ble.ino"
#include "sensor.ino"

#define IR_SENSOR_PIN 14
#define BATTERY_PIN 15

bool is_wearing;        // 1: 착용중, 0: 착용하지 않음
float battery_voltage;  // 배터리 전압
int battery_percent;    // 배터리 잔량 0 ~ 100%

// 함수 원형 선언
void setup();
void loop();
void printSensorStatus();

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  sensorSetup(IR_SENSOR_PIN, BATTERY_PIN);
  bleSetup();
}

void loop() {
  is_wearing = isWearing(IR_SENSOR_PIN);
  battery_voltage = getBatteryVoltage(BATTERY_PIN);
  battery_percent = getBatteryPercent(BATTERY_PIN);

  updateWearingStatus(is_wearing);
  updateBatteryLevel(battery_percent);

  blinkLED();
  setLED();

  printBleStatus();
  printSensorStatus();

  delay(1000);
}

void printSensorStatus() {
  Serial.print("Wearing: ");
  Serial.println(is_wearing ? "Yes" : "No");

  Serial.print("Battery Voltage: ");
  Serial.print(battery_voltage);
  Serial.println("V");

  Serial.print("Battery Percent: ");
  Serial.print(battery_percent);
  Serial.println("%");
}
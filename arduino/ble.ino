// 모듈 정보
// Arudino Nano 33 BLE
// (작동 전압: 3.3V)
// Lituim Polymer Battery 3.7V 1000mAh
// 3.7V 1S 리튬이온 폴리머 배터리 5V 승압 충방전 모듈
// (배터리 보호 회로 내장 2.8V ~ 4.2V)
// TCRT5000 근접 센서

#include <ArduinoBLE.h>

// 착용 여부 서비스와 특성
BLEService myService("fff0");
BLEIntCharacteristic myCharacteristic("fff1", BLERead | BLENotify);

// 배터리 서비스와 특성
BLEService batteryService("180F");
BLEUnsignedCharCharacteristic batteryLevelChar("2A19", BLERead | BLENotify);

bool old_is_wearing;        // 1: 착용중, 0: 착용하지 않음
float old_battery_voltage;  // 배터리 전압
int old_battery_percent;    // 배터리 잔량 0 ~ 100%
bool old_is_led_on;         // LED 상태

void bleSetup() {
  // BLE Module 초기화
  if (!BLE.begin()) {
    Serial.println("starting Bluetooth® Low Energy module failed!");
    while (1)
      ;
  }

  BLE.setLocalName("Smart Retainer Device");
  BLE.setAdvertisedService(batteryService);
  batteryService.addCharacteristic(batteryLevelChar);
  BLE.addService(batteryService);
  batteryLevelChar.writeValue(80);

  myService.addCharacteristic(myCharacteristic);
  BLE.addService(myService);
  myCharacteristic.writeValue(0);  // set initial value for this characteristic

  BLE.advertise();

  delay(100);  // 연결 요청을 처리하기 전에 잠시 기다림
  Serial.println("ProtoStax Arduino Nano BLE LED Peripheral Service Started");
}

/**
 * @brief 배터리 잔량을 업데이트 하는 함수
 *
 * @param level 배터리 잔량 (0 ~ 100%)
 * @return true  업데이트 성공
 * @return false 업데이트 실패
 */
bool updateBatteryLevel(int level) {
  if (central.connected() && old_battery_percent != level) {
    batteryLevelChar.writeValue(level);
    return true;
  } else {
    return false;
  }
}

/**
 * @brief 착용 여부를 업데이트 하는 함수
 *
 * @param status  착용 여부 (true: 착용중, false: 착용하지 않음)
 * @return true  업데이트 성공
 * @return false  업데이트 실패
 */
bool updateWearingStatus(bool status) {
  if (central.connected() && old_is_wearing != status) {
    myCharacteristic.writeValue(status);
    return true;
  } else {
    return false;
  }
}

/**
 * @brief LED를 깜빡이는 함수
 */
void blinkLED() {
  if (central.connected()) return;

  old_is_led_on = !old_is_led_on;
  if (old_is_led_on)
    digitalWrite(LED_BUILTIN, HIGH);
  else
    digitalWrite(LED_BUILTIN, LOW);
}

/**
 * @brief LED를 설정하는 함수
 *
 */
void setLED() {
  if (central.connected())
    digitalWrite(LED_BUILTIN, HIGH);
  else
    digitalWrite(LED_BUILTIN, LOW);
}

/**
 * @brief BLE 상태를 출력하는 함수
 */
void printBleStatus() {
  if (central.isConnected()) {
    Serial.print("Connected to central: ");
    Serial.println(central.address());
  } else {
    Serial.print("Disconnected from central: ");
  }
}

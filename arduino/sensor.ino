// 모듈 정보
// Arudino Nano 33 BLE
//     (작동 전압: 3.3V)
// Lituim Polymer Battery 3.7V 1000mAh
// 3.7V 1S 리튬이온 폴리머 배터리 5V 승압 충방전 모듈
//     (배터리 보호 회로 내장 2.8V ~ 4.2V)
// TCRT5000 근접 센서

/**
 * @brief 센서 초기화 함수
 *
 * @param irSensorPin 적외선 센서 핀 번호
 * @param batteryPin 배터리 잔량 측정 핀 번호
 */
void sensorSetup(int irSensorPin, int batteryPin) {
  pinMode(irSensorPin, INPUT);
  pinMode(batteryPin, INPUT);
}

/**
 * @brief 배터리 잔량을 계산하는 함수
 *
 * @param voltage  배터리 전압
 * @return int  배터리 잔량 (0 ~ 100%)
 */
int calculateBatteryLevel(float voltage) {
  if (voltage < 2.8) {
    Serial.println("Warning: Battery is very low");
    return -1;
  }
  if (voltage > 4.2) {
    Serial.println("Warning: Battery is very high");
    return 101;
  }

  return map(voltage, 2.8, 4.2, 0, 100);
}

/**
 * @brief 전압을 측정하는 함수
 *
 * @param pinNumber 측정할 핀 번호
 * @return float 전압 값 (0 ~ 3.3V 사이의 값)
 */
float calculateBatteryVoltage(int pinNumber) {
  int raw = analogRead(pinNumber);
  float temp = raw * 3.3 / 1023.0;
  raw = (int)temp;

  float volatge = (raw % 100) / 10.0;
  return volatge;
}

/**
 * @brief 착용 여부를 판단하는 함수
 *
 * @param irSensorPin 적외선 센서 핀 번호
 * @return bool 착용 여부 (true: 착용중, false: 착용하지 않음)
 */
bool isWearing(int irSensorPin) {
  bool isWearing = digitalRead(irSensorPin);
  return isWearing;
}
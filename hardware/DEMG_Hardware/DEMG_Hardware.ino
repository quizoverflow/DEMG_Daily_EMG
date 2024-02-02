#include <SoftwareSerial.h>
#if defined(ARDUINO) && ARDUINO >= 100
#include "Arduino.h"
#else
#include "WProgram.h"
#endif
#include "EMGFilters.h"
#define TIMING_DEBUG 1

// 블루투스 입출력 핀 설정
#define Tx 6
#define Rx 7
//근전도 입력 핀 설정
#define SensorInputPin A0 // input pin number

//블루투스 객체와 근전도 객 생성
SoftwareSerial Bt(Tx,Rx);
EMGFilters myFilter;

//상수, 변수 모음
int sampleRate = SAMPLE_FREQ_1000HZ; //1000
int humFreq = NOTCH_FREQ_50HZ; // 50
static int Throhold = 0;

unsigned long timeStamp;
unsigned long timeBudget;

//debug용 변수
int sensorValue = 0;

void setup() {

  Serial.begin(115200);
  Serial.println(sampleRate);
  Serial.println(humFreq);
  
  myFilter.init(sampleRate, humFreq, true, true, true);
  timeBudget = 1e6 / sampleRate;

  Bt.begin(115200);
}

void loop() {
    //시간 측정
    timeStamp = micros();
    //근전도 측정
    int Value = analogRead(SensorInputPin);
    //필터 프로세스
    int DataAfterFilter = myFilter.update(Value);
    // envlope = 필터값 제곱
    int envlope = sq(DataAfterFilter);
    // 음수 제거 프로세스
    envlope = (envlope > Throhold) ? envlope : 0;
    // 타임스탬프 계산
    timeStamp = micros() - timeStamp;

    //시리얼 디버깅 할때만 사용
    Serial.println(envlope);
    //블루투스 통신
    Bt.println(envlope);

    delayMicroseconds(500);

}
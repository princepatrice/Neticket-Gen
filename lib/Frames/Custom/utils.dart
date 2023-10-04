import 'dart:math';

int getRandomNumer(){
  int min = 1;
  int max = 1000;
  Random random = Random();
  int randomValue = min + random.nextInt(max - min);
  return randomValue;
}
import 'dart:math';
import 'dart:typed_data';

int NOD(int number1, int number2) {
  number1 = number1.abs();
  number2 = number2.abs();
  if (number1 < number2) {
    int c = number1;
    number1 = number2;
    c = number2;
  }
  while (number1 % number2 != 0) {
    int c = number2;
    number2 = number1 % number2;
    number1 = c;
  }
  return (number2);
}

int NOK(int number1, int number2) {
  int nod = NOD(number1, number2);
  int nok = (number1 * number2 / nod).round();
  return nok;
}

List<dynamic> Mnogit(int number) {
  List mnog = [];

  for (dynamic i = 1; i < (number + 1); i += 1) {
    if ((number % i == 0) & (Prostoe(i))) {
      mnog.add(i);
    }
  }
  return (mnog);
}

// проверка на простое число
bool Prostoe(int a) {
  bool prost = true;
  for (int i = 2; i < a; i += 1) {
    if (a % i == 0) {
      prost = false;
    }
  }
  return prost;
}

//перевод из десятичной в двоичную
List<dynamic> Dvoich(int a) {
  var str = [];
  if (a == 0) {
    str = [0];
  }
  while (a != 0) {
    int s = a % 2;
    str.add(s);
    a = (a / 2).toInt();
  }

  return str.reversed.toList();
}

// перевод из двоичной в десятичную
int Ten(List<dynamic> s) {
  double chislo = 0;
  s = s.reversed.toList();
  for (int i = 0; i < s.length; i += 1) {
    if (s[i] == 1) {
      int a = i;
      chislo = chislo + pow(2, a);
    }
  }
  return chislo.toInt();
}

void main() {
  int a = 12;
  int b = 5;
  print(NOD(2, 2));
  print(NOD(a, b));
  print(NOK(a, b));
  print(Mnogit(a));
  print(Prostoe(1));
  print(Dvoich(12));
  print(Ten([1, 1, 0, 0]));
}

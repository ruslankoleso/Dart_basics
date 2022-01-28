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

// вытаскивание из строки чисел таск 3
Iterable chislo(String str) {
  List<String> mylist = str.split(' ');
  List<int?> newlist = [];
  for (int i = 0; i < mylist.length; i += 1) {
    int? a = int.tryParse(mylist[i]);
    if (a != null) {
      newlist.add(a);
    }
  }
  return newlist;
}

// создание словаря таск4
Map Slovar(Iterable mylist) {
  Map newmap = <String, int>{};
  for (var element in mylist) {
    int sum = 0;
    for (var elements in mylist) {
      if (elements == element) {
        sum += 1;
      }
    }
    if (!newmap.containsKey(element)) {
      newmap["$element"] = sum;
    }
  }
  return newmap;
}

// таск 5
Set listnumber(Iterable<String> oldlist) {
  Map<String, int> proverka = {
    "one": 1,
    "two": 2,
    "zero": 0,
    "three": 3,
    "four": 4,
    "five": 5,
    "six": 6,
    "seven": 7,
    "eigth": 8,
    "nine": 9
  };
  Set newlist = {};
  for (var elements in oldlist) {
    if (proverka.containsKey(elements)) {
      newlist.add(proverka[elements]);
    }
  }
  return newlist;
}

// класс точка
class Point {
  double x;
  double y;
  double z;

  Point(this.x, this.y, this.z);

  num distanceTo(Point a) {
    num distant = pow((a.x - x), 2) + pow((a.y - y), 2) + pow((a.z - z), 2);
    return distant;
  }

  factory Point.originOfCoordinates() {
    return Point(0, 0, 0);
  }
  factory Point.vectorY() {
    return Point(0, 1, 0);
  }
  factory Point.vectorX() {
    return Point(1, 0, 0);
  }
  factory Point.vectorZ() {
    return Point(0, 0, 1);
  }
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
  print(chislo("ewdwd 123 qwd 123"));
  print(Slovar(["mylist", 1, 1, 1, "WD", "WD"]));
  print(listnumber(["one", "4, 3", "two", "zero"]));
  Point point1 = Point(3, 0, 0);
  Point point2 = Point(0, 0, 0);
  print(point1.distanceTo(point2));
}

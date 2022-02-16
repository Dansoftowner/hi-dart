import 'dart:io';

import 'dart:math';

final Map<String, Function> _shapes = {
  "square": (num i) => Square(i),
  "circle": (num i) => Circle(i)
};

main() {
  String? shapeName;

  do {
    print("Give me the shape you want to calculate the area of:");
    print("[Options]:\n${_shapes.keys.map((it) => " * $it").join("\n")}");

    shapeName = stdin.readLineSync();
  } while (!_shapes.keys.contains(shapeName));

  print("Give me the size of the shape: ");

  var shapeSize = int.parse(stdin.readLineSync()!);
  Shape shape = _shapes[shapeName]!(shapeSize);

  print("The area of the $shapeName is ${shape.area}");
}

abstract class Shape {
  num get area;
}

class Square implements Shape {
  num a;

  Square(this.a);

  @override
  num get area => pow(a, 2);
}

class Circle implements Shape {
  num r;

  Circle(this.r);

  @override
  num get area => pow(r, 2) * pi;
}

import 'dart:io';

void main() {
  print("Type your name:");
  var typedName = stdin.readLineSync();
  print("Hi $typedName!");
}
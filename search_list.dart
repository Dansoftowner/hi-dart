import 'list_searcher.dart';

void main() {
  final listSearcher = ListSearcher(["A", "B", "C"]);
  final toFind = "B";
  var index = listSearcher.search("B");
  print("Found '$toFind' at index '$index'");
}

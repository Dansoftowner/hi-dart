class ListSearcher {
  List<String> _list;

  ListSearcher(this._list);

  int search(String toFind) {
    for (var i = 0; i < _list.length; i++) {
      if (_list[i].contains(toFind))
        return i;
    }
    return 0;
  }
}
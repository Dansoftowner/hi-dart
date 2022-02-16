void main() {
  LinkedList<String> l = new LinkedList();
  l.addLast("A");
  l.addLast("B");
  l.addLast("C");
  l.addFirst("D");

  print(l);
  while (l.isNotEmpty) l.removeFirst();
  print(l);
}

/// A singly linked list
class LinkedList<T> extends Iterable {
  _Node<T>? _head;
  _Node<T>? _tail;

  void addFirst(T item) {
    var node = _Node(item);
    if (isEmpty)
      _head = _tail = node;
    else {
      var newHead = node;
      newHead.next = _head;
      _head = newHead;
    }
  }

  void addLast(T item) {
    var node = _Node(item);
    if (isEmpty)
      _head = _tail = node;
    else {
      var newTail = node;
      _tail!.next = newTail;
      _tail = newTail;
    }
  }

  void removeFirst() {
    _head = _head?.next;
  }

  void removeLast() {
    if (_head == _tail) {
      _head = _tail = null;
      return;
    }

    var current = _head;
    while (current != null) {
      if (current.next == _tail) break;
      current = current.next;
    }
    current?.next = null;
    _tail = current;
  }

  @override
  Iterator get iterator => new _Iterator(this);

  @override
  String toString() {
    final buf = StringBuffer();
    buf.write("[");

    var current = _head;
    while (current != null) {
      buf.write(current.value);
      if (current.next != null) buf.write(", ");
      current = current.next;
    }
    buf.write("]");

    return buf.toString();
  }
}

class _Node<T> {
  T? value;
  _Node<T>? next;

  _Node(this.value);
}

class _Iterator<T> implements Iterator {
  LinkedList<T> _linkedList;
  _Node<T>? _current;

  _Iterator(this._linkedList);

  @override
  get current => _current?.value;

  @override
  bool moveNext() {
    final moveNext = _linkedList._tail != _current && _linkedList._head != null;
    if (moveNext) {
      if (_current == null)
        _current = _linkedList._head;
      else
        _current = _current!.next;
    }
    return moveNext;
  }
}

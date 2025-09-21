import 'package:flutter/foundation.dart';
import '../models/item.dart';

class ItemProvider extends ChangeNotifier {
  final List<Item> _items = [
    Item(id: 'i1', name: 'MacBook Pro', description: 'ชิป M-series', price: 59900),
    Item(id: 'i2', name: 'Logitech MX Master 3S', description: 'เมาส์ไร้สาย', price: 3290),
  ];

  List<Item> get items => List.unmodifiable(_items);
}

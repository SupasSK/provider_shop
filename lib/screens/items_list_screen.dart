import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/user_profile_provider.dart';
import '../providers/item_provider.dart';
import 'edit_user_screen.dart';

class ItemsListScreen extends StatelessWidget {
  static const routeName = '/';

  const ItemsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final username = context.watch<UserProfileProvider>().username;
    final items = context.watch<ItemProvider>().items;

    return Scaffold(
      appBar: AppBar(
        title: Text('สวัสดี, $username'),
        actions: [
          IconButton(
            tooltip: 'แก้ไขชื่อผู้ใช้',
            icon: const Icon(Icons.edit),
            onPressed: () {
              Navigator.of(context).pushNamed(EditUserScreen.routeName);
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (_, i) => ListTile(
          title: Text(items[i].name),
          subtitle: Text(items[i].description),
          trailing: Text(items[i].price.toStringAsFixed(0)),
        ),
      ),
    );
  }
}

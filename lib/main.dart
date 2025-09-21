import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/item_provider.dart';
import 'providers/user_profile_provider.dart';
import 'screens/items_list_screen.dart';
import 'screens/edit_user_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ItemProvider()),
        ChangeNotifierProvider(create: (_) => UserProfileProvider()),
      ],
      child: MaterialApp(
        title: 'provider_shop_edituser',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: ItemsListScreen.routeName,
        routes: {
          ItemsListScreen.routeName: (_) => const ItemsListScreen(),
          EditUserScreen.routeName: (_) => const EditUserScreen(),
        },
      ),
    );
  }
}

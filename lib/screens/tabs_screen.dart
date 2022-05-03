// import 'package:app7/screens/categories_screen.dart';
// import 'package:app7/screens/favorites_screen.dart';
// import 'package:flutter/material.dart';

// class TabsScreen extends StatefulWidget {
//   const TabsScreen({Key? key}) : super(key: key);

//   @override
//   State<TabsScreen> createState() => _TabsScreenState();
// }

// class _TabsScreenState extends State<TabsScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       //initialIndex: 0,
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text('Meals'),
//           shadowColor: Theme.of(context).colorScheme.secondary,
//           bottom: TabBar(
//             tabs: const <Widget>[
//               Tab(
//                 icon: Icon(Icons.category),
//                 text: 'Categoriaes',
//               ),
//               Tab(
//                 icon: Icon(Icons.star),
//                 text: 'Favorites',
//               )
//             ],
//             indicatorColor: Theme.of(context).colorScheme.secondary,
//           ),
//         ),
//         body: TabBarView(
//           children: <Widget>[
//             CategoriesScreen(),
//             FavoritesScreen(),
//           ],
//         ),
//       ),
//     );
//   }
// }

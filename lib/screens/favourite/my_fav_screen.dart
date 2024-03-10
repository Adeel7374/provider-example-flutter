import 'package:flutter/material.dart';
import 'package:myproject/provider/fav_provider.dart';
import 'package:provider/provider.dart';

class MyFavItemScreen extends StatefulWidget {
  const MyFavItemScreen({super.key});

  @override
  State<MyFavItemScreen> createState() => _MyFavItemScreenState();
}

class _MyFavItemScreenState extends State<MyFavItemScreen> {
  @override
  Widget build(BuildContext context) {
    final favProvider = Provider.of<FavouriteItemProvider>(context);
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourite Screen'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: favProvider.selectedItem.length,
                itemBuilder: (context, index) {
                  return Consumer<FavouriteItemProvider>(
                      builder: ((context, value, child) {
                    return ListTile(
                      onTap: () {
                        if (value.selectedItem.contains(index)) {
                          value.removeItem(index);
                        } else {
                          value.addItem(index);
                        }
                        // setState(() {});
                      },
                      title: Text('item$index'),
                      trailing: Icon(value.selectedItem.contains(index)
                          ? Icons.favorite
                          : Icons.favorite_border),
                    );
                  }));
                }),
          )
        ],
      ),
    );
  }
}

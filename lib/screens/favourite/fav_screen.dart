import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:myproject/provider/fav_provider.dart';
import 'package:myproject/screens/favourite/my_fav_screen.dart';
import 'package:provider/provider.dart';

class FavScreen extends StatefulWidget {
  const FavScreen({super.key});

  @override
  State<FavScreen> createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {
  List<int> selectedItem = [];

  @override
  Widget build(BuildContext context) {
    // final favProvider = Provider.of<FavouriteItemProvider>(context);
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourite app'),
        actions: [
          GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyFavItemScreen(),
                    ));
              },
              child: Icon(Icons.favorite)),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: 100000,
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

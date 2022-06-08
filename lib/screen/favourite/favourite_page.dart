import 'package:flutter/material.dart';
import 'package:flutter_provider/provider/favourite_provider.dart';
import 'package:flutter_provider/screen/favourite/my_favourite.dart';
import 'package:provider/provider.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    print("Whole widget rebuild");
    //final favouriteItemProvider = Provider.of<FavouriteItemProvider>(context,listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorite App"),centerTitle: true,
        actions: [
          InkWell(
            onTap: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyFavouriteItemPage())
              );
            },
            child: const Icon(Icons.favorite)
          ),
          const SizedBox(width: 16,)
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 100,
              itemBuilder: (BuildContext context, int index) {
                return Consumer<FavouriteItemProvider>(
                  builder: (BuildContext context, value, Widget? child) {
                    return ListTile(
                      onTap: (){
                        if(value.selectedItem.contains(index)){
                          value.removeItem(index);
                        }else{
                          value.addItem(index);
                        }
                      },
                      title: Text("Item $index"),
                      trailing: value.selectedItem.contains(index)? const Icon(Icons.favorite, color: Colors.blue,):const Icon(Icons.favorite_border),
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

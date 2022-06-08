import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/favourite_provider.dart';
class MyFavouriteItemPage extends StatefulWidget {
  const MyFavouriteItemPage({Key? key}) : super(key: key);

  @override
  State<MyFavouriteItemPage> createState() => _MyFavouriteItemPageState();
}

class _MyFavouriteItemPageState extends State<MyFavouriteItemPage> {
  @override
  Widget build(BuildContext context) {
    print("Whole widget rebuild");
    final favouriteItemProvider = Provider.of<FavouriteItemProvider>(context,listen: true);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorite List"),centerTitle: true,
        /*actions: [
          InkWell(
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MyFavouriteItemPage())
                );
              },
              child: Icon(Icons.favorite)
          ),
          SizedBox(width: 10,)
        ],*/
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: favouriteItemProvider.selectedItem.length,
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

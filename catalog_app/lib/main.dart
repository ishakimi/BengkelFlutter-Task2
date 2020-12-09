import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'catalogitem.dart';

void main() {
  runApp(MaterialApp(home: Home()));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int item = 0;
  List<CatalogItem> catalogItems = [
    CatalogItem(
        nameItem: 'Water Bottle',
        priceItem: '30.00',
        imageItem: 'image_waterbottle.jpg',
        descriptionItem: 'Stays chilled all day'),
    CatalogItem(
        nameItem: 'Tshirt',
        priceItem: '10.00',
        imageItem: 'image_tshirt.jpg',
        descriptionItem: 'This is a shirt you wear'),
    CatalogItem(
        nameItem: 'Beanie',
        priceItem: '15.00',
        imageItem: 'image_beanie.jpg',
        descriptionItem: 'lttstoredotcom'),
  ];

  Widget catalogItemCard(catalogItem) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Image(
                      image: AssetImage('assets/' + catalogItem.imageItem),
                      width: 100,
                      height: 100,
                    )
                  ],
                ),
              ),
              Column(
                children: <Widget>[
                  Text(catalogItem.nameItem,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      )),
                  Text(catalogItem.descriptionItem),
                  Text(
                    'RM' + catalogItem.priceItem,
                    style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                        fontFamily: 'Courgette'),
                  ),
                  RaisedButton.icon(
                    onPressed: () {
                      setState(() {
                        item++;
                      });
                    },
                    icon: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    label: Text('Add Item',
                        style: TextStyle(color: Colors.white, fontSize: 20.0)),
                    color: Colors.orange,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Catalog Item'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 0.0, 25.0, 0.0),
            child: Badge(
              position: BadgePosition.topEnd(top: 0.0, end: 3.0),
              badgeContent:
                  Text(item.toString(), style: TextStyle(color: Colors.white)),
              child: IconButton(
                icon: Icon(Icons.shopping_basket),
                onPressed: () {
                  setState(() {
                    item = 0;
                  });
                },
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: catalogItems
            .map((catalogItem) => catalogItemCard(catalogItem))
            .toList(),
      ),
      // body: Padding(
      //     padding: const EdgeInsets.fromLTRB(0.0, 200, 0, 0),
      //     child: Column(
      //       children: <Widget>[
      //         Center(
      //           child: Text('My Item',
      //               style: TextStyle(
      //                   fontSize: 30.0,
      //                   fontWeight: FontWeight.bold,
      //                   color: Colors.orange,
      //                   fontFamily: 'Courgette')),
      //         ),
      //         Center(
      //           child: Text('$item',
      //               style: TextStyle(
      //                 fontSize: 40.0,
      //                 fontWeight: FontWeight.bold,
      //                 color: Colors.orange,
      //               )),
      //         ),
      //         Padding(
      //           padding:
      //               const EdgeInsets.symmetric(horizontal: 0, vertical: 50.0),
      //           child: Center(
      //               child: RaisedButton.icon(
      //                   onPressed: () {
      //                     setState(() {
      //                       item = 0;
      //                     });
      //                   },
      //                   icon: Icon(
      //                     Icons.restore,
      //                     color: Colors.white,
      //                   ),
      //                   label: Text(
      //                     'restore item',
      //                     style: TextStyle(color: Colors.white, fontSize: 20.0),
      //                   ),
      //                   color: Colors.redAccent)),
      //         ),
      //       ],
      //     )),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     setState(() {
      //       item++;
      //     });
      //   },
      //   child: Icon(Icons.add),
      //   backgroundColor: Colors.deepPurpleAccent,
      // ),
    );
  }
}

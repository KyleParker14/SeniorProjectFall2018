import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'searchForItem.dart';
import 'package:http/http.dart' as http;
import 'shippers.dart';
import 'suppliers.dart';
import 'customers.dart';
import 'product.dart';
import 'orders.dart';
import 'naturallanguagesearch.dart';

Future<Shippers> fetchPost() async
{
  final response = await http.get('http://inv.azurewebsites.net/api/data/');

  if ( response.statusCode == 200 )
  {
    return Shippers.fromJson( json.decode( response.body ) );
  }
  else
  {
    throw Exception('Failed to load post');
  }
}

class Shippers
{
  final List< Post > posts;

  Shippers( {this.posts} );

  factory Shippers.fromJson( Map< String, dynamic > parsedJson )
  {
    var list = parsedJson[ 'Shippers' ] as List;
    List< Post > postList = list.map( ( i ) => Post.fromJson( i ) ).toList();

    return Shippers( posts: postList );
  }
}

class Post
{
  final int    shipperID;
  final String companyName;
  final String phone;

  Post({this.shipperID, this.companyName, this.phone});

  factory Post.fromJson( Map< String, dynamic > json )
  {
    return Post(
        shipperID: json[ 'ShipperID' ],
        companyName: json[ 'ShipperName' ],
        phone: json[ 'Phone' ]
    );
  }
}

class Home extends StatelessWidget
{
  String _username;

  Home( String username )
  {
    _username = username;
  }


  ProductsWidg products;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inventory Management System',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text('Dashboard'),
            actions: <Widget>[
              IconButton(
                  icon: Icon( Icons.shopping_cart ),
                  onPressed: () {}
              ),
              IconButton(
                  icon: Icon( Icons.monetization_on ),
                  onPressed: () {}
              )
            ],
          ),
          drawer: Drawer(
              child: ListView(
                children: <Widget>[
                  UserAccountsDrawerHeader(
                      accountName: Text( _username ),
                      accountEmail: Text( "" )
                  ),
                  ListTile(
                      title: Text( "Shipper" ),
                      trailing: Icon( Icons.android ),
                      onTap: () {
                        Navigator.push( context, MaterialPageRoute( builder: ( context ) => ShippersWidg() ) );
                      },
                  ),
                  ListTile(
                      title: Text( "Supplier" ),
                      trailing: Icon( Icons.donut_large ),
                      onTap: (){
                        Navigator.push( context, MaterialPageRoute( builder: ( context ) => SuppliersWidg() ));
                      },
                  ),
                  ListTile(
                      title: Text( "Customer" ),
                      trailing: Icon( Icons.donut_small ),
                      onTap: (){
                        Navigator.push( context, MaterialPageRoute( builder: ( context ) => CustomersWidg() ));
                      }
                  ),
                  ListTile(
                    title: Text( "Orders" ),
                    trailing: Icon( Icons.shopping_basket ),
                    onTap: () {
                      Navigator.push( context, MaterialPageRoute( builder: ( context ) => OrdersWidg() ) );
                    }
                  ),
                  ListTile(
                    title: Text( "Natural Language Search" ),
                    trailing: Icon( Icons.cloud ),
                    onTap: () {
                      Navigator.push( context, MaterialPageRoute( builder: ( context ) => NLSWidg() ) );
                    }
                  ),
                  Divider(),
                  ListTile(
                      title: Text( 'Log Out' ),
                      trailing: Icon( Icons.exit_to_app ),
                      onTap: () {
                        Navigator.pop( context );
                      }
                  )
                ],
              )
          ),
          body:
          Center(
            child: products = ProductsWidg()
          ),

          bottomNavigationBar: BottomNavigationBar(
              items: [
                BottomNavigationBarItem(
                    icon: Icon( Icons.home ),
                    title: Text( 'Home' )
                ),
                BottomNavigationBarItem(
                    icon: Icon( Icons.search ),
                    title: Text( 'Search For Item' ),

                )
              ]
          )
      ),
    );
  }
}
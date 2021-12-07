import 'package:flutter/material.dart';
import 'package:login_firebase/model/pelicula_model.dart';
import 'package:login_firebase/providers/peliculas_providers.dart';
import 'package:login_firebase/widgets/card_swiper_widget.dart';
import 'package:login_firebase/widgets/categoria_horizontal.dart';

class HomePage extends StatelessWidget {
  final productosProvider = ProductosProviders();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text('World Skill 2021'),
        backgroundColor: Colors.orange,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[_swipeTarjetas(), _footer(context)],
        ),
      ),
    );
  }

  Widget _swipeTarjetas() {
    return FutureBuilder(
      future: productosProvider.getProductos(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if (snapshot.hasData) {
          return CardSwiper(productos: snapshot.data);
        } else {
          return Container(
              height: 300.0, child: Center(child: CircularProgressIndicator()));
        }
      },
    );
  }

  Widget _footer(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10.0),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 20.0),
            child: Text(
              'Categorias',
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange),
            ),
          ),
          SizedBox(height: 10.0),
          FutureBuilder(
            future: productosProvider.getCategoria(),
            builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
              if (snapshot.hasData) {
                return CategoriasHorizontal(categorias: snapshot.data);
              } else {
                return Container(
                    height: 300.0,
                    child: Center(child: CircularProgressIndicator()));
              }
            },
          )
        ],
      ),
    );
  }
}

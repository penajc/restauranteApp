import 'package:flutter/material.dart';

class CategoriasHorizontal extends StatelessWidget {
  List<dynamic>? categorias;
  CategoriasHorizontal({@required this.categorias});

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    return Container(
      height: _screenSize.height * 0.3,
      child: PageView(
        pageSnapping: false,
        controller: PageController(initialPage: 1, viewportFraction: 0.5),
        children: _tarjetas(),
      ),
    );
  }

  List<Widget> _tarjetas() {
    return categorias!.map((categoria) {
      return Container(
        margin: EdgeInsets.only(right: 15.0),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: FadeInImage(
                image: NetworkImage(categoria.getCategoria()),
                placeholder: AssetImage('assets/images/loading.gif'),
                fit: BoxFit.cover,
                height: 200.0,
              ),
            ),
            //SizedBox(),
            Text(
              categoria.nombre,
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange),
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      );
    }).toList();
  }
}

import 'dart:convert';

import 'package:login_firebase/model/pelicula_model.dart';
import 'package:http/http.dart' as http;

class ProductosProviders {
  String _producto = '';
  String _url = 'wsc.fabricasoftware.co';

  Future<List<Producto>> getProductos() async {
    final url = Uri.https(_url, '/api/productos', {'': '{}'});

    final resp = await http.get(url);

    final decodeData = json.decode(resp.body);

    final producto = new Productos.fromJsonList(decodeData['productos']);

    //print(decodeData['productos']);
    //print(producto.items[1].nombre);

    return producto.items;
  }

  Future<List<Producto>> getCategoria() async {
    String _categoria = '';
    String _url = 'wsc.fabricasoftware.co';

    final url = Uri.https(_url, '/api/categorias', {'': '{}'});

    final resp = await http.get(url);

    final decodeData = json.decode(resp.body);

    final categoria = new Productos.fromJsonList(decodeData['datos']);

    //print(decodeData['productos']);
    //print(categoria.items[0].nombre);

    return categoria.items;
  }
}

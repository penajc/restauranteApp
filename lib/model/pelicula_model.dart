class Productos {
  List<Producto> items = [];

  Productos();

  Productos.fromJsonList(List<dynamic> jsonlist) {
    if (jsonlist == null) return;
    for (var item in jsonlist) {
      final producto = new Producto.fromJsonMap(item);
      items.add(producto);
    }
  }
}

class Producto {
  int? id;
  String? nombre;
  String? descripcion;
  int? precio;
  String? urlImagen;

  Producto({
    this.id,
    this.nombre,
    this.descripcion,
    this.precio,
    this.urlImagen,
  });

  Producto.fromJsonMap(Map<String, dynamic> json) {
    id = json['id'];
    nombre = json['nombre'];
    descripcion = json['descripcion'];
    precio = json['precio'];
    urlImagen = json['url_imagen'];
  }

  getPosterImg() {
    if (urlImagen == null) {
      return 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/da/Imagen_no_disponible.svg/1024px-Imagen_no_disponible.svg.png';
    }
    return urlImagen;
  }

  getCategoria() {
    if (urlImagen == null) {
      return 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/da/Imagen_no_disponible.svg/1024px-Imagen_no_disponible.svg.png';
    }
    return urlImagen;
  }
}

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:login_firebase/model/pelicula_model.dart';

class CardSwiper extends StatelessWidget {
  final List<dynamic>? productos;
  CardSwiper({@required this.productos});

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(top: 10.0),
      //width: _screenSize.width * 0.7,
      //height: _screenSize.height * 0.5,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: FadeInImage(
                image: NetworkImage(productos![index].getPosterImg()),
                placeholder: AssetImage('assets/images/loading.gif'),
                fit: BoxFit.cover,
              ));
        },
        itemCount: productos!.length,
        itemWidth: _screenSize.width * 0.85,
        itemHeight: _screenSize.width,
        layout: SwiperLayout.STACK,
      ),
    );
  }
}

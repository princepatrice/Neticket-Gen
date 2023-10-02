
import 'package:flutter/widgets.dart';

Widget SiteButton ( url, Function onPressed){
    return  GestureDetector(
        onTap: onPressed(),
        child:Container(
            padding: EdgeInsets.symmetric(horizontal: 5),
        child: Image.network(url,height: 40,))
    );
}
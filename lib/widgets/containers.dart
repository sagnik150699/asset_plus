import 'package:flutter/material.dart';
class Containers {

  Future<Container> container(String title, String date, String link)async{
    print("check this $link");
      return Container(
        height: 200,
        width: 200,
        child: Row(
          children: [
            Image.network(link,height: 100.0,width: 100.0,),
            Column(
              children: [
                Text(title),
                Text(date)
              ],
            )
        ],
        ),
      );
  }

}
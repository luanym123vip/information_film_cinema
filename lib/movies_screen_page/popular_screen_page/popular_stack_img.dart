import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PopularStackImg extends StatelessWidget {
  final String urlImg;
  final String name;
  final String releaseDate;
  final String overview;
  final BuildContext context;
  final void Function()? ontap;
  const PopularStackImg(
      {super.key,
      required this.urlImg,
      required this.name,
      required this.releaseDate,
      required this.overview,
      required this.context,
      required this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // có thể sử dụng GestureDetector
      // onTap: () {
      // Navigator.push(context,
      //     MaterialPageRoute(builder: (context) => InformationMoviesScreen()));
      onTap: ontap,
      child: Container(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      urlImg,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Positioned(
                    bottom: 3,
                    right: 15,
                    child: Text(
                      releaseDate,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: 'Comfortaa',
                          fontWeight: FontWeight.bold),
                    ))
              ],
            ),
            const SizedBox(
              height: 2,
            ),
            Expanded(
                child: Text(
              name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 14,
                  fontFamily: 'Comfortaa',
                  fontWeight: FontWeight.bold),
            ))
          ],
        ),
      ),
      // },
    );
  }
}

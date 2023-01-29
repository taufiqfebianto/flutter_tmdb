import 'package:flutter/material.dart';

Widget listMovie({double? height, String? imagePath, int? itemCount}) {
  return SizedBox(
    height: height ?? 220,
    child: ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const AlwaysScrollableScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: itemCount ?? 10,
      itemBuilder: ((context,int index) {
        return InkWell(
          onTap: () {},
          child: Container(
            margin: const EdgeInsets.only(right: 5),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.network(
                  imagePath ??
                      'https://s1.bukalapak.com/img/68286857232/large/Poster_Film___Avengers_Endgame___Marvel_Studios___Movie_Post.jpg',
                  fit: BoxFit.cover),
            ),
          ),
        );
      }),
    ),
  );
}

Widget listTrailer({double? height, String? imagePath, int? itemCount}) {
  return SizedBox(
    height: height ?? 150,
    child: ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const AlwaysScrollableScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: itemCount ?? 10,
      itemBuilder: ((context,int index) {
        return InkWell(
          onTap: () {},
          child: Container(
            margin: const EdgeInsets.only(right: 5),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.network(
                  imagePath ??
                      'https://4.bp.blogspot.com/-CJzAMtILkLA/XEQrxmj6p6I/AAAAAAAAMbo/VaLGgEeDy5YAAyKOO2UBbjPbwN2A6iNhACLcBGAs/s640/1_jfR0trcAPT3udktrFkOebA.jpg',
                  fit: BoxFit.cover),
            ),
          ),
        );
      }),
    ),
  );
}

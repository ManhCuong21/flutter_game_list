import 'dart:math';
import 'package:flutter/material.dart';
import '../../../../domain/entities/games.dart';
import '../detail/detail_page.dart';

Widget listNFT(List<Games> list) {
  return ListView.builder(
    itemCount: list.length,
    itemBuilder: (BuildContext context, int index) {
      return Container(
        margin: EdgeInsets.only(
          top: index == 0 ? 0 : 8,
          bottom: index == list.length - 1 ? 0 : 8,
        ),
        child: _itemNFT(context, list[index]),
      );
    },
  );
}

_itemNFT(BuildContext context, Games game) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (builder) {
            return ScreenDetailPage(id: game.id!.toInt());
          },
        ),
      );
    },
    child: Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: FadeInImage.assetNetwork(
            placeholder: 'assets/images/placeholder.png',
            image: '${game.thumbnail}',
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${game.title}",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "By ${game.publisher}",
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                ),
                padding: EdgeInsets.all(8),
                child: GestureDetector(
                  onTap: () {
                    // xử lý nhấn
                  },
                  child: Icon(
                    Icons.favorite_border,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 10,
          left: 10,
          right: 10,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(40)),
              shape: BoxShape.rectangle,
              color: Colors.black38,
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 24),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Remaining time",
                        style: TextStyle(fontSize: 10, color: Colors.white),
                      ),
                      Text(
                        "${game.releaseDate}",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Current Price",
                        style: TextStyle(fontSize: 10, color: Colors.white),
                      ),
                      Text(
                        "₹ ${100 + Random().nextInt(40)}.00",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.north_east, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

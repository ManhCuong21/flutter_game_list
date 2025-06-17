import 'package:flutter/material.dart';

AppBar appBar(int selectedIndex, List<String> tabs, Function onAppBarTap) {
  return AppBar(
    title: _header(),
    backgroundColor: Colors.black,
    automaticallyImplyLeading: false,
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(50),
      child: SizedBox(
        height: 36,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: tabs.length,
          itemBuilder: (context, index) {
            return _listCategory(
              context,
              index,
              selectedIndex,
              tabs,
              onAppBarTap,
            );
          },
        ),
      ),
    ),
  );
}

Widget _listCategory(
  BuildContext context,
  int index,
  int selectedIndex,
  List<String> tabs,
  Function onAppBarTap,
) {
  final isSelected = index == selectedIndex;
  return GestureDetector(
    onTap: () {
      onAppBarTap(index);
    },
    child: Container(
      width: MediaQuery.of(context).size.width / 4,
      alignment: Alignment.center,
      margin: EdgeInsets.only(
        left: index == 0 ? 16 : 8,
        right: index == tabs.length - 1 ? 16 : 0,
      ),
      decoration: BoxDecoration(
        color: isSelected ? Colors.white : Colors.white12,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        tabs[index],
        style: TextStyle(
          color: isSelected ? Colors.black : Colors.white,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    ),
  );
}

Widget _header() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    mainAxisSize: MainAxisSize.max,
    children: [
      _headerText(),
      Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white12,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        alignment: Alignment.topRight,
        child: Image.asset("assets/images/dashboard.png", color: Colors.white),
      ),
    ],
  );
}

Widget _headerText() {
  return RichText(
    text: TextSpan(
      children: <TextSpan>[
        TextSpan(
          text: "NFT\n",
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
            fontStyle: FontStyle.italic,
          ),
        ),
        TextSpan(
          text: "Best NFT collection in one place",
          style: TextStyle(
            fontSize: 14,
            color: Colors.white70,
            fontStyle: FontStyle.italic,
          ),
        ),
      ],
    ),
  );
}

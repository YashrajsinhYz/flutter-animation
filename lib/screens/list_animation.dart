import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animations/models/scroll_item_model.dart';

class ListAnimation extends StatefulWidget {
  const ListAnimation({super.key});

  @override
  State<ListAnimation> createState() => _ListAnimationState();
}

class _ListAnimationState extends State<ListAnimation> {
  ScrollController scrollController = ScrollController();
  bool closeContainer = false;
  double myTopContainer = 0;
  List<Widget> itemList = [];

  @override
  void initState() {
    super.initState();
    myBodyItems();
    scrollController.addListener(() {
      double myData = scrollController.offset / 120;
      setState(() {
        myTopContainer = myData;
        closeContainer = scrollController.offset > 50;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AnimatedOpacity(
                opacity: closeContainer ? 0 : 1,
                duration: const Duration(milliseconds: 500),
                child: AnimatedContainer(
                  alignment: Alignment.topCenter,
                  width: size.width,
                  height: closeContainer ? 0 : size.height * 0.3,
                  duration: const Duration(milliseconds: 500),
                  child: ListView(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(
                            left: 15, right: 15, top: 15, bottom: 0),
                        child: Row(
                          children: [
                            Text("Discover"),
                            Spacer(),
                            Text("view all"),
                            Icon(Icons.arrow_forward_ios, size: 15),
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          child: Row(
                            children: [
                              buildContainer(size, Colors.red),
                              buildContainer(size, Colors.blue),
                              buildContainer(size, Colors.green),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(15.0),
                child: Text("Coupons"),
              ),
              Expanded(
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: itemList.length,
                  itemBuilder: (context, index) {
                    double opacity = 1.0;
                    if (myTopContainer > 0.5) {
                      opacity = index + 0.5 - myTopContainer;
                      if (opacity < 0) {
                        opacity = 0;
                      } else if (opacity > 1) {
                        opacity = 1;
                      }
                    }
                    return Opacity(
                      opacity: opacity,
                      child: Transform(
                        transform: Matrix4.identity()..scale(opacity, opacity),
                        alignment: Alignment.topCenter,
                        child: Align(
                            heightFactor: index == 0
                                ? 1
                                : 0.6,
                            child: itemList[index]),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void myBodyItems() {
    List<Widget> listItems = [];
    for (ScrollItem items in dataItems) {
      listItems.add(
        Container(
          height: 160,
          margin: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 15,
          ),
          decoration: BoxDecoration(
            color: Color(items.color),
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(color: Colors.black26, blurRadius: 5),
            ],
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                items.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              Image.asset(
                items.image,
                fit: BoxFit.cover,
              )
            ],
          ),
        ),
      );
    }
    setState(() {
      itemList = listItems;
    });
  }

  Container buildContainer(Size size, MaterialColor color) {
    return Container(
      height: size.height * 0.2,
      width: size.width * 0.32,
      margin: const EdgeInsets.only(right: 10),
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(15)),
      child: const Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Pizza", style: TextStyle(fontSize: 20, color: Colors.white)),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("20 items", style: TextStyle(color: Colors.white)),
                Icon(Icons.favorite_border, color: Colors.white),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

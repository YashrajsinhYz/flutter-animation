import 'package:flutter/material.dart';
import 'package:flutter_animations/animated_button.dart';
import 'package:flutter_animations/list_animation.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomeScreen> {
  List<Widget> btnList = [];

  @override
  void initState() {
    super.initState();
    btnList = [
      buttonWidget("Animated List", const ListAnimation()),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Animation Home Screen"),
        ),
        body: /*ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) =>
            buttonWidget("Animated List", const ListAnimation()),
      ),*/
            Center(
          child: Column(
            children: [
              buttonWidget("Animated List", const ListAnimation()),
              buttonWidget("Animated Button", const ButtonAnimation()),
            ],
          ),
        ));
  }

  Widget buttonWidget(String btnText, Widget screen) {
    return ElevatedButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => screen));
        },
        child: Text(btnText));
  }
}

import 'package:flutter/material.dart';

class ButtonAnimation extends StatefulWidget {
  const ButtonAnimation({super.key});

  @override
  State<ButtonAnimation> createState() => _ButtonAnimationState();
}

class _ButtonAnimationState extends State<ButtonAnimation> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: const Text("Button animation")),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: AnimatedContainer(
            height: size.height * 0.08,
            duration: const Duration(milliseconds: 300),
            width: isExpanded ? size.width * 0.5 : size.width * 0.18,
            decoration: BoxDecoration(
                color: Colors.red, borderRadius: BorderRadius.circular(isExpanded ? 50 : 15)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: Icon(isExpanded ? Icons.check : Icons.shopping_cart, color: Colors.white),
                ),
                if (isExpanded)
                  const Flexible(child: Text("Added to cart", style: TextStyle(color: Colors.white,fontSize: 20))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

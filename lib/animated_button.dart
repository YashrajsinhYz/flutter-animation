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
          duration: const Duration(milliseconds: 100),
          width: isExpanded ? size.width * 0.65 : size.width * 0.18,
          decoration: BoxDecoration(
              color: Colors.red, borderRadius: BorderRadius.circular(15)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(isExpanded ? Icons.check : Icons.shopping_cart,
                  color: Colors.white),
              if (isExpanded)
                const Expanded(
                    child: Text("Added to cart",
                        style: TextStyle(color: Colors.white))),
            ],
          ),
        ),
      )),
    );
  }
}

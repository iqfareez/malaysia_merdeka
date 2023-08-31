import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class Bendera extends StatelessWidget {
  const Bendera({super.key});

  @override
  Widget build(BuildContext context) {
    var stripHeight = 25.0;
    return Stack(
      children: [
        Column(
          children: [
            for (int i = 0; i < 14; i++)
              Container(
                height: stripHeight,
                width: double.infinity,
                color: i.isEven ? Colors.red : Colors.white,
              )
          ],
        ),
        Container(
          // the box will end untl 8th strip (8 * strip height)
          height: 8 * stripHeight,
          width: 300,
          color: const Color(0xff000063),
          child: const Stack(
            alignment: Alignment.center,
            children: [
              Positioned(left: 50, child: _Moon()),
              Positioned(
                  right: 50,
                  child: SizedBox(height: 120, width: 120, child: _Star())),
            ],
          ),
        ),
      ],
    );
  }
}

class _Moon extends StatelessWidget {
  const _Moon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        Container(
            height: 150,
            width: 150,
            decoration: const BoxDecoration(
              color: Color(0xfff7c600),
              shape: BoxShape.circle,
            )),
        Positioned(
          left: 10,
          child: Container(
              height: 130,
              width: 180,
              decoration: const BoxDecoration(
                color: Color(0xff000063),
                shape: BoxShape.circle,
              )),
        ),
      ],
    );
  }
}

class _Star extends StatelessWidget {
  const _Star({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: StarClipper(14),
      child: Container(
        color: const Color(0xfff7c600),
      ),
    );
  }
}

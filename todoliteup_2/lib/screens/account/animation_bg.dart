import 'dart:math';

import 'package:flutter/material.dart';

class DiscData {
  static final _rng = Random();

  final double size;
  final Color color;
  final Alignment alignment;

  DiscData()
      : size = _rng.nextDouble() * 40 + 10,
        color = Color.fromARGB(
          _rng.nextInt(200),
          _rng.nextInt(255),
          _rng.nextInt(255),
          _rng.nextInt(255),
        ),
        alignment = Alignment(
          _rng.nextDouble() * 2 - 1,
          _rng.nextDouble() * 2 - 1,
        );
}

class AnimationBgView extends StatefulWidget {
  final int numberOfDiscs;

  const AnimationBgView(this.numberOfDiscs, {super.key});

  @override
  State<AnimationBgView> createState() => _AnimationBgViewState();
}

class _AnimationBgViewState extends State<AnimationBgView> {
  final _discs = <DiscData>[];

  @override
  void initState() {
    super.initState();
    _makeDiscs();
  }

  void _makeDiscs() {
    _discs.clear();
    for (int i = 0; i < widget.numberOfDiscs; i++) {
      _discs.add(DiscData());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Center(
          child: Text(
            'Click a disc!',
            style: TextStyle(color: Colors.white, fontSize: 50),
          ),
        ),
        GestureDetector(
          onTap: () => setState(() {
            _makeDiscs();
          }),
          child: Stack(
            children: [
              for (final disc in _discs)
                Positioned.fill(
                  child: AnimatedAlign(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                    alignment: disc.alignment,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 500),
                      decoration: BoxDecoration(
                        color: disc.color,
                        shape: BoxShape.circle,
                      ),
                      height: disc.size,
                      width: disc.size,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

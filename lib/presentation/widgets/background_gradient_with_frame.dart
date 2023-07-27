import 'package:flutter/material.dart';
import 'package:flutter_wonderwoman_projectscoid/presentation/widgets/background_gradient.dart';

class BackgroundGradientWithFrame extends StatelessWidget {
  const BackgroundGradientWithFrame({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
        Positioned(
          child: BackgroundGradient(),
        ),
      ],
    );
  }
}

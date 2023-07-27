import 'package:flutter/material.dart';

class BackgroundGradient extends StatelessWidget {
  const BackgroundGradient({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.indigoAccent,
            Colors.indigoAccent,
            Colors.indigoAccent,
            Color.fromARGB(137, 83, 109, 254),
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IA extends StatefulWidget {
  const IA({Key? key}) : super(key: key);

  @override
  State<IA> createState() => _IAState();
}

class _IAState extends State<IA> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.network(
          "https://assets8.lottiefiles.com/packages/lf20_bPtkGeNd9y.json",
          width: 300,
          controller: _animationController,
          onLoaded: (composition) {
            _animationController..duration = composition.duration..forward()..repeat(reverse: true);
          },
        ),
      ),
    );
  }
}

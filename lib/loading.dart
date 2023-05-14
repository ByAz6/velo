import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class loading extends StatefulWidget {
  const loading({Key? key}) : super(key: key);

  @override
  State<loading> createState() => _loadingState();
}

class _loadingState extends State<loading> with SingleTickerProviderStateMixin {
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
         backgroundColor: Color.fromARGB(255, 47, 56, 66),
      body: Center(
        child: Lottie.network(
          "https://assets5.lottiefiles.com/packages/lf20_jargtjky.json",
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

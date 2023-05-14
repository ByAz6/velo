import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class geo extends StatefulWidget {
  const geo({Key? key}) : super(key: key);

  @override
  State<geo> createState() => _geoState();
}

class _geoState extends State<geo> with SingleTickerProviderStateMixin {
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
         backgroundColor: Color.fromARGB(255, 1, 2, 2),
      body: Center(
        child: Lottie.network(
          "https://assets4.lottiefiles.com/packages/lf20_oUYCEY6cfy.json",
          width: 600,
          controller: _animationController,
          onLoaded: (composition) {
            _animationController..duration = composition.duration..forward()..repeat(reverse: true);
          },
        ),
      ),
    );
  }
}

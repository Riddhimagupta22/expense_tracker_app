import 'package:expense_tracker_app/Comman_Wigets/widget/custom%20Container/custom_container.dart';
import 'package:expense_tracker_app/Modules/onBoarding/view/widget/container_widget.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Stack(children: [
        Column(
          children: [
            ContainerWidget(child: Image.asset("Assets/Image/Man.png"))

          ],
        )
      ],)),
    );
  }
}

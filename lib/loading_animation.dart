import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class LoadingAnimation extends StatefulWidget {
  const LoadingAnimation({super.key});

  @override
  State<LoadingAnimation> createState() => _LoadingAnimationState();
}

class _LoadingAnimationState extends State<LoadingAnimation> {
  SMIInput<bool>? isChecking;
  SMIInput<bool>? isHandsUp;
  SMIInput<bool>? trigSuccess;
  SMIInput<bool>? trigFail;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: SizedBox.square(
              dimension: 300,
              child: RiveAnimation.asset(
                "assets/login.riv",
                stateMachines: const ["Login Machine"],
                onInit: (artboard) {
                  final controller = StateMachineController.fromArtboard(
                      artboard, "Login Machine");
                  if (controller == null) return;
                  artboard.addController(controller);
                  isChecking = controller.findSMI("isChecking");
                  isHandsUp = controller.findSMI("isHandsUp");
                  trigSuccess = controller.findSMI("trigSuccess");
                  trigFail = controller.findSMI("trigFail");
                },
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  if (isHandsUp == null) return;
                  isHandsUp!.change(true);
                  isChecking!.change(false);
                  trigFail!.change(false);
                  trigSuccess!.change(false);
                },
                icon: const Icon(Icons.back_hand_sharp),
              ),
              IconButton(
                onPressed: () {
                  if (isChecking == null) return;
                  isChecking!.change(true);
                  trigFail!.change(false);
                  isHandsUp!.change(false);
                  trigSuccess!.change(false);
                },
                icon: const Icon(Icons.remove_red_eye),
              ),
              IconButton(
                onPressed: () {
                  if (trigSuccess == null) return;
                  trigSuccess!.change(true);
                  isChecking!.change(false);
                  trigFail!.change(false);
                  isHandsUp!.change(false);
                },
                icon: const Icon(Icons.done_all_rounded),
              ),
              IconButton(
                onPressed: () {
                  if (trigFail == null) return;
                  trigFail!.change(true);
                  isChecking!.change(false);
                  isHandsUp!.change(false);
                  trigSuccess!.change(false);
                },
                icon: const Icon(Icons.cancel_rounded),
              )
            ],
          )
        ],
      ),
    );
  }
}

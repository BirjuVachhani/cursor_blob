import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class CursorBlob extends StatefulWidget {
  final double radius;
  final Widget? child;

  const CursorBlob({
    super.key,
    this.child,
    this.radius = 200,
  });

  @override
  State<CursorBlob> createState() => _CursorBlobState();
}

class _CursorBlobState extends State<CursorBlob>
    with SingleTickerProviderStateMixin {
  Offset position = Offset.zero;

  late final AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
      animationBehavior: AnimationBehavior.preserve,
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: LayoutBuilder(builder: (context, constraints) {
        final double width =
            min(constraints.maxWidth, constraints.maxHeight) * 0.45;
        final double height = width * 1.4;
        return Listener(
          onPointerHover: onMove,
          behavior: HitTestBehavior.opaque,
          child: ColoredBox(
            color: Colors.transparent,
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeOut,
                  left: position.dx - width / 2,
                  top: position.dy - height / 2,
                  child: AnimatedBuilder(
                    animation: controller,
                    builder: (context, child) {
                      return Transform.rotate(
                        angle: controller.value * 2 * pi,
                        child: child,
                      );
                    },
                    child: Container(
                      width: width,
                      height: height,
                      decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.elliptical(width, height),
                          ),
                        ),
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xffA374FF),
                            Color(0xffFFD074),
                          ],
                        ),
                      ),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: width * 0.4,
                          sigmaY: width * 0.4,
                        ),
                        child: Container(),
                      ),
                    ),
                  ),
                ),
                if (widget.child != null) widget.child!,
              ],
            ),
          ),
        );
      }),
    );
  }

  void onMove(PointerEvent event) {
    position = event.localPosition;
    setState(() {});
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

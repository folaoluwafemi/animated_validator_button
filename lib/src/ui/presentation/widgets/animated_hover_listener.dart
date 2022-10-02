import 'package:animated_button_validator/src/ui/utils/extensions.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AnimatedHoverListener extends StatefulWidget {
  final Widget child;
  final bool escapeHover;
  final double width;

  const AnimatedHoverListener({
    Key? key,
    required this.child,
    required this.escapeHover,
    this.width = 300,
  }) : super(key: key);

  @override
  State<AnimatedHoverListener> createState() => _AnimatedHoverListenerState();
}

class _AnimatedHoverListenerState extends State<AnimatedHoverListener> {
  late final double width;

  @override
  void initState() {
    super.initState();
    width = widget.width;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: MouseRegion(
        onHover: widget.escapeHover
            ? (PointerHoverEvent event) => setNextPositionRelativeToHoverOffset(
                  event.localPosition,
                )
            : null,
        child: AnimatedAlign(
          duration: const Duration(milliseconds: 100),
          alignment: widget.escapeHover ? childAlignment : Alignment.center,
          child: widget.child,
        ),
      ),
    );
  }

  void setNextPositionRelativeToHoverOffset(Offset hoverOffset) {
    final double thirdWidth = width / 3;

    ///if in the left extreme of the max space
    if (hoverOffset.dx < thirdWidth) {
      if (childAlignment != Alignment.centerRight) {
        setState(() {
          childAlignment = Alignment.center;
        });
      }
    }

    ///if in the middle of the max space
    else if (hoverOffset.dx > thirdWidth && hoverOffset.dx < (thirdWidth * 2)) {
      setState(() {
        final double currentCenterXOffset = hoverOffset.dx - thirdWidth;

        final double percentCenterXOffset =
            thirdWidth.percent(currentCenterXOffset);

        ///if the greater half of the middle of the max space
        if (percentCenterXOffset > 50) {
          childAlignment = Alignment.centerLeft;
        } else {
          childAlignment = Alignment.centerRight;
        }
      });
    }

    ///if at the right extreme of the max space
    else {
      if (childAlignment != Alignment.centerLeft) {
        setState(() {
          childAlignment = Alignment.center;
        });
      }
    }
  }

  Alignment childAlignment = Alignment.center;
}

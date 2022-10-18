import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BackDropFilterList extends StatefulWidget {
  final double topPadding;
  final List<Widget> childList;
  final Size deviceSize;
  final bool? disableByScrollWidget;

  const BackDropFilterList({
    required this.topPadding,
    required this.childList,
    required this.deviceSize,
    this.disableByScrollWidget = false,
    Key? key,
  }) : super(key: key);

  @override
  State<BackDropFilterList> createState() => _BackDropFilterListState();
}

class _BackDropFilterListState extends State<BackDropFilterList> {
  late final ScrollController _scroller = ScrollController()
    ..addListener(_handleScrollChanged);
  final _scrollPos = ValueNotifier(0.0);
  bool isBackdropFilter = true;

  void _handleScrollChanged() {
    _scrollPos.value = _scroller.position.pixels;
  }

  @override
  void dispose() {
    _scroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopRouterOnOverScroll(
      controller: _scroller,
      child: LayoutBuilder(builder: (_, constraints) {
        return AnimatedBuilder(
          animation: _scroller,
          builder: (_, __) {
            bool showBackdrop = true;
            double backdropAmt = 0;
            if (_scroller.hasClients) {
              double blurStart = 50;
              double maxScroll = 150;
              double scrollPx = _scroller.position.pixels - blurStart;
              // Normalize scroll position to a value between 0 and 1
              backdropAmt =
                  (_scroller.position.pixels - blurStart).clamp(0, maxScroll) /
                      maxScroll;
              // Disable backdrop once it is offscreen for an easy perf win
              showBackdrop =
                  (scrollPx + (widget.deviceSize.height - widget.topPadding) <=
                      widget.deviceSize.height);
            }
            return Stack(
              children: [
                if (showBackdrop) ...[
                  AppBackdrop(
                    strength: backdropAmt,
                    child: Container(
                      color: Colors.grey.withOpacity(backdropAmt * .6),
                    ),
                  ),
                ],
                // widget.disableByScrollWidget!
                //     ? Positioned(
                //         top: 50,
                //         left: 18,
                //         child: disableByScroll())
                //     : Container(),
                _bottomListContent(),
                widget.disableByScrollWidget!
                    ? Positioned(top: 50, left: 18, child: disableByScroll())
                    : Container(),
              ],
            );
          },
        );
      }),
    );
  }

  // 스크롤에 따라서 사라지는 위젯
  ValueListenableBuilder<double> disableByScroll() {
    return ValueListenableBuilder<double>(
      valueListenable: _scrollPos,
      builder: (_, value, child) {
        // get some value between 0 and 1, based on the amt scrolled
        double opacity = (1 - value / 150).clamp(0, 1);
        return Opacity(opacity: opacity, child: child);
      },
      child: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(Icons.sports_soccer_rounded, size: 36)),
    );
  }

  Widget _bottomListContent() {
    Container buildHandle() {
      return Container(
        width: 35,
        height: 5,
        decoration: BoxDecoration(
            color: Colors.grey, borderRadius: BorderRadius.circular(99)),
      );
    }

    return SingleChildScrollView(
      controller: _scroller,
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          IgnorePointer(
            child: Container(
              height: widget.topPadding,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                buildHandle(),
                const SizedBox(
                  height: 20,
                ),
                ...widget.childList
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PopRouterOnOverScroll extends StatefulWidget {
  const PopRouterOnOverScroll(
      {Key? key, required this.child, required this.controller})
      : super(key: key);
  final ScrollController controller;
  final Widget child;

  @override
  State<PopRouterOnOverScroll> createState() => _PopRouterOnOverScrollState();
}

class _PopRouterOnOverScrollState extends State<PopRouterOnOverScroll> {
  final _scrollToPopThreshold = 70;
  bool _isPointerDown = false;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_handleScrollChanged);
  }

  @override
  void didUpdateWidget(covariant PopRouterOnOverScroll oldWidget) {
    if (widget.controller != oldWidget.controller) {
      widget.controller.addListener(_handleScrollChanged);
    }
    super.didUpdateWidget(oldWidget);
  }

  bool _checkPointerIsDown(d) => _isPointerDown = d.dragDetails != null;

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollUpdateNotification>(
      onNotification: _checkPointerIsDown,
      child: widget.child,
    );
  }

  void _handleScrollChanged() {
    // If user pulls far down on the elastic list, pop back to
    final px = widget.controller.position.pixels;
    if (px < -_scrollToPopThreshold) {
      if (_isPointerDown) {
        Navigator.of(context).pop();
        widget.controller.removeListener(_handleScrollChanged);
      }
    }
  }
}

class AppBackdrop extends StatelessWidget {
  const AppBackdrop({
    Key? key,
    this.strength = 1,
    this.child,
  }) : super(key: key);

  final double strength;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final double normalStrength = clampDouble(strength, 0, 1);

    return BackdropFilter(
      filter: ImageFilter.blur(
          sigmaX: normalStrength * 5.0, sigmaY: normalStrength * 5.0),
      child: child ?? const SizedBox.expand(),
    );
  }
}

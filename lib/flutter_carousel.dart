import 'package:flutter/material.dart';
import 'dart:async';

class Carousel extends StatefulWidget {

  ///All the [Widget] on this Carousel.
  final List<Widget> children;

  ///Returns [children]`s [lenght].
  int get childrenCount => children.length;

  ///The transition animation timing curve. Default is [Curves.ease]
  final Curve animationCurve;

  ///The transition animation duration. Default is 250ms.
  final Duration animationDuration;

  ///The amount of time each frame is displayed. Default is 2s.
  final Duration displayDuration;

  Carousel({
    this.children,
    this.animationCurve = Curves.ease,
    this.animationDuration = const Duration(milliseconds: 250),
    this.displayDuration = const Duration(seconds: 2)
  }) :
        assert(children != null),
        assert(children.length > 1),
        assert(animationCurve != null),
        assert(animationDuration != null),
        assert(displayDuration != null);


  @override
  State createState() => new _CarouselState();

}

class _CarouselState extends State<Carousel> with SingleTickerProviderStateMixin {

  PageController _controller;
  Timer _timer;
  int current=0;

  ///Actual index of the displaying Widget

  ///Returns the calculated value of the next index.
  int get nextIndex {
    if(current < widget.childrenCount - 1)
      current++;
    else
      current = 0;

    return current;
  }

  @override
  void initState() {
    super.initState();

    _controller = new PageController();

    startAnimating();
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer?.cancel();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return new PageView(
      pageSnapping: true,
      children: widget.children.map((widget) => new Center(child: widget,)).toList(),
      controller: this._controller,
    );
  }

  void startAnimating() {
    _timer?.cancel();

    //Every widget.displayDuration (time) the tabbar controller will animate to the next index.
    _timer = new Timer.periodic(widget.displayDuration, (_) => this._controller.animateToPage(nextIndex,curve: widget.animationCurve, duration: widget.animationDuration ));
  }

}
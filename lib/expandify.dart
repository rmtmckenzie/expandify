library expandify;

import 'package:flutter/material.dart';

class Expandify extends StatelessWidget {
  ///  Child widget to wrap. Will expand to fill width/height depending on [direction] if smaller
  /// than scroll space.
  final Widget child;

  /// Padding to wrap the child with. Defaults to no padding.
  final EdgeInsetsGeometry? padding;

  /// Direction in which the view should scroll.
  final Axis direction;

  /// Widget which wraps a child to make it expand to fill width or height, or scroll if
  /// child is larger than available space.
  const Expandify({
    super.key,
    required this.child,
    this.direction = Axis.vertical,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    switch (direction) {
      case Axis.vertical:
        return LayoutBuilder(builder: _buildVertical);
      case Axis.horizontal:
        return LayoutBuilder(builder: _buildHorizontal);
    }
  }

  Widget _buildVertical(BuildContext context, BoxConstraints viewportConstraints) {
    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: viewportConstraints.maxHeight,
        ),
        child: IntrinsicHeight(
          child: padding != null ? Padding(padding: padding!, child: child) : child,
        ),
      ),
    );
  }

  Widget _buildHorizontal(BuildContext context, BoxConstraints viewportConstraints) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minWidth: viewportConstraints.maxWidth,
        ),
        child: IntrinsicWidth(
          child: padding != null ? Padding(padding: padding!, child: child) : child,
        ),
      ),
    );
  }
}

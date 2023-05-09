import 'package:flutter/material.dart';

import 'package:matomo_tracker/matomo_tracker.dart';

/// Wrapper around [TraceableClientMixin] to easily track a [child] widget.
class TraceableWidget extends StatefulWidget {
  const TraceableWidget({
    super.key,
    required this.child,
    required this.eventName,
    this.actionName,
    this.widgetId,
    this.path,
    this.tracker,
  });

  /// {@macro traceableClientMixin.actionName}
  final String? actionName;

  /// {@macro traceableClientMixin.eventName}
  final String eventName;

  /// {@macro traceableClientMixin.widgetId}
  final String? widgetId;

  /// {@macro traceableClientMixin.path}
  final String? path;

  /// {@macro traceableClientMixin.tracker}
  final MatomoTracker? tracker;

  final Widget child;

  @override
  State<TraceableWidget> createState() => _TraceableWidgetState();
}

class _TraceableWidgetState extends State<TraceableWidget>
    with TraceableClientMixin {
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  @override
  String get actionName => widget.actionName ?? super.actionName;

  @override
  String get eventName => widget.eventName;

  @override
  String? get widgetId => widget.widgetId;

  @override
  String? get path => widget.path;

  @override
  MatomoTracker get tracker => widget.tracker ?? super.tracker;
}

import 'package:core/data/data.dart';
import 'package:flutter/material.dart';

class LoadingContainer<T> extends StatelessWidget {
  const LoadingContainer({
    super.key,
    required this.data,
    required this.errorBuilder,
    required this.valueBuilder,
  });

  final Data<T> data;
  final WidgetBuilder errorBuilder;
  final Function(BuildContext, T value, bool loading) valueBuilder;

  @override
  Widget build(BuildContext context) {
    final value = data.value;
    return Stack(
      children: [
        if (data.hasError) Positioned.fill(child: errorBuilder(context)),
        if (value != null)
          Positioned.fill(
              child: valueBuilder(
            context,
            value,
            data.loading,
          )),
        if (data.loading)
          const Positioned.fill(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
      ],
    );
  }
}

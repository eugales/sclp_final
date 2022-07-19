import 'package:flutter/material.dart';
import 'package:sclp_final/screens/widgets/theme_widget.dart';

class CircularLoadingWidget extends StatelessWidget {
  const CircularLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: ThemeWidget.instanceOf(context)?.color?.withOpacity(0.9),
        child: const Align(
          alignment: Alignment.center,
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}

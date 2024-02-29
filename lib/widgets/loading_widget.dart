import 'package:banpay/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    super.key,
    required this.isLoading,
    required this.child,
  });

  final bool isLoading;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        child,
        isLoading
            ? Container(
                color: Colors.black54,
              )
            : Container(),
        isLoading
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CircularProgressIndicator(
                    color: Colors.white,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextWidget(
                    text: 'Updating pokemon details...',
                    color: Colors.white,
                    textSize: 18,
                  ),
                ],
              )
            : Container(),
      ],
    );
  }
}

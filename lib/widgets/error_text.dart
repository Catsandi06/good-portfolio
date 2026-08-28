import 'package:flutter/widgets.dart';

class ErrorText extends StatelessWidget {
  const ErrorText({super.key, required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message,
        style: TextStyle(
          color: Color.fromRGBO(250, 10, 30, 1),
          fontSize: 24,
          fontWeight: FontWeight.w600,
          backgroundColor: Color.fromRGBO(251, 249, 250, 1),
        ),
      ),
    );
  }
}

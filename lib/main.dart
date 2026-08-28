import 'package:flutter/material.dart';
import 'package:my_portfolio/widgets/error_text.dart';
import 'package:my_portfolio/widgets/my_colored_box.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Center(child: Text('Cabecera de mi portfolio')),
        ),
        body: Column(
          spacing: 10,
          children: [
            const MyColoredBox(
              width: 330.0,
              color: Color.fromARGB(235, 230, 168, 161),
            ),
            const Row(
              spacing: 2,
              children: [
                MyColoredBox(color: Color.fromARGB(235, 220, 39, 19)),
                MyColoredBox(color: Color.fromARGB(235, 240, 132, 8)),
                MyColoredBox(color: Color.fromARGB(255, 248, 207, 2)),
              ],
            ),
            const ErrorText(message: 'Después de la fila: Hello world!'),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(
                  Icons.favorite,
                  color: Colors.pink,
                  size: 24.0,
                  semanticLabel: 'Text to announce in accessibility modes',
                ),
                Icon(Icons.audiotrack, color: Colors.green, size: 30.0),
                Icon(Icons.beach_access, color: Colors.blue, size: 36.0),
                Icon(
                  Icons.access_alarm_rounded,
                  color: Colors.black,
                  size: 36.0,
                ),
              ],
            ),
            ClipOval(
              child: Image.network(
                'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                width: 100,
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              clipBehavior: Clip.antiAlias,
              child: Image.network('https://picsum.photos/100/100?random=1'),
            ),
            Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.orange, width: 3),
                borderRadius: BorderRadius.circular(20),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(17),
                child: Image.asset(
                  'assets/images/firefox_logo.webp',
                  width: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

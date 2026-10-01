import 'package:flutter/material.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SizedBox(
        height: 100,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.amber
              ),
              child: Center(child: Text("¡Este es mi portfolio!")),
            ), // Cabeso
            Row(
              children: [
                Image.network(
                  "https://images.teamtalk.com/content/uploads/2022/12/14171716/Sofyan-Amrabat-reacting-for-Morocco-at-the-World-Cup.jpg", width: 100,
                ),
                Text(
                  "Soy profe y me gusta mi trabajo aunque a veces me de por enrevesar prácticas para mis queridos alumnos", softWrap: true,
                ),
              ],
            ), // Subcabeso
            Container(), // Cuerpitos
            Row(children: [

            ],), // Fúter de botones
          ],
        ),
      ),
    );
  }
}

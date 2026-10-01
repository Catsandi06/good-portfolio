import 'package:flutter/material.dart';

int opcionBody = 0;
List<String> hobbies = ['Programar', 'Videojuegos', 'Ciclismo', 'Lectura', 'Música', 'Café'];

void main() {
  runApp(const MiPortfolio());
}

class MiPortfolio extends StatefulWidget {
  const MiPortfolio({super.key});

  @override
  _MiPortfolioState createState() => _MiPortfolioState();
}

class _MiPortfolioState extends State<MiPortfolio> {
  @override
  Widget build(BuildContext context) {
    // Malas prácticas: Recomputar dimensiones en cada build
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    // Sin Scaffold: Sin estructura base ni Material de fondo automático
    return 
      MaterialApp(
    home: SafeArea(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            // 1. Cabecera (10%)
            Container(
              height: height * 0.10,
              width: width,
              color: Colors.blue,
              child: Center(
                child: Text(
                  "Este es mi portfolio",
                  // Sin Scaffold/Material, el texto necesita su propia dirección e Icon/Style
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                    fontSize: 20, 
                    color: Colors.white, 
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none, // Evita doble subrayado amarillo
                  ),
                ),
              ),
            ),

            // 2. Subcabecera (10%)
            Container(
              height: height * 0.05,
              width: width,
              color: Colors.grey[200],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage('https://via.placeholder.com/150'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(width: 15), // Mala práctica: Container para espacio
                  Text(
                    "Soy profe y me gusta Dart", 
                    textDirection: TextDirection.ltr,
                    style: TextStyle(fontSize: 16, color: Colors.black, decoration: TextDecoration.none),
                  ),
                ],
              ),
            ),

            // 3. Cuerpo (70%) - Ternario sin Scaffold
            Container(
              height: height * 0.70,
              width: width,
              padding: EdgeInsets.all(10),
              child: opcionBody == 0
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(hobbies[0], textDirection: TextDirection.ltr, style: TextStyle(color: Colors.black, decoration: TextDecoration.none)),
                        Container(height: 10),
                        Text(hobbies[1], textDirection: TextDirection.ltr, style: TextStyle(color: Colors.black, decoration: TextDecoration.none)),
                        Container(height: 10),
                        Text(hobbies[2], textDirection: TextDirection.ltr, style: TextStyle(color: Colors.black, decoration: TextDecoration.none)),
                      ],
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(hobbies[3], textDirection: TextDirection.ltr, style: TextStyle(color: Colors.black, decoration: TextDecoration.none)),
                        Container(height: 10),
                        Text(hobbies[4], textDirection: TextDirection.ltr, style: TextStyle(color: Colors.black, decoration: TextDecoration.none)),
                        Container(height: 10),
                        Text(hobbies[5], textDirection: TextDirection.ltr, style: TextStyle(color: Colors.black, decoration: TextDecoration.none)),
                      ],
                    ),
            ),

            // 4. Botones footer (10%)
            Container(
              height: height * 0.10,
              width: width,
              color: Colors.black12,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Sin Scaffold, los botones necesitan envoltorio Material para los efectos visuales
                  GestureDetector(
                    onTap: () {
                      opcionBody = 0;
                      setState(() {});
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      color: Colors.blue,
                      child: Text("Hobbies 1", textDirection: TextDirection.ltr, style: TextStyle(color: Colors.white, decoration: TextDecoration.none)),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      opcionBody = 1;
                      setState(() {});
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      color: Colors.blue,
                      child: Text("Hobbies 2", textDirection: TextDirection.ltr, style: TextStyle(color: Colors.white, decoration: TextDecoration.none)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    )  );
  }
}
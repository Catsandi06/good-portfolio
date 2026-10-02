import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

int opcionBody = 0;
List<String> hobbies = [
  "Salir a pasear",
  'Programar con Dart',
  'Senderismo',
  'Ir a la playa',
  "Música variadita",
  "Anime",
];

void main() {
  runApp(const MiPortfolio());
}

class MiPortfolio extends StatefulWidget {
  const MiPortfolio({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MiPortfolioState createState() => _MiPortfolioState();
}

class _MiPortfolioState extends State<MiPortfolio> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    var cabeso = Container(
      height: height * 0.05,
        width: width,
          color: Colors.blue,
            child: Center(
              child: Text(
                "Este es mi portfolio",
                textDirection: TextDirection.ltr,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none,
                ),
            ),
        ),
    );

    return MaterialApp(
      home: Container(
        color: Colors.white,
        child: Column(
          children: [
            cabeso,
            Container(
              height: height * 0.15,
              width: width,
              color: Colors.grey[200],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          opcionBody == 1
                              ? "https://images.teamtalk.com/content/uploads/2022/12/14171716/Sofyan-Amrabat-reacting-for-Morocco-at-the-World-Cup.jpg"
                              : "https://forbesme-prestaging-media.s3.us-east-2.amazonaws.com/lists/uploads/2023/11/16065346/Sofyan-Amrabat.jpg",
                        ),
                      ),
                    ),
                  ),
                  Container(width: 15),
                  Expanded(child:                   Text(
                    "Soy profe y me gusta mi trabajo aunque a veces me de por enrevesar prácticas para mis queridos alumnos",
                    textDirection: TextDirection.ltr,
                    style: TextStyle(fontSize: 16, color: Colors.black, decoration: TextDecoration.none
                ),
                            ),
                  ),
                ],
              ),
            ), // Subcabeso
            Container(
              height: height * 0.70,
              width: width,
              padding: EdgeInsets.all(10), child: opcionBody == 0
              ?Row(
                spacing: 50,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                  mainAxisAlignment: MainAxisAlignment.center, children: [
                    CosaRandom(textasion: hobbies[0]),
                    const SizedBox(height: 10),
                    CosaRandom(textasion: hobbies[1]),
                    const SizedBox(height: 10),
                    CosaRandom(textasion: hobbies[2]),
                    const SizedBox(height: 10),
                    CosaRandom(textasion: hobbies[3]),
                    const SizedBox(height: 10),
                    const CosaRandom(textasion: "'los Videojuegos'"),
                    const SizedBox(height: 10),
                    const CosaRandom(textasion: "Domingos de misa"),
                  ],
                ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                        children: [const SizedBox(height: 10),
                          const CosaRandom(textasion: "El monte con lluvia"), const SizedBox(height: 10),
                          CosaRandom(textasion: hobbies[4]), const SizedBox(height: 10),
                          CosaRandom(textasion: hobbies[5]), const SizedBox(height: 10),
                          const CosaRandom(textasion: "Ducharme"), const SizedBox(height: 10),
                          const CosaRandom(textasion: "Ir de cenita romántica"), const SizedBox(height: 10),
                          const CosaRandom(textasion: "Viajar"),
                        ],
                    )
                    ],
                  )
                  : Column(mainAxisAlignment: MainAxisAlignment.spaceAround, crossAxisAlignment: CrossAxisAlignment.center, spacing: 10, 
                  children: [
                    Image.asset(
                      "assets/images/firefox_logo.webp",
                      width: 180,
                      fit: BoxFit.contain,
                    ),     Text(
                        "¡El navegador Firefox mola más!",
                        textDirection: TextDirection.ltr,
                        textAlign: TextAlign.center, 
                        style: const TextStyle(
                          textBaseline: TextBaseline.alphabetic,
                          decoration: TextDecoration.none,
                          fontSize: 30,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                  
                    Center(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(12),
        ),
        child: QrImageView(
          data: "https://github.com/adhernea/",
          version: QrVersions.auto,
          size: 200.0,
          backgroundColor: Colors.white,
          eyeStyle: const QrEyeStyle(
            eyeShape: QrEyeShape.square,
            color: Colors.black,
          ),
          dataModuleStyle: const QrDataModuleStyle(
            dataModuleShape: QrDataModuleShape.square,
            color: Colors.black,
          ),
        ),
      ),
    )
                      ],
                    ),
            ), // Cuerpitos
            Container(height: height * 0.10,width: width,
            color: Colors.black12,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              ClipOval(
                child: GestureDetector(
                  onTap: () {
                    opcionBody = 0; setState(() {});
                  },
                  child: Container(
                    width: 150,
                    height: 60,
                    color: Colors.blue,
                        child: FittedBox(
                        fit: BoxFit.scaleDown,
                    child: Text("Mis jobis", textDirection: TextDirection.ltr,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24, // Pon un tamaño base grande, FittedBox lo encajará
                          decoration: TextDecoration.none,
                        ),
                      ),
                        ),
                      ),
                    ),
                  ),
                  Material(
                    child: GestureDetector(
                    onTap: () {opcionBody = 1;
                    setState(() {});},
                        child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(15),
                        ),
                          child: Text(
                            style: TextStyle(color: Colors.white, decoration: TextDecoration.none),
                            "My repositorio", textDirection: TextDirection.ltr,
                          ),
                        ),
                    ),
                  ),
                ],
              ),
            ), // Fúter de botones
          ],
        ),
      ),
    );
  }
}

class CosaRandom extends StatelessWidget {
final String textasion;

const CosaRandom({super.key, required this.textasion});

  final espaciadosStail = const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0);
  final textoStails = const TextStyle(color: Colors.black, decoration: TextDecoration.none, fontSize: 16);

  @override
  Widget build(BuildContext context) {
     return Container(
  width: 150,height: 50,
      decoration: BoxDecoration(
        color: Colors.blue[50],
        border: Border.all(color: Colors.grey[800]!, width: 2),
      ),
      child: Center(child: Padding(
        padding: espaciadosStail,
          child: FittedBox(fit: BoxFit.scaleDown,
          child: Text(textasion, textDirection: TextDirection.ltr,
          style: textoStails,
          ),
          ),
        ),
      ),
    );
  }
}

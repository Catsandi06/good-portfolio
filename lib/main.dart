import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

const hobbies = [
  'La informática',
  'La música',
  'Los gatos',
  'Las consolas retro',
  'Ser furry',
  'Los coches',
  'La impresión 3D',
  'Los viajes',
];

const watermelonGreen = Color(0xFF2E7D32);
const watermelonLightGreen = Color(0xFFE8F5E9);
const watermelonRed = Color(0xFFE53935);
const watermelonPink = Color(0xFFFFEBEE);

void main() {
  runApp(const MiPortfolio());
}

class MiPortfolio extends StatefulWidget {
  const MiPortfolio({super.key});

  @override
  State<MiPortfolio> createState() => _MiPortfolioState();
}

class _MiPortfolioState extends State<MiPortfolio> {
  int _selectedIndex = 0;

  void _selectSection(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: watermelonGreen,
          primary: watermelonGreen,
          secondary: watermelonRed,
          surface: watermelonLightGreen,
        ),
        scaffoldBackgroundColor: watermelonLightGreen,
        cardTheme: CardThemeData(
          elevation: 3,
          color: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        ),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              const PortfolioHeader(),
              const ProfileSection(),
              Expanded(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 250),
                  child: _selectedIndex == 0
                      ? const HobbiesView(key: ValueKey('hobbies'))
                      : const RepositoryView(key: ValueKey('repository')),
                ),
              ),
              PortfolioNavigation(selectedIndex: _selectedIndex, onSelected: _selectSection),
            ],
          ),
        ),
      ),
    );
  }
}

class PortfolioHeader extends StatelessWidget {
  const PortfolioHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: isLandscape ? 7 : 14),
      decoration: const BoxDecoration(
        color: watermelonGreen,
        border: Border(bottom: BorderSide(color: watermelonRed, width: 5)),
      ),
      child: Text(
        'Este es mi portfolio',
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.titleLarge
            ?.copyWith(color: Theme.of(context).colorScheme.onPrimary, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(isLandscape ? 8 : 16),
      color: watermelonPink,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = isLandscape || constraints.maxWidth >= 520;
          final avatarSize = isLandscape ? 64.0 : 90.0;
          final avatar = ClipOval(
            child: Image.network(
              'https://github.com/Catsandi06.png',
              width: avatarSize,
              height: avatarSize,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return ColoredBox(
                  color: Colors.grey,
                  child: SizedBox(
                    width: avatarSize,
                    height: avatarSize,
                    child: Icon(Icons.person, size: 48, color: Colors.white),
                  ),
                );
              },
            ),
          );
          const description = Text(
            'Soy alumno de 2º DAM y me gusta lo que hago. '
            'Intento hacerlo lo mejor que puedo.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),
          );

          return isWide
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    avatar,
                    SizedBox(width: isLandscape ? 12 : 20),
                    Flexible(child: description),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [avatar, const SizedBox(height: 12), description],
                );
        },
      ),
    );
  }
}

class HobbiesView extends StatelessWidget {
  const HobbiesView({super.key});

  void _openCatMemes(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute<void>(builder: (context) => const CatMemesView()));
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final columns = constraints.maxWidth >= 360 ? 2 : 1;

          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: hobbies.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: columns,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              mainAxisExtent: 76,
            ),
            itemBuilder: (context, index) {
              return HobbyCard(
                text: hobbies[index],
                index: index,
                onTap: hobbies[index] == 'Los gatos' ? () => _openCatMemes(context) : null,
              );
            },
          );
        },
      ),
    );
  }
}

class HobbyCard extends StatelessWidget {
  final String text;
  final int index;
  final VoidCallback? onTap;

  const HobbyCard({super.key, required this.text, required this.index, this.onTap});

  IconData get _icon {
    return switch (text) {
      'La informática' => Icons.computer,
      'La música' => Icons.music_note,
      'Los gatos' => Icons.pets,
      'Las consolas retro' => Icons.sports_esports,
      'Ser furry' => Icons.pets_outlined,
      'Los coches' => Icons.directions_car,
      'La impresión 3D' => Icons.view_in_ar,
      'Los viajes' => Icons.flight,
      _ => Icons.favorite,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      color: index.isEven ? watermelonRed : watermelonGreen,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(18),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          child: Row(
            children: [
              Icon(_icon, color: Colors.white, size: 26),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  text,
                  style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
              if (onTap != null) const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 16),
            ],
          ),
        ),
      ),
    );
  }
}

class CatMemesView extends StatelessWidget {
  const CatMemesView({super.key});

  static const memes = [
    (
      'https://media.giphy.com/media/JIX9t2j0ZTN9S/giphy.gif',
      'Gato programando: cuando el código funciona a la primera',
    ),
    ('https://media.giphy.com/media/5i7umUqAOYYEw/giphy.gif', 'Gato confundido: buscando el bug durante horas'),
    ('https://media.giphy.com/media/7KwCQcpVaMvGo/giphy.gif', 'Gato reclamando sus permisos de administrador'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: watermelonLightGreen,
      appBar: AppBar(
        title: const Text('Memes de gatos'),
        backgroundColor: watermelonGreen,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 560),
            child: Column(
              children: [
                const Text(
                  'El rincón de los gatos programadores',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: watermelonGreen, fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                ...memes.map(
                  (meme) => Card(
                    clipBehavior: Clip.antiAlias,
                    margin: const EdgeInsets.only(bottom: 16),
                    child: Column(
                      children: [
                        Image.network(
                          meme.$1,
                          width: double.infinity,
                          height: 220,
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, progress) {
                            if (progress == null) return child;
                            return const SizedBox(
                              height: 220,
                              child: Center(child: CircularProgressIndicator(color: watermelonRed)),
                            );
                          },
                          errorBuilder: (context, error, stackTrace) => const SizedBox(
                            height: 220,
                            child: Center(child: Icon(Icons.pets, color: watermelonRed, size: 64)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(14),
                          child: Text(
                            meme.$2,
                            textAlign: TextAlign.center,
                            style: const TextStyle(color: watermelonGreen, fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                FilledButton.icon(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.close),
                  label: const Text('Salir'),
                  style: FilledButton.styleFrom(
                    backgroundColor: watermelonRed,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RepositoryView extends StatelessWidget {
  const RepositoryView({super.key});

  @override
  Widget build(BuildContext context) {
    final isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 560),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/Sandi_proto.jpg', width: isLandscape ? 140 : 180, fit: BoxFit.contain),
              const SizedBox(height: 16),
              Text(
                '¡Sandi Proto, el mejor gato programador!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: isLandscape ? 24 : 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(color: watermelonGreen, borderRadius: BorderRadius.circular(12)),
                child: QrImageView(
                  data: 'https://github.com/Catsandi06/',
                  version: QrVersions.auto,
                  size: isLandscape ? 160 : 200,
                  backgroundColor: Colors.white,
                  eyeStyle: QrEyeStyle(eyeShape: QrEyeShape.square, color: Colors.black),
                  dataModuleStyle: QrDataModuleStyle(dataModuleShape: QrDataModuleShape.square, color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PortfolioNavigation extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onSelected;

  const PortfolioNavigation({super.key, required this.selectedIndex, required this.onSelected});

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      backgroundColor: watermelonGreen,
      indicatorColor: watermelonRed,
      labelTextStyle: const WidgetStatePropertyAll(TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      selectedIndex: selectedIndex,
      onDestinationSelected: onSelected,
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.favorite_border),
          selectedIcon: Icon(Icons.favorite),
          label: 'Mis hobbies',
        ),
        NavigationDestination(
          icon: Icon(Icons.folder_outlined),
          selectedIcon: Icon(Icons.folder),
          label: 'Mi repositorio',
        ),
      ],
    );
  }
}

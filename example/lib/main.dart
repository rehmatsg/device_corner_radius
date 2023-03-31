import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:device_corner_radius/device_corner_radius.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {

  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.light,
          seedColor: Colors.deepPurple,
        )
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  BorderRadius radius = BorderRadius.circular(20);

  double padding = 20;

  @override
  void initState() {
    super.initState();
    getBorderRadius();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(15),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: radius - BorderRadius.circular(15),
          border: Border.all(
            color: Theme.of(context).colorScheme.primary,
            width: 3,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Device Corner Radius',
                style: Theme.of(context).textTheme.headlineLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 6),
              Text(
                'This is a sample app that shows how to use the device_corner_radius plugin to get the corner radius of the device.',
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void getBorderRadius() async {
    try {
      final result = await DeviceCornerRadius.getCornerRadius();
      setState(() {
        radius = result;
      });
    } on PlatformException catch (_) {
      // Failed to get radius
    }
  }

}
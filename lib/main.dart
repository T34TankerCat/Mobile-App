import 'dart:convert';

import 'package:caresalesapp/carmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:camera/camera.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'camera_utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CameraUtils.initializeCameras();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: '✬ CAR FOR PEOPLE ✬',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double imageWidthPercentage = 1;

    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 255, 0, 0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 20.0),
              const Text(
                '✬ CAR FOR PEOPLE ✬',
                style: TextStyle(
                  fontSize: 36.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 255, 187, 0),
                  fontStyle: FontStyle
                      .italic, // Set to FontStyle.italic for italic style
                  fontFamily:
                      'Sans-serif', // Replace 'YourFontFamily' with the desired font family
                ),
              ),
              const Text(
                'cheapocars4sale.su',
                style: TextStyle(
                  fontSize: 26.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 255, 187, 0),
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(height: 20.0),
              GestureDetector(
                  onHorizontalDragEnd: (details) {
                    if (details.primaryVelocity! > 0) {
                      _showSwipeAlert(context,
                          'Glorious peoples cars available for purchase 8-4 Mon-Fri');
                    } else if (details.primaryVelocity! < 0) {
                      _showSwipeAlert(context,
                          'Proletarians need their rest during weekend comrade, come back next week');
                    }
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(0.0),
                    child: Image.asset(
                      'assets/car1.jpg',
                      width: screenWidth * imageWidthPercentage,
                      fit: BoxFit.cover,
                    ),
                  )),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: screenWidth * 0.4,
                    padding: const EdgeInsets.all(10.0),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.white, // White border at the bottom
                          width: 2.0,
                        ),
                      ),
                    ),
                    child: const Text(
                      'SALES',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center, // Center-align the text
                    ),
                  ),
                  Container(
                    width: screenWidth * 0.4,
                    padding: const EdgeInsets.all(10.0),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.white, // White border at the bottom
                          width: 2.0,
                        ),
                      ),
                    ),
                    child: const Text(
                      'SERVICE',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center, // Center-align the text
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(
            top: 10.0, bottom: 10.0), // Add top and bottom margins
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 173, 0, 0),
          // Dark grey background for the row
          boxShadow: [
            BoxShadow(
              color: Colors.white,
              blurRadius: 0.0, // Adjust the blur radius as needed
              spreadRadius: 0.7, // Adjust the spread radius as needed
              offset: Offset(0,
                  -2), // Offset for shadow, negative y to place it at the top
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                // Handle home button tap
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CarsPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor:
                    const Color.fromARGB(255, 255, 187, 0), // White text color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  // Rounded corners
                ),
              ),
              child: const Text('Home'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        const CarsPage(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      const begin = Offset(1.0, 0.0);
                      const end = Offset.zero;
                      const curve = Curves.easeInOut;

                      var tween = Tween(begin: begin, end: end)
                          .chain(CurveTween(curve: curve));

                      var offsetAnimation = animation.drive(tween);

                      return SlideTransition(
                          position: offsetAnimation, child: child);
                    },
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: const Color.fromARGB(255, 255, 187, 0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              child: const Text('Cars'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CameraScreen()),
                );

                // Handle contact button tap
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: const Color.fromARGB(255, 255, 187, 0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              child: const Text('Trade-In'),
            ),
            ElevatedButton(
              onPressed: () {
                // Handle admin button tap
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: const Color.fromARGB(255, 255, 187, 0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              child: const Text('Admin'),
            ),
          ],
        ),
      ),
    );
  }
}

// **********************  The second page
class CarsPage extends StatefulWidget {
  const CarsPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CarsPageState createState() => _CarsPageState();
}

class _CarsPageState extends State<CarsPage> {
  List<Car> cars = [];

  @override
  void initState() {
    super.initState();
    loadCars();
  }

  Future<void> loadCars() async {
    final String data =
        await rootBundle.loadString('http://www.bloxlox.net.assets/cars.json');
    final List<dynamic> jsonList = json.decode(data);
    final List<Car> loadedCars =
        jsonList.map((json) => Car.fromJson(json)).toList();

    setState(() {
      cars = loadedCars;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cars Page'),
      ),
      body: ListView.builder(
        itemCount: cars.length,
        itemBuilder: (context, index) {
          final car = cars[index];
          return ListTile(
            title: Text('${car.brand} ${car.model}'),
            leading: Image.asset('assets/${car.image}'),
            // Add more widgets or customize as needed
          );
        },
      ),
    );
  }
}

void _showSwipeAlert(BuildContext context, String alertText) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(alertText),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      );
    },
  );
}

// camera page

// camera_screen.dart
//  _controller = CameraController(CameraUtils.cameras[0], ResolutionPreset.medium);

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    _controller =
        CameraController(CameraUtils.cameras[0], ResolutionPreset.medium);
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _takePicture() async {
    try {
      await _initializeControllerFuture;

      final XFile file = await _controller.takePicture();

      // Save the captured image to the gallery
      await GallerySaver.saveImage(file.path);

      // Show a Thank-You dialog after taking the picture
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Thank You!'),
            content: const Text(
                'Thank you for taking the picture! It has been sent to us for a trade in value. Its Been saved in the gallery too for you to look back. We will be in touch soon'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Close the dialog
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    } catch (e) {
      // print("Error taking or saving picture: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Show Us Your Car'),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return CameraPreview(_controller);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _takePicture,
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}

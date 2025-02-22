
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart' as flutter_gen;
import 'package:myapp/auth/firebase_auth_provider.dart';
import 'package:myapp/bloc/auth_bloc.dart';
import 'package:myapp/bloc/auth_event.dart';
import 'package:myapp/bloc/auth_state.dart';
import 'package:myapp/dash.dart';
import 'package:myapp/email_verification.dart';
import 'package:myapp/forgot_password_view.dart';
import 'package:myapp/loading_screen.dart';
import 'package:myapp/login.dart';
import 'package:myapp/signUp.dart';
import 'package:myapp/splash.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); // Ensures Firebase is initialized properly
  runApp(
    BlocProvider<AuthBloc>(
      create: (context) => AuthBloc(FirebaseAuthProvider())..add(AuthEventInitialize()),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.transparent,
          ),
          supportedLocales: flutter_gen.AppLocalizations.supportedLocales,
          localizationsDelegates: flutter_gen.AppLocalizations.localizationsDelegates,
          debugShowCheckedModeBanner: false,
          home: HomePage(),
        );
      },
    );
  }
}


class GradientBackground extends StatelessWidget {
  final Widget child;
  const GradientBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromRGBO(96, 149, 145, 100), // Top color
            Color.fromRGBO(54, 84, 81, 100),
            Color.fromRGBO(36, 60, 58, 100) // Bottom color
          ],
          stops: [
            0.4,  // Red covers the first 50%
            0.8,  // Blue covers 30% (from 50% to 80%)
            1.0,  // Green covers the last 20% (from 80% to 100%)
          ],
        ),
      ),
      child: child, // Wrap the actual page content
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<AuthBloc>().add(const AuthEventInitialize());
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.isLoading) {
          LoadingScreen().show(
            context: context,
            text: state.loadingText ?? 'Please wait a moment',
          );
        } else {
          LoadingScreen().hide();
        }
      },
      builder: (context, state) {
        if (state is AuthStateOnboarding) {
          return const Splashscreen();
        } else if (state is AuthStateOnboardingComplete) {
          return LoginScreen();
        } else if (state is AuthStateLoggedIn) {
          return HomeScreen(authUser: state.user);
        } else if (state is AuthStateNeedsVerification) {
          return EmailVerificationPage();
        } else if (state is AuthStateLoggedOut) {
          return LoginScreen();
        } else if (state is AuthStateForgotPassword) {
          return const ForgotPasswordView();
        } else if (state is AuthStateRegistering) {
          return SignupPage();
        } else {
          return const Scaffold(
            body: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:flutter_blue_plus/flutter_blue_plus.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:sensors_plus/sensors_plus.dart' show AccelerometerEvent, accelerometerEvents;

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Fitness Band Monitor',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key});

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   FlutterBluePlus flutterBlue = FlutterBluePlus();
//   BluetoothDevice? connectedDevice;
//   List<BluetoothService> services = [];
//   Map<Guid, List<int>> characteristicValues = {};
//   bool isSafe = true;
//   bool sosTriggered = false;
//   List<double>? _accelerometerValues;
//   StreamSubscription<AccelerometerEvent>? _accelerometerStream;
//   BluetoothState bluetoothState = BluetoothState.unknown;
//   StreamSubscription<BluetoothState>? _bluetoothStateSubscription;
//   String connectionStatus = "Not Connected";

//   @override
//   void initState() {
//     super.initState();
//     _checkPermissions();
//     _startAccelerometer();
//     _listenBluetoothState();
//   }

//   @override
//   void dispose() {
//     _accelerometerStream?.cancel();
//     _bluetoothStateSubscription?.cancel();
//     super.dispose();
//   }

//   Future<void> _checkPermissions() async {
//     Map<Permission, PermissionStatus> statuses = await [
//       Permission.bluetooth,
//       Permission.bluetoothConnect,
//       Permission.bluetoothScan,
//       Permission.location,
//     ].request();

//     if (statuses[Permission.bluetooth] != PermissionStatus.granted ||
//         statuses[Permission.bluetoothConnect] != PermissionStatus.granted ||
//         statuses[Permission.bluetoothScan] != PermissionStatus.granted ||
//         statuses[Permission.location] != PermissionStatus.granted) {
//       print("Bluetooth or Location permissions denied.");
//       return;
//     }
//   }

//   void _listenBluetoothState() {
//     _bluetoothStateSubscription = FlutterBluePlus.state.listen((state) {
//       setState(() {
//         bluetoothState = state as BluetoothState;
//       });
//     }) as StreamSubscription<BluetoothState>?;
//   }

//   Future<void> _startScan() async {
//     if (bluetoothState != BluetoothState.on) {
//       print("Bluetooth is not enabled.");
//       return;
//     }
//     setState(() {
//       connectedDevice = null;
//       services = [];
//       characteristicValues = {};
//       connectionStatus = "Scanning...";
//     });

//     FlutterBluePlus.startScan(timeout: Duration(seconds: 4));

//     FlutterBluePlus.scanResults.listen((results) {
//       for (ScanResult r in results) {
//         if (r.device.name.isNotEmpty &&
//             r.device.name.toLowerCase().contains('fitness')) {
//           _connectToDevice(r.device);
//           FlutterBluePlus.stopScan();
//           return;
//         }
//       }
//     });

//     FlutterBluePlus.stopScan();
//     if (connectedDevice == null) {
//       setState(() {
//         connectionStatus = "Scan finished, device not found";
//       });
//     }
//   }

//   Future<void> _connectToDevice(BluetoothDevice device) async {
//     try {
//       setState(() {
//         connectionStatus = "Connecting...";
//       });
//       await device.connect();
//       setState(() {
//         connectedDevice = device;
//         connectionStatus = "Connected";
//       });
//       device.state.listen((state) {
//         if (state == BluetoothDeviceState.disconnected) {
//           setState(() {
//             connectedDevice = null;
//             connectionStatus = "Disconnected";
//           });
//         }
//         if (state == BluetoothDeviceState.connected && services.isEmpty) {
//           _discoverServices(device);
//         }
//       });
//       _discoverServices(device);
//     } catch (e) {
//       print("Error connecting to device: $e");
//       setState(() {
//         connectionStatus = "Connection Error";
//       });
//     }
//   }

//   Future<void> _discoverServices(BluetoothDevice device) async {
//     try {
//       services = await device.discoverServices();
//       setState(() {
//         services = services;
//       });
//       _readCharacteristics();
//     } catch (e) {
//       print("Error discovering services: $e");
//     }
//   }

//   Future<void> _readCharacteristics() async {
//     if (connectedDevice == null) return;

//     for (BluetoothService service in services) {
//       for (BluetoothCharacteristic characteristic in service.characteristics) {
//         try {
//           if (characteristic.properties.read) {
//             List<int> value = await characteristic.read();
//             setState(() {
//               characteristicValues[characteristic.uuid] = value;
//             });
//             _processHealthData(characteristic.uuid, value);
//           }
//           if (characteristic.properties.notify) {
//             await characteristic.setNotifyValue(true);
//             characteristic.value.listen((value) {
//               setState(() {
//                 characteristicValues[characteristic.uuid] = value;
//               });
//               _processHealthData(characteristic.uuid, value);
//             });
//           }
//         } catch (e) {
//           print("Error reading characteristic: $e");
//         }
//       }
//     }
//   }

//   void _processHealthData(Guid uuid, List<int> value) {
//     if (uuid == Guid("00002a37-0000-1000-8000-00805f9b34fb")) {
//       int heartRate = value[1];
//       print("Heart Rate: $heartRate");
//       // Add logic to display heart rate in your app.
//     }
//     // Add more logic for other characteristics (steps, oxygen, etc.)
//   }

//   void _startAccelerometer() {
//     _accelerometerStream = accelerometerEvents.listen((AccelerometerEvent event) {
//       setState(() {
//         _accelerometerValues = <double>[event.x, event.y, event.z];
//       });
//       _checkFallDetection();
//     });
//   }

//   void _checkFallDetection() {
//     if (_accelerometerValues == null) return;
//     double x = _accelerometerValues![0];
//     double y = _accelerometerValues![1];
//     double z = _accelerometerValues![2];
//     double magnitude = x * x + y * y + z * z;

//     if (magnitude < 1 && !sosTriggered) {
//       Future.delayed(Duration(seconds: 2), () {
//         if (magnitude < 1 && !sosTriggered) {
//           setState(() {
//             isSafe = false;
//             sosTriggered = true;
//           });
//           _triggerSOS();
//         }
//       });
//     } else if (magnitude > 200 && sosTriggered) {
//       setState(() {
//         isSafe = false;
//         sosTriggered = true;
//       });
//       _triggerSOS();
//     } else {
//       setState(() {
//         isSafe = true;
//       });
//     }
//   }

//   void _triggerSOS() {
//     print("SOS Triggered!");
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text("Emergency!"),
//         content: Text("An accident has been detected. Help is on the way."),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: Text("OK"),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Fitness Band Monitor'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text('Bluetooth State: $bluetoothState'),
//             Text('Connection Status: $connectionStatus'),
//             if (connectedDevice != null)
//               Text('Device Name: ${connectedDevice!.name}'),
//             if (!isSafe)
//               Text(
//                 'Danger!',
//                 style: TextStyle(color: Colors.red, fontSize: 24),
//               ),
//             ElevatedButton(
//               onPressed: _startScan,
//               child: Text('Scan and Connect'),
//             ),
//             if (_accelerometerValues != null)
//               Text(
//                   'Accelerometer: ${_accelerometerValues!.map((v) => v.toStringAsFixed(2)).join(', ')}'),
//           ],
//         ),
//       ),
//     );
//   }
// }
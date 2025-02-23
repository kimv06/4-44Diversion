import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:html' as html;

class SOSDetector extends StatefulWidget {
  @override
  _SOSDetectorState createState() => _SOSDetectorState();
}

class _SOSDetectorState extends State<SOSDetector> {
  List<String> emergencyContacts = [];
  final TextEditingController _contactController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadContacts();
  }

  void _loadContacts() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      emergencyContacts = prefs.getStringList('emergencyContacts') ?? [];
    });
  }

  void _saveContacts() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('emergencyContacts', emergencyContacts);
  }

  void _sendSOSMessage() {
    String message = "SOS! I need help!";
    for (String contact in emergencyContacts) {
      // For web, we'll just open the default email client
      final Uri emailLaunchUri = Uri(
        scheme: 'mailto',
        path: contact,
        query: encodeQueryParameters(<String, String>{
          'subject': 'SOS Message',
          'body': message
        }),
      );
      html.window.open(emailLaunchUri.toString(), 'mail');
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('SOS message prepared for emergency contacts')),
    );
  }

  String encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  void _addContact() {
    if (_contactController.text.isNotEmpty) {
      setState(() {
        emergencyContacts.add(_contactController.text);
        _contactController.clear();
      });
      _saveContacts();
    }
  }

  void _removeContact(int index) {
    setState(() {
      emergencyContacts.removeAt(index);
    });
    _saveContacts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SOS Detector'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Click the SOS button to send an emergency message.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _sendSOSMessage,
              child: Text('SOS'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: EdgeInsets.symmetric(vertical: 20),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Emergency Contacts:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: emergencyContacts.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(emergencyContacts[index]),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => _removeContact(index),
                    ),
                  );
                },
              ),
            ),
            TextField(
              controller: _contactController,
              decoration: InputDecoration(
                labelText: 'Add Emergency Contact (Email)',
                suffixIcon: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: _addContact,
                ),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
          ],
        ),
      ),
    );
  }
}

// ignore_for_file: deprecated_member_use

// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:flutter_blue_plus/flutter_blue_plus.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:sensors_plus/sensors_plus.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Wristband Monitor',
//       theme: ThemeData(
//         primarySwatch: Colors.red,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
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
//   List<double>? _gyroscopeValues;
//   StreamSubscription<GyroscopeEvent>? _gyroscopeStream;
//   BluetoothAdapterState bluetoothState = BluetoothAdapterState.unknown;
//   StreamSubscription<BluetoothAdapterState>? _bluetoothStateSubscription;
//   String connectionStatus = "Not Connected";

//   @override
//   void initState() {
//     super.initState();
//     _checkPermissions();
//     _startGyroscope();
//     _listenBluetoothState();
//   }

//   @override
//   void dispose() {
//     _gyroscopeStream?.cancel();
//     _bluetoothStateSubscription?.cancel();
//     super.dispose();
//   }

//   Future<void> _checkPermissions() async {
//     await [
//       Permission.bluetooth,
//       Permission.bluetoothConnect,
//       Permission.bluetoothScan,
//       Permission.locationWhenInUse,
//     ].request();

//     if (await Permission.bluetooth.request().isGranted &&
//         await Permission.bluetoothConnect.request().isGranted &&
//         await Permission.bluetoothScan.request().isGranted &&
//         await Permission.locationWhenInUse.request().isGranted) {
//       print("All Bluetooth permissions granted!");
//     } else {
//       print("Bluetooth or Location permissions denied.");
//     }
//   }

//   void _listenBluetoothState() {
//     _bluetoothStateSubscription = FlutterBluePlus.adapterState.listen((state) {
//       setState(() {
//         bluetoothState = state;
//       });
//     });
//   }

//   Future<void> _startScan() async {
//     if (bluetoothState != BluetoothAdapterState.on) {
//       print("Bluetooth is not enabled.");
//       await FlutterBluePlus.turnOn();
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
//             r.device.name.toLowerCase().contains('wrist')) {
//           _connectToDevice(r.device);
//           FlutterBluePlus.stopScan();
//           return;
//         }
//       }
//     });

//     Future.delayed(Duration(seconds: 4), () {
//       if (connectedDevice == null) {
//         setState(() {
//           connectionStatus = "Scan finished, device not found";
//         });
//       }
//     });
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
//     // Implement health data processing here.
//     // Example: Heart rate or other data.
//     if (uuid == Guid("00002a37-0000-1000-8000-00805f9b34fb")) {
//       int heartRate = value[1];
//       if (heartRate > 150) {
//         setState(() {
//           isSafe = false;
//           sosTriggered = true;
//         });
//         _triggerSOS();
//       }
//       print("Heart Rate: $heartRate");
//     }
//   }

//   void _startGyroscope() {
//     _gyroscopeStream = gyroscopeEvents.listen((GyroscopeEvent event) {
//       setState(() {
//         _gyroscopeValues = <double>[event.x, event.y, event.z];
//       });
//       _checkGyroscopeData();
//     });
//   }

//   void _checkGyroscopeData() {
//     if (_gyroscopeValues == null) return;
//     double x = _gyroscopeValues![0];
//     double y = _gyroscopeValues![1];
//     double z = _gyroscopeValues![2];

//     double magnitude = x * x + y * y + z * z;

//     if (magnitude > 10 && !sosTriggered) {
//       // Adjust threshold as needed
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
//         content: Text("An emergency has been detected. Help is on the way."),
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
//         title: Text('Wristband Monitor'),
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
//                 'Emergency!',
//                 style: TextStyle(color: Colors.red, fontSize: 24),
//               ),
//             if (isSafe)
//               Text(
//                 'All Safe',
//                 style: TextStyle(color: Colors.green, fontSize: 24),
//               ),
//             ElevatedButton(
//               onPressed: _startScan,
//               child: Text('Scan and Connect'),
//             ),
//             if (_gyroscopeValues != null)
//               Text(
//                   'Gyroscope: ${_gyroscopeValues!.map((v) => v.toStringAsFixed(2)).join(', ')}'),
//           ],
//         ),
//       ),
//     );
//   }
// }

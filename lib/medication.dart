import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import 'package:flutter_tts/flutter_tts.dart';

void main() {
  runApp(MedicationReminderApp());
}

class MedicationReminderApp extends StatelessWidget {
  const MedicationReminderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Medication Reminder',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MedicationReminderPage(),
    );
  }
}

class MedicationReminderPage extends StatefulWidget {
  const MedicationReminderPage({super.key});

  @override
  _MedicationReminderPageState createState() => _MedicationReminderPageState();
}

class _MedicationReminderPageState extends State<MedicationReminderPage> {
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  final FlutterTts _flutterTts = FlutterTts(); // Initialize text-to-speech

  final TextEditingController _medicineNameController = TextEditingController();
  final TextEditingController _dosageController = TextEditingController();
  String _medicineType = 'Pills';

  @override
  void initState() {
    super.initState();
    tz.initializeTimeZones(); // Initialize timezone data
    _initializeNotifications();
  }

  Future<void> _initializeNotifications() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon');

    final InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);

    await _flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<void> _scheduleNotification(String title, String body, tz.TZDateTime scheduledTime) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails('medication_channel', 'Medication Reminders',
            channelDescription: 'Channel for medication reminders',
            importance: Importance.max,
            priority: Priority.high,
            showWhen: false);
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    await _flutterLocalNotificationsPlugin.zonedSchedule(
      0,
      title,
      body,
      scheduledTime,
      platformChannelSpecifics,
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime, androidScheduleMode:  AndroidScheduleMode.inexact,
    );

    // Speak the reminder
    await _flutterTts.speak("Take your medicine");
  }

  void _setReminders() {
    String medicineName = _medicineNameController.text;
    String dosage = _dosageController.text;

    if (medicineName.isEmpty || dosage.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill in all fields')),
      );
      return;
    }

    DateTime now = DateTime.now();
    DateTime scheduledTime = DateTime(now.year, now.month, now.day, 14, 0); // Example time

    // Convert DateTime to TZDateTime
    final tz.TZDateTime tzScheduledTime = tz.TZDateTime.from(scheduledTime, tz.local);

    // Schedule reminders
    _scheduleNotification('Time to take your medicine!',
        '$medicineName - $dosage mg', tzScheduledTime);
    _scheduleNotification('Reminder: $medicineName in 15 minutes',
        '$medicineName - $dosage mg', tzScheduledTime.subtract(Duration(minutes: 15)));
    _scheduleNotification('Reminder: $medicineName in 10 minutes',
        '$medicineName - $dosage mg', tzScheduledTime.subtract(Duration(minutes: 10)));

    ScaffoldMessenger.of(context).showSnackBar; SnackBar(content: Text('Reminders set for $medicineName'));

    // Clear input fields
    _medicineNameController.clear();
    _dosageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Medication'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _medicineNameController,
              decoration: InputDecoration(labelText: 'Medicine Name'),
            ),
            TextField(
              controller: _dosageController,
              decoration: InputDecoration(labelText: 'Dosage (mg)'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16.0), // Add some space
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: DropdownButtonFormField<String>(
                value: _medicineType,
                decoration: InputDecoration(
                  labelText: 'Medicine Type',
                  border: InputBorder.none,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    _medicineType = newValue!;
                  });
                },
                items: <String>['Pills', 'Tablets', 'Syringe', 'Bottles']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 20.0), // Add some space
            ElevatedButton(
              onPressed: _setReminders,
              child: Text('Confirm'),
            ),
          ],
        ),
      ),
    );
  }
}
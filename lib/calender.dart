// // import 'package:flutter/material.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:table_calendar/table_calendar.dart';
// import 'package:timezone/timezone.dart' as tz;
// import 'package:timezone/data/latest.dart' as tz;
// import 'package:intl/intl.dart';


// class AppointmentSchedulerApp extends StatelessWidget {
//   const AppointmentSchedulerApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Appointment Scheduler',
//       theme: ThemeData(
//         primarySwatch: Colors.teal,
//         scaffoldBackgroundColor: Colors.grey[100],
//         appBarTheme: const AppBarTheme(
//           backgroundColor: Colors.teal,
//           titleTextStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//         ),
//         elevatedButtonTheme: ElevatedButtonThemeData(
//           style: ElevatedButton.styleFrom(
//             backgroundColor: Colors.teal,
//             foregroundColor: Colors.white,
//           ),
//         ),
//         textTheme: Typography.englishLike2018.apply(
//           bodyColor: Colors.black87,
//           displayColor: Colors.black87,
//         ),
//       ),
//       home: const AppointmentScheduler(),
//     );
//   }
// }

// class AppointmentScheduler extends StatefulWidget {
//   const AppointmentScheduler({super.key});

//   @override
//   _AppointmentSchedulerState createState() => _AppointmentSchedulerState();
// }

// class _AppointmentSchedulerState extends State<AppointmentScheduler> {
//   late final FlutterLocalNotificationsPlugin _notificationsPlugin;
//   DateTime selectedDate = DateTime.now();
//   TimeOfDay selectedTime = TimeOfDay.now();
//   String appointmentTitle = '';
//   CalendarFormat _calendarFormat = CalendarFormat.month;

//   @override
//   void initState() {
//     super.initState();
//     _notificationsPlugin = FlutterLocalNotificationsPlugin();
//     _initializeNotifications();
//   }

//   Future<void> _initializeNotifications() async {
//     const AndroidInitializationSettings initializationSettingsAndroid =
//         AndroidInitializationSettings('@mipmap/ic_launcher');

//     const InitializationSettings initializationSettings =
//         InitializationSettings(android: initializationSettingsAndroid);

//     await _notificationsPlugin.initialize(initializationSettings);
//   }

//   Future<void> _scheduleNotification(DateTime dateTime, String message) async {
//     final tz.TZDateTime scheduledDateTime = tz.TZDateTime.from(dateTime, tz.local);
//     int notificationId = dateTime.millisecondsSinceEpoch ~/ 1000; // Unique ID

//     const AndroidNotificationDetails androidPlatformChannelSpecifics =
//         AndroidNotificationDetails(
//       'appointment_channel',
//       'Appointment Notifications',
//       channelDescription: 'Notifications for scheduled appointments',
//       importance: Importance.max,
//       priority: Priority.high,
//       showWhen: true,
//     );

//     const NotificationDetails platformChannelSpecifics =
//         NotificationDetails(android: androidPlatformChannelSpecifics);

//     await _notificationsPlugin.zonedSchedule(
//       notificationId, // Unique ID to allow multiple notifications
//       'Appointment Reminder',
//       message,
//       scheduledDateTime,
//       platformChannelSpecifics,
//       androidAllowWhileIdle: true,
//       uiLocalNotificationDateInterpretation:
//           UILocalNotificationDateInterpretation.absoluteTime,
//     );
//   }

//   void _scheduleAppointment() {
//     if (appointmentTitle.isNotEmpty) {
//       final DateTime appointmentDateTime = DateTime(
//         selectedDate.year,
//         selectedDate.month,
//         selectedDate.day,
//         selectedTime.hour,
//         selectedTime.minute,
//       );

//       if (appointmentDateTime.isAfter(DateTime.now())) {
//         final DateTime reminderOneDayBefore = appointmentDateTime.subtract(const Duration(days: 1));
//         final DateTime reminderSixHoursBefore = appointmentDateTime.subtract(const Duration(hours: 6));

//         if (reminderOneDayBefore.isAfter(DateTime.now())) {
//           _scheduleNotification(reminderOneDayBefore, 'Reminder: $appointmentTitle is tomorrow!');
//         }
//         if (reminderSixHoursBefore.isAfter(DateTime.now())) {
//           _scheduleNotification(reminderSixHoursBefore, 'Reminder: $appointmentTitle in 6 hours!');
//         }

//         _scheduleNotification(appointmentDateTime, 'It’s time for your appointment: $appointmentTitle.');

//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Appointment scheduled for $appointmentTitle')),
//         );

//         setState(() {
//           appointmentTitle = ''; // ✅ Clear after showing message
//         });
//       } else {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Appointment time must be in the future.')),
//         );
//       }
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Please enter an appointment title.')),
//       );
//     }
//   }

//   Future<void> _selectDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: selectedDate,
//       firstDate: DateTime.now(),
//       lastDate: DateTime.now().add(const Duration(days: 365)),
//       builder: (BuildContext context, Widget? child) {
//         return Theme(
//           data: ThemeData.light().copyWith(
//             colorScheme: ColorScheme.light(
//               primary: Colors.teal,
//               onPrimary: Colors.white,
//               surface: Colors.white,
//               onSurface: Colors.black,
//             ),
//             textButtonTheme: TextButtonThemeData(
//               style: TextButton.styleFrom(
//                 foregroundColor: Colors.teal,
//               ),
//             ),
//           ),
//           child: child!,
//         );
//       },
//     );
//     print(picked);
//     if (picked != null && picked != selectedDate) {
//       setState(() {
//         selectedDate = picked;
//       });
//     }
//   }

//   Future<void> _selectTime(BuildContext context) async {
//     final TimeOfDay? picked = await showTimePicker(
//       context: context,
//       initialTime: selectedTime,
//       builder: (BuildContext context, Widget? child) {
//         return Theme(
//           data: ThemeData.light().copyWith(
//             colorScheme: ColorScheme.light(
//               primary: Colors.teal,
//               onPrimary: Colors.white,
//               surface: Colors.white,
//               onSurface: Colors.black,
//             ),
//             textButtonTheme: TextButtonThemeData(
//               style: TextButton.styleFrom(
//                 foregroundColor: Colors.teal,
//               ),
//             ),
//           ),
//           child: child!,
//         );
//       },
//     );
//     print(picked);
//     if (picked != null && picked != selectedTime) {
//       setState(() {
//         selectedTime = picked;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Appointment Scheduler'),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TableCalendar(
//               focusedDay: selectedDate,
//               firstDay: DateTime.now(),
//               lastDay: DateTime.now().add(const Duration(days: 365)),
//               calendarFormat: _calendarFormat,
//               onDaySelected: (day, _) {
//                 setState(() {
//                   selectedDate = day;
//                 });
//               },
//             ),
//             const SizedBox(height: 16),
//             TextField(
//               decoration: const InputDecoration(labelText: 'Appointment Title', border: OutlineInputBorder()),
//               onChanged: (value) => appointmentTitle = value,
//             ),
//             const SizedBox(height: 16),
//             ElevatedButton(onPressed: () => _selectDate(context), child: Text('Select Date: ${DateFormat('yyyy-MM-dd').format(selectedDate)}')),
//             const SizedBox(height: 16),
//             ElevatedButton(onPressed: () => _selectTime(context), child: Text('Select Time: ${selectedTime.format(context)}')),
//             const SizedBox(height: 16),
//             ElevatedButton(onPressed: _scheduleAppointment, child: const Text('Schedule Appointment')),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:flutter_tts/flutter_tts.dart';
// import 'package:table_calendar/table_calendar.dart';
// import 'package:timezone/timezone.dart' as tz;
// import 'package:timezone/data/latest.dart' as tz;

// void main() {
//   runApp(const AppointmentSchedulerApp());
// }

// class AppointmentSchedulerApp extends StatelessWidget {
//   const AppointmentSchedulerApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Appointment Scheduler',
//       theme: ThemeData.dark().copyWith(
//         primaryColor: Colors.teal,
//         scaffoldBackgroundColor: Colors.black,
//       ),
//       home: const AppointmentScheduler(),
//     );
//   }
// }

// class AppointmentScheduler extends StatefulWidget {
//   const AppointmentScheduler({super.key});

//   @override
//   _AppointmentSchedulerState createState() => _AppointmentSchedulerState();
// }

// class _AppointmentSchedulerState extends State<AppointmentScheduler> {
//   late final FlutterLocalNotificationsPlugin _notificationsPlugin;
//   late final FlutterTts _flutterTts;
//   DateTime selectedDate = DateTime.now();
//   TimeOfDay selectedTime = TimeOfDay.now();
//   String appointmentTitle = '';
//   //CalendarFormat_calendarFormat = CalendarFormat.month;

//   @override
//   void initState() {
//     super.initState();
//     tz.initializeTimeZones(); // Initialize timezone data
//     _initializeNotifications();
//     _flutterTts = FlutterTts(); // Initialize text-to-speech
//   }

//   Future<void> _initializeNotifications() async {
//     _notificationsPlugin = FlutterLocalNotificationsPlugin();
//     const AndroidInitializationSettings initializationSettingsAndroid =
//         AndroidInitializationSettings('@mipmap/ic_launcher');

//     const InitializationSettings initializationSettings =
//         InitializationSettings(android: initializationSettingsAndroid);

//     await _notificationsPlugin.initialize(initializationSettings);
//   }

//   Future<void> _scheduleNotification(DateTime dateTime) async {
//     final tz.TZDateTime scheduledDateTime = tz.TZDateTime.from(dateTime, tz.local);
//     int notificationID = dateTime.millisecondsSinceEpoch~/1000;
//     const AndroidNotificationDetails androidPlatformChannelSpecifics =
//         AndroidNotificationDetails(
//       'appointment_channel',
//       'Appointment Notifications',
//       channelDescription: 'Notifications for scheduled appointments',
//       importance: Importance.max,
//       priority: Priority.high,
//       showWhen: true,
//     );

//     const NotificationDetails platformChannelSpecifics =
//         NotificationDetails(android: androidPlatformChannelSpecifics);

//     await _notificationsPlugin.zonedSchedule(
//       notificationID,
//       'Appointment Reminder',
//       'You have an appointment scheduled!',
//       scheduledDateTime,
//       platformChannelSpecifics,
//       androidAllowWhileIdle: true,
//       uiLocalNotificationDateInterpretation:
//           UILocalNotificationDateInterpretation.absoluteTime,
//     );

//     // Speak the reminder
//     await _flutterTts.speak('You have an appointment scheduled for $appointmentTitle at ${selectedTime.format(context)} on ${selectedDate.toLocal()}');
//   }

//   void _onDaySelected(DateTime day, DateTime focusedDay) {
//     setState(() {
//       selectedDate = day;
//     });
//   }

//   Future<void> _selectTime(BuildContext context) async {
//     final TimeOfDay? picked = await showTimePicker(
//       context: context,
//       initialTime: selectedTime,
//     );
//     if (picked != null && picked != selectedTime) {
//       setState(() {
//         selectedTime = picked;
//       });
//     }
//   }

//   void _scheduleAppointment() {
//     if (appointmentTitle.isNotEmpty) {
//       final DateTime appointmentDateTime = DateTime(
//         selectedDate.year,
//         selectedDate.month,
//         selectedDate.day,
//         selectedTime.hour,
//         selectedTime.minute,
//       );

//       // Schedule notification 6 hours before the appointment
//       _scheduleNotification(appointmentDateTime.subtract(const Duration(hours: 6)));

//       // Schedule notification at the appointment time
//       _scheduleNotification(appointmentDateTime);

//       // Clear the input
//       setState(() {
//         appointmentTitle = '';
//       });

//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Appointment scheduled for $appointmentTitle')),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Appointment Scheduler'),
//       ),
//       body: SingleChildScrollView( // Wrap the Column with SingleChildScrollView
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             children: [
//               TableCalendar(
//                 focusedDay: selectedDate,
//                 firstDay: DateTime.now(),
//                 lastDay: DateTime.now().add(const Duration(days: 365)),
//                 onDaySelected: _onDaySelected,
//                 calendarStyle: CalendarStyle(
//                   selectedDecoration: BoxDecoration(
//                     color: Colors.teal,
//                     shape: BoxShape.circle,
//                   ),
//                   todayDecoration: BoxDecoration(
//                     color: Colors.teal.shade200,
//                     shape: BoxShape.circle,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               TextField(
//                 decoration: const InputDecoration(
//                   labelText: 'Appointment Title',
//                   border: OutlineInputBorder(),
//                 ),
//                 onChanged: (value) {
//                   appointmentTitle = value;
//                 },
//               ),
//               const SizedBox(height: 16),
//               ElevatedButton(
//                 onPressed: () => _selectTime(context),
//                 child: Text('Select Time: ${selectedTime.format(context)}'),
//               ),
//               const SizedBox(height: 16),
//               ElevatedButton(
//                 onPressed: _scheduleAppointment,
//                 child: const Text('Schedule Appointment'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import 'package:intl/intl.dart';
import 'package:flutter_tts/flutter_tts.dart';

void main() {
  tz.initializeTimeZones();
  runApp(const AppointmentSchedulerApp());
}

class AppointmentSchedulerApp extends StatelessWidget {
  const AppointmentSchedulerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Appointment Scheduler',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: Colors.grey[100],
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.teal,
          titleTextStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.teal,
            foregroundColor: Colors.white,
          ),
        ),
        textTheme: Typography.englishLike2018.apply(
          bodyColor: Colors.black87,
          displayColor: Colors.black87,
        ),
      ),
      home: const AppointmentScheduler(),
    );
  }
}

class AppointmentScheduler extends StatefulWidget {
  const AppointmentScheduler({super.key});

  @override
  _AppointmentSchedulerState createState() => _AppointmentSchedulerState();
}

class _AppointmentSchedulerState extends State<AppointmentScheduler> {
  late final FlutterLocalNotificationsPlugin _notificationsPlugin;
  late final FlutterTts _flutterTts;
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  String appointmentTitle = '';
  final CalendarFormat _calendarFormat = CalendarFormat.month;

  @override
  void initState() {
    super.initState();
    _notificationsPlugin = FlutterLocalNotificationsPlugin();
    _flutterTts = FlutterTts(); // Initialize text-to-speech
    _initializeNotifications();
  }

  Future<void> _initializeNotifications() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);

    await _notificationsPlugin.initialize(initializationSettings);
  }

  Future<void> _scheduleNotification(DateTime dateTime, String message) async {
    final tz.TZDateTime scheduledDateTime = tz.TZDateTime.from(dateTime, tz.local);
    int notificationId = dateTime.millisecondsSinceEpoch ~/ 1000; // Unique ID

    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'appointment_channel',
      'Appointment Notifications',
      channelDescription: 'Notifications for scheduled appointments',
      importance: Importance.max,
      priority: Priority.high,
      showWhen: true,
    );

    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await _notificationsPlugin.zonedSchedule(
      notificationId, // Unique ID to allow multiple notifications
      'Appointment Reminder',
      message,
      scheduledDateTime,
      platformChannelSpecifics,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime, androidScheduleMode: AndroidScheduleMode.inexact,
    );

    // Use text-to-speech to speak the reminder message
    await _flutterTts.speak(message);
  }

  void _scheduleAppointment() {
    if (appointmentTitle.isNotEmpty) {
      final DateTime appointmentDateTime = DateTime(
        selectedDate.year,
        selectedDate.month,
        selectedDate.day,
        selectedTime.hour,
        selectedTime.minute,
      );

      if (appointmentDateTime.isAfter(DateTime.now())) {
        final DateTime reminderOneDayBefore = appointmentDateTime.subtract(const Duration(days: 1));
        final DateTime reminderSixHoursBefore = appointmentDateTime.subtract(const Duration(hours: 6));

        if (reminderOneDayBefore.isAfter(DateTime.now())) {
          _scheduleNotification(reminderOneDayBefore, 'Reminder: $appointmentTitle is tomorrow!');
        }
        if (reminderSixHoursBefore.isAfter(DateTime.now())) {
          _scheduleNotification(reminderSixHoursBefore, 'Reminder: $appointmentTitle in 6 hours!');
        }

        _scheduleNotification(appointmentDateTime, 'It’s time for your appointment: $appointmentTitle.');

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Appointment scheduled for $appointmentTitle')),
        );

        setState(() {
          appointmentTitle = ''; // ✅ Clear after showing message
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Appointment time must be in the future.')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter an appointment title.')),
      );
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.teal,
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: Colors.black,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Colors.teal,
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    print(picked);
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.teal,
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: Colors.black,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Colors.teal,
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    print(picked);
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appointment Scheduler'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TableCalendar(
              focusedDay: selectedDate,
              firstDay: DateTime.now(),
              lastDay: DateTime.now().add(const Duration(days: 365)),
              calendarFormat: _calendarFormat,
              onDaySelected: (day, _) {
                setState(() {
                  selectedDate = day;
                });
              },
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: const InputDecoration(labelText: 'Appointment Title', border: OutlineInputBorder()),
              onChanged: (value) => appointmentTitle = value,
            ),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: () => _selectDate(context), child: Text('Select Date: ${DateFormat('yyyy-MM-dd').format(selectedDate)}')),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: () => _selectTime(context), child: Text('Select Time: ${selectedTime.format(context)}')),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: _scheduleAppointment, child: const Text('Schedule Appointment')),
          ],
        ),
     ),
    );  
  }
}
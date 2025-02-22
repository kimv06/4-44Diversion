import 'package:flutter/material.dart';
import 'package:myapp/auth/auth_user.dart';
import 'package:myapp/calender.dart';
import 'package:myapp/chatbot.dart';
import 'package:myapp/games.dart';
import 'package:myapp/main.dart';
import 'package:myapp/medication.dart';
import 'package:myapp/social.dart';
import 'package:myapp/sos.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatelessWidget {
  final AuthUser? authUser; // Store the username

  const HomeScreen({super.key, required this.authUser,});

  @override
  Widget build(BuildContext context) {
    return GradientBackground(
      child: Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        //   title: Text(AppLocalizations.of(context)!.multiLanguage),
        //),
        body: SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  // Header
                  Container(
                    padding: const EdgeInsets.all(16),
                    color: const Color(0xFF5F9EA0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Icon(Icons.person, color: Colors.grey),
                            ),
                            const SizedBox(width: 12),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Hello, Moumita', // Use the username variable
                                  style: const TextStyle(color: Colors.white),
                                ),
                                // const Text(
                                //   'Good Morning',
                                //   style: TextStyle(
                                //     color: Colors.white,
                                //     fontSize: 20,
                                //     fontWeight: FontWeight.bold,
                                //   ),
                                //),
                              ],
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Icon(Icons.notifications, color: Color(0xFF5F9EA0)),
                        ),
                      ],
                    ),
                  ),

                  // Calendar Card
                  Card(
                    margin: const EdgeInsets.all(16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text('Today'),
                              Text('Jan, 2025'),
                            ],
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Appointment with Dr. Roy',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: List.generate(
                              7,
                              (index) => Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 8,
                                  horizontal: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: index == 1
                                      ? const Color(0xFF5F9EA0)
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: Colors.grey.shade300),
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'][index],
                                      style: TextStyle(
                                        color: index == 1 ? Colors.white : Colors.grey,
                                      ),
                                    ),
                                    Text(
                                      ['01', '02', '03', '04', '05', '06', '07'][index],
                                      style: TextStyle(
                                        color: index == 1 ? Colors.white : Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Activity Cards
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        _buildActivityCard(
                          icon: Icons.directions_run,
                          title: 'Morning Jogging',
                          time: '6:00 am',
                        ),
                        const SizedBox(height: 12),
                        _buildActivityCard(
                          icon: Icons.self_improvement,
                          title: 'Meditation',
                          time: '7:00 am',
                        ),
                        const SizedBox(height: 12),
                        _buildActivityCard(
                          icon: Icons.medication,
                          title: 'Medicine',
                          time: '7:30 am',
                        ),
                      ],
                    ),
                  ),

                  const Spacer(),
                  // Bottom Navigation
                  Container(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Icon(Icons.home, color: Color(0xFF5F9EA0)),
                         IconButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => MedicalBotScreen(),
                                ),
                              );
                            },
                            icon: Icon(
                              Icons.monitor,
                              color: Color.fromRGBO(211, 211, 211, 1.0),
                            ),
                          ),                              
                        // Image.asset(
                        //   'assets/3rd.png',
                        //   height: 80,
                        //   width: 80,
                        // ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => MedicationReminderApp(),
                              ),
                            );
                          },
                          child: Image.asset(
                            'assets/3rd.png',
                            height: 80,
                            width: 80,
                          ),
                        ),
                        // Image.asset(
                        //   'assets/4th.png',
                        //   height: 80,
                        //   width: 80,
                        // ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => InterestSelectionScreen(),
                              ),
                            );
                          },
                          child: Image.asset(
                            'assets/4th.png',
                            height: 80,
                            width: 80,
                          ),
                        ),
                        //const Icon(Icons.access_time, color: Color.fromRGBO(211, 211, 211, 100)),
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => AppointmentSchedulerApp(),
                                ),
                              );
                            },
                            icon: Icon(
                              Icons.access_time,
                              color: Color.fromRGBO(211, 211, 211, 1.0),
                            ),
                          ),     
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => GameSelectionScreen(),
                              ),
                            );
                          },
                          child: Image.asset(
                            'assets/6th.png',
                            height: 80,
                            width: 80,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              // Floating Action Button
              Positioned(
                bottom: 80, // Adjust this value to position the button above the bottom navigation
                right: 16,
                child: FloatingActionButton(
                  onPressed: () {
                    // Add your onPressed code here!
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SOSScreen()),
                    );
                  },
                  backgroundColor: const Color(0xFF5F9EA0),
                  child: const Icon(FontAwesomeIcons.truckMedical, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActivityCard({
    required IconData icon,
    required String title,
    required String time,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF5F9EA0),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.white),
          const SizedBox(width: 12),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          Text(
            time,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

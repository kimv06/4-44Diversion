// // import 'package:flutter/material.dart';
// // //import 'package:flutter_local_notifications.dart';

// // void main() {
// //   runApp(const MedicalChatbotApp());
// // }

// // class MedicalChatbotApp extends StatelessWidget {
// //   const MedicalChatbotApp({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'Medical Chatbot',
// //       theme: ThemeData(
// //         primarySwatch: Colors.blue,
// //       ),
// //       home: const ChatScreen(),
// //     );
// //   }
// // }

// // class ChatScreen extends StatefulWidget {
// //   const ChatScreen({super.key});

// //   @override
// //   State<ChatScreen> createState() => _ChatScreenState();
// // }

// // class _ChatScreenState extends State<ChatScreen> {
// //   final List<ChatMessage> _messages = [];
// //   final TextEditingController _textController = TextEditingController();
  
// //   String _name = "";
// //   int _age = 0;
// //   String _medications = "";

// //   void _handleSubmitted(String text) {
// //     _textController.clear();
// //     _addMessage(ChatMessage(text: text, isUser: true));

// //     // Process user input and generate bot responses
// //     String botResponse = _generateBotResponse(text);
// //     _addMessage(ChatMessage(text: botResponse, isUser: false));
// //   }

// //   String _generateBotResponse(String userMessage) {
// //     userMessage = userMessage.toLowerCase();

// //     if (_name.isEmpty) {
// //       _name = userMessage; 
// //       return "Hello, $_name! What is your age?";
// //     } else if (_age == 0) {
// //       try {
// //         _age = int.parse(userMessage); 
// //         return "Okay, $_age years old. Please list your medications (separated by commas):";
// //       } catch (e) {
// //         return "Invalid age. Please enter a number.";
// //       }
// //     } else if (_medications.isEmpty) {
// //       _medications = userMessage;
// //       return "Thank you. Here are some general recommendations: \n"
// //           "Medications: $_medications \n"
// //           "Schedule: Take medications as prescribed. Set reminders! \n"
// //           "Log: Keep track of your medication intake and any side effects.";
// //     } else if (userMessage.contains("reminder")) {
// //       return "Reminder set!"; 
// //     } else if (userMessage.contains("log")) {
// //       return "Log created!"; 
// //     } else if (_getMedicineRecommendation(userMessage).isNotEmpty) {
// //       return _getMedicineRecommendation(userMessage);
// //     } else {
// //       return "I can provide information about medications, remedies, and more. Ask me!";
// //     }
// //   }

// //   // New function to provide medicine recommendations
// //   String _getMedicineRecommendation(String disease) {
// //     if (disease.contains("fever")) {
// //       return "For fever, you can take Paracetamol or Ibuprofen. Drink plenty of fluids and rest.";
// //     } else if (disease.contains("cold")) {
// //       return "For a common cold, try using saline nasal spray, warm fluids, and rest.";
// //     } else if (disease.contains("headache")) {
// //       return "For headaches, consider using Paracetamol or Ibuprofen. Stay hydrated and avoid stress.";
// //     } else if (disease.contains("stomach pain")) {
// //       return "For stomach pain, you may try Antacids or Pepto-Bismol. Stay hydrated and avoid spicy food.";
// //     } else if (disease.contains("cough")) {
// //       return "For a cough, you can use Cough Syrup, Honey & Lemon, or warm salt water gargles.";
// //     } else {
// //       return "I am not sure about that disease. Could you provide more details?";
// //     }
// //   }

// //   void _addMessage(ChatMessage message) {
// //     setState(() {
// //       _messages.insert(0, message);
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('Medical Chatbot'),
// //       ),
// //       body: Column(
// //         children: <Widget>[
// //           Expanded(
// //             child: ListView.builder(
// //               reverse: true,
// //               padding: const EdgeInsets.all(8.0),
// //               itemCount: _messages.length,
// //               itemBuilder: (_, int index) => _messages[index],
// //             ),
// //           ),
// //           _buildTextComposer(),
// //         ],
// //       ),
// //     );
// //   }

// //   Widget _buildTextComposer() {
// //     return Container(
// //       margin: const EdgeInsets.symmetric(horizontal: 8.0),
// //       child: Row(
// //         children: <Widget>[
// //           Flexible(
// //             child: TextField(
// //               controller: _textController,
// //               onSubmitted: _handleSubmitted,
// //               decoration: InputDecoration(
// //                 hintText: 'Ask about diseases or send a message...',
// //               ),
// //             ),
// //           ),
// //           IconButton(
// //             onPressed: () => _handleSubmitted(_textController.text),
// //             icon: const Icon(Icons.send),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // class ChatMessage extends StatelessWidget {
// //   const ChatMessage({super.key, required this.text, required this.isUser});

// //   final String text;
// //   final bool isUser;

// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       margin: const EdgeInsets.symmetric(vertical: 10.0),
// //       child: Row(
// //         mainAxisAlignment:
// //             isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
// //         children: <Widget>[
// //           if (!isUser) // Bot message
// //             const CircleAvatar(child: Text('Bot')), // Replace with bot avatar
// //           Expanded(
// //             child: Container(
// //               padding: const EdgeInsets.all(10.0),
// //               decoration: BoxDecoration(
// //                 borderRadius: BorderRadius.circular(10.0),
// //                 color: isUser ? Colors.blue[100] : Colors.grey[200],
// //               ),
// //               child: Text(text),
// //             ),
// //           ),
// //           if (isUser) // User message
// //             const CircleAvatar(child: Icon(Icons.person)),
// //         ],
// //       ),
// //     );
// //   }
// // }
// // import 'package:flutter/material.dart';

// // void main() {
// //   runApp(const MedicalChatbotApp());
// // }

// // class MedicalChatbotApp extends StatelessWidget {
// //   const MedicalChatbotApp({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'Medical Chatbot',
// //       theme: ThemeData(
// //         primarySwatch: Colors.blue,
// //       ),
// //       home: const ChatScreen(),
// //     );
// //   }
// // }

// // class ChatScreen extends StatefulWidget {
// //   const ChatScreen({super.key});

// //   @override
// //   State<ChatScreen> createState() => _ChatScreenState();
// // }

// // class _ChatScreenState extends State<ChatScreen> {
// //   final List<ChatMessage> _messages = [];
// //   final TextEditingController _textController = TextEditingController();

// //   void _handleSubmitted(String text) {
// //     if (text.isEmpty) return; // Prevent empty messages
// //     _textController.clear();
// //     _addMessage(ChatMessage(text: text, isUser:  true));

// //     // Generate bot response
// //     String botResponse = _generateBotResponse(text);
// //     _addMessage(ChatMessage(text: botResponse, isUser:  false));
// //   }

// //   String _generateBotResponse(String userMessage) {
// //     userMessage = userMessage.toLowerCase();

// //     if (userMessage.contains("fever")) {
// //       return "For fever, you can take Paracetamol or Ibuprofen. Drink plenty of fluids and rest.";
// //     } else if (userMessage.contains("cold")) {
// //       return "For a common cold, try using saline nasal spray, warm fluids, and rest.";
// //     } else if (userMessage.contains("headache")) {
// //       return "For headaches, consider using Paracetamol or Ibuprofen. Stay hydrated and avoid stress.";
// //     } else if (userMessage.contains("stomach pain")) {
// //       return "For stomach pain, you may try Antacids or Pepto-Bismol. Stay hydrated and avoid spicy food.";
// //     } else if (userMessage.contains("cough")) {
// //       return "For a cough, you can use Cough Syrup, Honey & Lemon, or warm salt water gargles.";
// //     } else if (userMessage.contains("reminder")) {
// //       return "Reminder set! Please specify what you want to be reminded about.";
// //     } else if (userMessage.contains("log")) {
// //       return "Log created! Please specify what you want to log.";
// //     } else {
// //       return "I can provide information about medications, remedies, and more. Ask me!";
// //     }
// //   }

// //   void _addMessage(ChatMessage message) {
// //     setState(() {
// //       _messages.insert(0, message);
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('Medical Chatbot'),
// //       ),
// //       body: Column(
// //         children: <Widget>[
// //           Expanded(
// //             child: ListView.builder(
// //               reverse: true,
// //               padding: const EdgeInsets.all(8.0),
// //               itemCount: _messages.length,
// //               itemBuilder: (_, int index) => _messages[index],
// //             ),
// //           ),
// //           _buildTextComposer(),
// //         ],
// //       ),
// //     );
// //   }

// //   Widget _buildTextComposer() {
// //     return Container(
// //       margin: const EdgeInsets.symmetric(horizontal: 8.0),
// //       child: Row(
// //         children: <Widget>[
// //           Flexible(
// //             child: TextField(
// //               controller: _textController,
// //               onSubmitted: _handleSubmitted,
// //               decoration: const InputDecoration(
// //                 hintText: 'Ask about diseases or send a message...',
// //               ),
// //             ),
// //           ),
// //           IconButton(
// //             onPressed: () => _handleSubmitted(_textController.text),
// //             icon: const Icon(Icons.send),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // class ChatMessage extends StatelessWidget {
// //   const ChatMessage({super.key, required this.text, required this.isUser });

// //   final String text;
// //   final bool isUser ;

// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       margin: const EdgeInsets.symmetric(vertical: 10.0),
// //       child: Row(
// //         mainAxisAlignment: isUser  ? MainAxisAlignment.end : MainAxisAlignment.start,
// //         children: <Widget>[
// //           if (!isUser ) // Bot message
// //             const CircleAvatar(child: Text('Bot')), // Replace with bot avatar
// //           Expanded(
// //             child: Container(
// //               padding: const EdgeInsets.all(10.0),
// //               decoration: BoxDecoration(
// //                 borderRadius: BorderRadius.circular(10.0),
// //                 color: isUser  ? Colors.blue[100] : Colors.grey[200],
// //               ),
// //               child: Text(text),
// //             ),
// //           ),
// //           if (isUser ) // User message
// //             const CircleAvatar(child: Icon(Icons.person)),
// //         ],
// //       ),
// //     );
// //   }
// // }
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:google_generative_ai/google_generative_ai.dart';

// class MedicalBotScreen extends StatefulWidget {
//   const MedicalBotScreen({super.key});

//   @override
//   State<MedicalBotScreen> createState() => _MedicalBotScreenState();
// }

// class _MedicalBotScreenState extends State<MedicalBotScreen> {
//   final TextEditingController _userMessage = TextEditingController();
//   final TextEditingController _heightController = TextEditingController();
//   final TextEditingController _weightController = TextEditingController();
//   final TextEditingController _ageController = TextEditingController();
//   final TextEditingController _genderController = TextEditingController();
//   final TextEditingController _symptomsController = TextEditingController();
//   final TextEditingController _medicalHistoryController =
//       TextEditingController();

//   static const apiKey =
//       "AIzaSyDZslRsRl9i4-3QhUa1PHmq5QrUw7z4Zs0";
//   final model = GenerativeModel(
//     model: 'gemini-2.0-flash',
//     apiKey: apiKey,
//     generationConfig: GenerationConfig(
//       temperature: 1,
//       topK: 40,
//       topP: 0.95,
//       maxOutputTokens: 8192,
//       responseMimeType: 'text/plain',
//     ),
//     systemInstruction: Content.system('Act as a licensed health expert or doctor, providing accurate predictions, diagnoses, and medical advice based on patient-provided health records and symptoms.\n\nYou will analyze the provided symptoms and medical history (including but not limited to height, weight, age, gender, allergies, current medical conditions, and chronic ailments) to deliver a well-justified potential diagnosis. Recommend medications where applicable, specifying doses, timing, and additional care instructions tailored to the patient\'s profile. \n\n# Guidelines:\n\n- Reasoning Priority: Always explain the reasoning behind your diagnosis and recommendations before providing the conclusions.\n- Clarity: Avoid complex medical jargon unless absolutely necessary; instead, aim to explain terms in simple language where appropriate.\n- Patient-Centric Recommendations:\n    - Recommend treatments or medications based on the patient\'s allergies, sensitivities, and health record.\n    - Avoid recommending medications that might potentially cause adverse reactions, considering their medical history.\n- Ethical Boundaries:\n    - Always include a disclaimer that the advice provided is not a substitute for in-person consultation with a healthcare professional.\n    - Encourage the patient to seek immediate medical attention if symptoms are severe or if there is uncertainty.\n- Safety First: Never encourage self-diagnosis or suggest treatments for life-threatening conditions without explicitly directing the patient to see a licensed healthcare professional.\n\n# Steps:\n\n1. Analyze the patient’s health record, including symptoms, demographic information, allergies, medical conditions, and chronic ailments.\n2. Determine likely diagnoses or conditions based on provided data.\n3. Recommend suitable medications if applicable, specifying:\n    - Medication name.\n    - Dosage (e.g., mg, ml, tablets).\n    - Timing (e.g., morning, night, after meals).\n4. Add non-medication advice such as lifestyle modifications, dietary recommendations, or follow-up testing if applicable.\n5. Conclude with a disclaimer emphasizing that the advice is based on the given information and is not a substitute for a consultation with a licensed medical professional.\n\n# Output Format:\n\n1. Introduction:\n   - Greet the patient briefly.\n   - Locate symptoms/concerns they presented.\n   - Mention allergies and chronic ailments to show you are considering them.\n\n2. Reasoning:\n   - Provide clear reasoning behind your diagnosis, connecting their symptoms and health record to the potential condition.\n\n3. Diagnosis/Condition:\n   - State the possible condition(s) clearly.\n\n4. Treatment Plan:\n   - Medications (name, dosage, timing, and special instructions).\n   - Non-medication recommendations (e.g., lifestyle changes, suggested tests).\n\n5. Disclaimer:\n   - Include a brief reminder to consult a licensed healthcare professional for an official diagnosis and follow-up care.\n\n# Example:\n\nInput (Patient Health Record):\n- Symptoms: Persistent cough, mild fever, fatigue.  \n- Age: 35  \n- Gender: Male  \n- Weight: 75 kg  \n- Height: 175 cm  \n- Allergies: Penicillin  \n- Medical Condition: Asthma  \n- Chronic Ailments: Seasonal allergic rhinitis  \n\nOutput:\n\nIntroduction:  \nHello! Based on the information you’ve provided, I see that you’re experiencing persistent cough, mild fever, and fatigue. You have asthma and seasonal allergic rhinitis, with a known allergy to penicillin. Let’s analyze your symptoms and provide advice accordingly.  \n\nReasoning:  \nGiven your symptoms of persistent cough, mild fever, and fatigue, it is possible that you are experiencing a respiratory tract infection, such as viral bronchitis or an early stage of another respiratory condition. Considering your asthma, managing inflammation and avoiding additional triggers is crucial. I’ve also noted your penicillin allergy to ensure no contraindicated medications are recommended.  \n\nDiagnosis/Condition:\nThe likely condition is viral bronchitis. Since viral bronchitis is common and often self-limiting, supportive care should help significantly. We’ll discuss treatment options below, but please seek further evaluation for worsening symptoms or any new signs like significant breathlessness or chest pain.  \n\nTreatment Plan:\n- Medications:  \n   - Salbutamol (Albuterol) Inhaler: Use as prescribed by your asthma management plan for bronchospasms.  \n   - Acetaminophen (Paracetamol) 500 mg: Take 1 tablet every 6 hours as needed for fever.  \n   - Guaifenesin 200 mg (Expectorant): Take 1 tablet every 4–6 hours with a full glass of water to alleviate coughing.  \n\n- Non-Medication Advice:  \n   - Stay hydrated by drinking plenty of fluids (water, warm teas, clear broths).  \n   - Use a humidifier in your room to keep the air moist and ease breathing.  \n   - Avoid exposure to allergens or irritants that can further activate asthma symptoms.  \n\nDisclaimer:  \nPlease remember, these recommendations are based on the information you’ve provided and are not a substitute for medical advice from an in-person consultation. If symptoms worsen, develop shortness of breath, or persist beyond 7–10 days, consult a healthcare professional immediately.\n\n# Notes:\n- If an input explicitly lacks essential aspects like allergies or medical history, ask clarifying questions before proceeding.\n- For medications, use placeholders (e.g., [Sample Medication]) if specific drug names are requested but not provided in the input.\n- Avoid recommending overlapping or conflicting medications. Double-check doses and interactions.'),
//   );

//   final List<Message> _messages = [];
//   bool _isCollectingInfo = true;
//   final Map<String, String> _userInfo = {};

//   Future<void> sendMessage() async {
//     if (_isCollectingInfo) {
//       collectUserInfo();
//     } else {
//       final message = _userMessage.text;
//       _userMessage.clear();

//       setState(() {
//         _messages
//             .add(Message(isUser: true, message: message, date: DateTime.now()));
//       });

//       final userInfoString =
//           _userInfo.entries.map((e) => "${e.key}: ${e.value}").join(", ");
//       final content = [
//         Content.text(
//             "You are a medical assistant AI. Provide personalized remedies based on the following user information: $userInfoString. "
//             "The user's current message is: $message. "
//             "Always remind the user to consult with a real doctor for personalized medical advice and that your suggestions are not a substitute for professional medical care.")
//       ];
//       final response = await model.generateContent(content);
//       setState(() {
//         _messages.add(Message(
//             isUser: false, message: response.text ?? "", date: DateTime.now()));
//       });
//     }
//   }

//   void collectUserInfo() {
//     if (_heightController.text.isNotEmpty) {
//       _userInfo["Height"] = _heightController.text;
//     }
//     if (_weightController.text.isNotEmpty) {
//       _userInfo["Weight"] = _weightController.text;
//     }
//     if (_ageController.text.isNotEmpty) _userInfo["Age"] = _ageController.text;
//     if (_genderController.text.isNotEmpty) {
//       _userInfo["Gender"] = _genderController.text;
//     }
//     if (_symptomsController.text.isNotEmpty) {
//       _userInfo["Symptoms"] = _symptomsController.text;
//     }
//     if (_medicalHistoryController.text.isNotEmpty) {
//       _userInfo["Medical History"] = _medicalHistoryController.text;
//     }

//     if (_userInfo.length == 6) {
//       setState(() {
//         _isCollectingInfo = false;
//         _messages.add(Message(
//             isUser: false,
//             message:
//                 "Thank you for providing your information. How can I assist you today?",
//             date: DateTime.now()));
//       });
//     } else {
//       setState(() {
//         _messages.add(Message(
//             isUser: false,
//             message: "Please provide all the required information.",
//             date: DateTime.now()));
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Sneh'),
//         backgroundColor: Colors.teal,
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemCount: _messages.length,
//               itemBuilder: (context, index) {
//                 final message = _messages[index];
//                 return Messages(
//                   isUser: message.isUser,
//                   message: message.message,
//                   date: DateFormat('HH:mm').format(message.date), 
//                 );
//               },
//             ),
//           ),
//           if (_isCollectingInfo) _buildInfoCollectionForm(),
//           if (!_isCollectingInfo) _buildChatInput(),
//         ],
//       ),
//     );
//   }

//   Widget _buildInfoCollectionForm() {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Column(
//         children: [
//           TextField(
//             controller: _heightController,
//             decoration: const InputDecoration(labelText: 'Height (cm)'),
//             keyboardType: TextInputType.number,
//           ),
//           TextField(
//             controller: _weightController,
//             decoration: const InputDecoration(labelText: 'Weight (kg)'),
//             keyboardType: TextInputType.number,
//           ),
//           TextField(
//             controller: _ageController,
//             decoration: const InputDecoration(labelText: 'Age'),
//             keyboardType: TextInputType.number,
//           ),
//           TextField(
//             controller: _genderController,
//             decoration: const InputDecoration(labelText: 'Gender'),
//           ),
//           TextField(
//             controller: _symptomsController,
//             decoration: const InputDecoration(labelText: 'Symptoms'),
//           ),
//           TextField(
//             controller: _medicalHistoryController,
//             decoration: const InputDecoration(labelText: 'Medical History'),
//           ),
//           const SizedBox(height: 8),

//           ElevatedButton(
//             onPressed: sendMessage,
//             style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
//             child: Text('Submit Information'),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildChatInput() {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Row(
//         children: [
//           Expanded(
//             child: TextField(
//               controller: _userMessage,
//               decoration: const InputDecoration(
//                 hintText: 'Type your message...',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//           ),
//           IconButton(
//             icon: const Icon(Icons.send),
//             onPressed: sendMessage,
//             color: Colors.teal,
//           ),
//         ],
//       ),
//     );
//   }
// }

// class Messages extends StatelessWidget {
//   final bool isUser;
//   final String message;
//   final String date;
//   const Messages(
//       {super.key,
//       required this.isUser,
//       required this.message,
//       required this.date});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(8),
//       margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8).copyWith(
//         left: isUser ? 40 : 0,
//         right: isUser ? 0 : 40,
//       ),
//       decoration: BoxDecoration(
//         color: isUser ? Colors.teal.shade100 : Colors.grey.shade200,
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             message,
//             style: const TextStyle(color: Colors.black87),
//           ),
//           const SizedBox(height: 4),
//           Text(
//             date,
//             style: const TextStyle(color: Colors.black54, fontSize: 12),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class Message {
//   final bool isUser;
//   final String message;
//   final DateTime date;

//   Message({
//     required this.isUser,
//     required this.message,
//     required this.date,
//   });
// }

// import 'dart:io';
// import 'dart:typed_data';
// import 'package:flutter/material.dart';
// import 'package:google_ml_kit/google_ml_kit.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
// import 'package:intl/intl.dart';
// import 'package:flutter/foundation.dart' show kIsWeb;

// void main() {
//   runApp(const MedicalBotApp());
// }

// class MedicalBotApp extends StatelessWidget {
//   const MedicalBotApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Medical Bot',
//       theme: ThemeData(
//         primarySwatch: Colors.teal,
//       ),
//       home: const MedicalBotScreen(),
//     );
//   }
// }

// class MedicalBotScreen extends StatefulWidget {
//   const MedicalBotScreen({super.key});

//   @override
//   _MedicalBotScreenState createState() => _MedicalBotScreenState();
// }

// class _MedicalBotScreenState extends State<MedicalBotScreen> {
//   File? _imageFile; // For mobile
//   Uint8List? _imageBytes; // For web
//   String? _extractedText; // Extracted text from image
//   bool _isCollectingInfo = true; // Toggle between input forms
//   final TextEditingController _userMessage = TextEditingController();

//   final List<ChatMessage> _messages = [];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Medical Bot'),
//         backgroundColor: Colors.teal,
//       ),
//       body: SafeArea(
//         child: Column(
//           children: [
//             Expanded(
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     ListView.builder(
//                       shrinkWrap: true,
//                       physics: const NeverScrollableScrollPhysics(),
//                       itemCount: _messages.length,
//                       itemBuilder: (context, index) => Messages(
//                         isUser: _messages[index].isUser,
//                         message: _messages[index].message,
//                         date: DateFormat('HH:mm').format(_messages[index].date),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             ElevatedButton(
//               onPressed: _pickImage,
//               child: const Text('Upload Image'),
//             ),
//             if (_imageFile != null || _imageBytes != null)
//               Padding(
//                 padding: const EdgeInsets.all(5.0),
//                 child: SizedBox(
//                   height: 100,
//                   child: kIsWeb
//                       ? Image.memory(_imageBytes!) // Show image for web
//                       : Image.file(_imageFile!),
//                 ), // Show image for mobile
//               ),
//             if (_extractedText != null)
//               Padding(
//                 padding: const EdgeInsets.all(5.0),
//                 child: Text('Extracted Text: $_extractedText'),
//               ),
//             if (_isCollectingInfo) _buildInfoCollectionForm(),
//             if (!_isCollectingInfo) _buildChatInput(),
//           ],
//         ),
//       ),
//     );
//   }

//   Future<void> _pickImage() async {
//     FilePickerResult? result = await FilePicker.platform.pickFiles(
//       type: FileType.image,
//       withData: true, // For web (returns Uint8List)
//     );

//     if (result != null) {
//       if (kIsWeb) {
//         setState(() {
//           _imageBytes = result.files.first.bytes;
//         });
//         await _processImageWeb(result.files.first.bytes!);
//       } else {
//         setState(() {
//           _imageFile = File(result.files.first.path!);
//         });
//         await _processImage(_imageFile!);
//       }
//     }
//   }

//   Future<void> _processImage(File imageFile) async {
//     final inputImage = InputImage.fromFile(imageFile);
//     final textRecognizer = TextRecognizer();
//     final RecognizedText recognizedText =
//         await textRecognizer.processImage(inputImage);
//     setState(() {
//       _extractedText = recognizedText.text;
//     });
//   }

//   Future<void> _processImageWeb(Uint8List imageBytes) async {
//     final inputImage = InputImage.fromBytes(
//       bytes: imageBytes,
//       metadata: InputImageMetadata(
//         size: const Size(70, 70),
//         rotation: InputImageRotation.rotation0deg,
//         format: InputImageFormat.nv21,
//         bytesPerRow: 100,
//       ),
//     );

//     final textRecognizer = TextRecognizer();
//     final RecognizedText recognizedText =
//         await textRecognizer.processImage(inputImage);
//     setState(() {
//       _extractedText = recognizedText.text;
//     });
//   }

//   Widget _buildInfoCollectionForm() {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Column(
//         children: [
//           TextField(
//             decoration: const InputDecoration(labelText: 'Height (cm)'),
//             keyboardType: TextInputType.number,
//           ),
//           TextField(
//             decoration: const InputDecoration(labelText: 'Weight (kg)'),
//             keyboardType: TextInputType.number,
//           ),
//           TextField(
//             decoration: const InputDecoration(labelText: 'Age'),
//             keyboardType: TextInputType.number,
//           ),
//           TextField(
//             decoration: const InputDecoration(labelText: 'Gender'),
//           ),
//           TextField(
//             decoration: const InputDecoration(labelText: 'Symptoms'),
//           ),
//           TextField(
//             decoration: const InputDecoration(labelText: 'Medical History'),
//           ),
//           const SizedBox(height: 8),
//           ElevatedButton(
//             onPressed: () {
//               setState(() {
//                 _isCollectingInfo = false;
//               });
//             },
//             style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
//             child: const Text('Submit Information'),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildChatInput() {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Row(
//         children: [
//           Expanded(
//             child: TextField(
//               controller: _userMessage,
//               decoration: const InputDecoration(
//                 hintText: 'Type your message...',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//           ),
//           IconButton(
//             icon: const Icon(Icons.send),
//             onPressed: _sendMessage,
//             color: Colors.teal,
//           ),
//         ],
//       ),
//     );
//   }

//   void _sendMessage() {
//     if (_userMessage.text.isNotEmpty) {
//       setState(() {
//         _messages.add(ChatMessage(
//           isUser: true,
//           message: _userMessage.text,
//           date: DateTime.now(),
//         ));
//         _userMessage.clear();
//       });
//     }
//   }
// }

// class ChatMessage {
//   final bool isUser;
//   final String message;
//   final DateTime date;

//   ChatMessage({required this.isUser, required this.message, required this.date});
// }

// class Messages extends StatelessWidget {
//   final bool isUser;
//   final String message;
//   final String date;

//   const Messages({super.key, required this.isUser, required this.message, required this.date});

//   @override
//   Widget build(BuildContext context) {
//     return Align(
//       alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
//       child: Container(
//         margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//         padding: const EdgeInsets.all(10),
//         decoration: BoxDecoration(
//           color: isUser ? Colors.teal : Colors.grey[300],
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(message, style: const TextStyle(fontSize: 16, color: Colors.white)),
//             Text(date, style: const TextStyle(fontSize: 12, color: Colors.white70)),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:google_generative_ai/google_generative_ai.dart';
// import 'package:myapp/main.dart';

// class MedicalBotScreen extends StatefulWidget {
//   const MedicalBotScreen({super.key});

//   @override
//   State<MedicalBotScreen> createState() => _MedicalBotScreenState();
// }

// class _MedicalBotScreenState extends State<MedicalBotScreen> {
//   final TextEditingController _userMessage = TextEditingController();
//   final TextEditingController _heightController = TextEditingController();
//   final TextEditingController _weightController = TextEditingController();
//   final TextEditingController _ageController = TextEditingController();
//   final TextEditingController _genderController = TextEditingController();
//   final TextEditingController _symptomsController = TextEditingController();
//   final TextEditingController _medicalHistoryController =
//       TextEditingController();

//   static const apiKey =
//       "AIzaSyDZslRsRl9i4-3QhUa1PHmq5QrUw7z4Zs0";
//   // final model = GenerativeModel(model: 'gemini-pro', apiKey: apiKey);
//   final model = GenerativeModel(
//     model: 'gemini-2.0-flash',
//     apiKey: apiKey,
//     generationConfig: GenerationConfig(
//       temperature: 1,
//       topK: 40,
//       topP: 0.95,
//       maxOutputTokens: 8192,
//       responseMimeType: 'text/plain',
//     ),
//     systemInstruction: Content.system('Act as a licensed health expert or doctor, providing accurate predictions, diagnoses, and medical advice based on patient-provided health records and symptoms.\n\nYou will analyze the provided symptoms and medical history (including but not limited to height, weight, age, gender, allergies, current medical conditions, and chronic ailments) to deliver a well-justified potential diagnosis. Recommend medications where applicable, specifying doses, timing, and additional care instructions tailored to the patient\'s profile. \n\n# Guidelines:\n\n- Reasoning Priority: Always explain the reasoning behind your diagnosis and recommendations before providing the conclusions.\n- Clarity: Avoid complex medical jargon unless absolutely necessary; instead, aim to explain terms in simple language where appropriate.\n- Patient-Centric Recommendations:\n    - Recommend treatments or medications based on the patient\'s allergies, sensitivities, and health record.\n    - Avoid recommending medications that might potentially cause adverse reactions, considering their medical history.\n- Ethical Boundaries:\n    - Always include a disclaimer that the advice provided is not a substitute for in-person consultation with a healthcare professional.\n    - Encourage the patient to seek immediate medical attention if symptoms are severe or if there is uncertainty.\n- Safety First: Never encourage self-diagnosis or suggest treatments for life-threatening conditions without explicitly directing the patient to see a licensed healthcare professional.\n\n# Steps:\n\n1. Analyze the patient’s health record, including symptoms, demographic information, allergies, medical conditions, and chronic ailments.\n2. Determine likely diagnoses or conditions based on provided data.\n3. Recommend suitable medications if applicable, specifying:\n    - Medication name.\n    - Dosage (e.g., mg, ml, tablets).\n    - Timing (e.g., morning, night, after meals).\n4. Add non-medication advice such as lifestyle modifications, dietary recommendations, or follow-up testing if applicable.\n5. Conclude with a disclaimer emphasizing that the advice is based on the given information and is not a substitute for a consultation with a licensed medical professional.\n\n# Output Format:\n\n1. Introduction:\n   - Greet the patient briefly.\n   - Locate symptoms/concerns they presented.\n   - Mention allergies and chronic ailments to show you are considering them.\n\n2. Reasoning:\n   - Provide clear reasoning behind your diagnosis, connecting their symptoms and health record to the potential condition.\n\n3. Diagnosis/Condition:\n   - State the possible condition(s) clearly.\n\n4. Treatment Plan:\n   - Medications (name, dosage, timing, and special instructions).\n   - Non-medication recommendations (e.g., lifestyle changes, suggested tests).\n\n5. Disclaimer:\n   - Include a brief reminder to consult a licensed healthcare professional for an official diagnosis and follow-up care.\n\n# Example:\n\nInput (Patient Health Record):\n- Symptoms: Persistent cough, mild fever, fatigue.  \n- Age: 35  \n- Gender: Male  \n- Weight: 75 kg  \n- Height: 175 cm  \n- Allergies: Penicillin  \n- Medical Condition: Asthma  \n- Chronic Ailments: Seasonal allergic rhinitis  \n\nOutput:\n\nIntroduction:  \nHello! Based on the information you’ve provided, I see that you’re experiencing persistent cough, mild fever, and fatigue. You have asthma and seasonal allergic rhinitis, with a known allergy to penicillin. Let’s analyze your symptoms and provide advice accordingly.  \n\nReasoning:  \nGiven your symptoms of persistent cough, mild fever, and fatigue, it is possible that you are experiencing a respiratory tract infection, such as viral bronchitis or an early stage of another respiratory condition. Considering your asthma, managing inflammation and avoiding additional triggers is crucial. I’ve also noted your penicillin allergy to ensure no contraindicated medications are recommended.  \n\nDiagnosis/Condition:\nThe likely condition is viral bronchitis. Since viral bronchitis is common and often self-limiting, supportive care should help significantly. We’ll discuss treatment options below, but please seek further evaluation for worsening symptoms or any new signs like significant breathlessness or chest pain.  \n\nTreatment Plan:\n- Medications:  \n   - Salbutamol (Albuterol) Inhaler: Use as prescribed by your asthma management plan for bronchospasms.  \n   - Acetaminophen (Paracetamol) 500 mg: Take 1 tablet every 6 hours as needed for fever.  \n   - Guaifenesin 200 mg (Expectorant): Take 1 tablet every 4–6 hours with a full glass of water to alleviate coughing.  \n\n- Non-Medication Advice:  \n   - Stay hydrated by drinking plenty of fluids (water, warm teas, clear broths).  \n   - Use a humidifier in your room to keep the air moist and ease breathing.  \n   - Avoid exposure to allergens or irritants that can further activate asthma symptoms.  \n\nDisclaimer:  \nPlease remember, these recommendations are based on the information you’ve provided and are not a substitute for medical advice from an in-person consultation. If symptoms worsen, develop shortness of breath, or persist beyond 7–10 days, consult a healthcare professional immediately.\n\n# Notes:\n- If an input explicitly lacks essential aspects like allergies or medical history, ask clarifying questions before proceeding.\n- For medications, use placeholders (e.g., [Sample Medication]) if specific drug names are requested but not provided in the input.\n- Avoid recommending overlapping or conflicting medications. Double-check doses and interactions.'),
//   );
//   final List<Message> _messages = [];
//   bool _isCollectingInfo = true;
//   final Map<String, String> _userInfo = {};

//   Future<void> sendMessage() async {
//     if (_isCollectingInfo) {
//       collectUserInfo();
//     } else {
//       final message = _userMessage.text;
//       _userMessage.clear();

//       setState(() {
//         _messages
//             .add(Message(isUser: true, message: message, date: DateTime.now()));
//       });

//       final userInfoString =
//           _userInfo.entries.map((e) => "${e.key}: ${e.value}").join(", ");
//       final content = [
//         Content.text(
//             "You are a medical assistant AI. Provide personalized remedies based on the following user information: $userInfoString. "
//             "The user's current message is: $message. "
//             "Always remind the user to consult with a real doctor for personalized medical advice and that your suggestions are not a substitute for professional medical care.")
//       ];
//       final response = await model.generateContent(content);
//       setState(() {
//         _messages.add(Message(
//             isUser: false, message: response.text ?? "", date: DateTime.now()));
//       });
//     }
//   }

//   void collectUserInfo() {
//     if (_heightController.text.isNotEmpty) {
//       _userInfo["Height"] = _heightController.text;
//     }
//     if (_weightController.text.isNotEmpty) {
//       _userInfo["Weight"] = _weightController.text;
//     }
//     if (_ageController.text.isNotEmpty) _userInfo["Age"] = _ageController.text;
//     if (_genderController.text.isNotEmpty) {
//       _userInfo["Gender"] = _genderController.text;
//     }
//     if (_symptomsController.text.isNotEmpty) {
//       _userInfo["Symptoms"] = _symptomsController.text;
//     }
//     if (_medicalHistoryController.text.isNotEmpty) {
//       _userInfo["Medical History"] = _medicalHistoryController.text;
//     }

//     if (_userInfo.length == 6) {
//       setState(() {
//         _isCollectingInfo = false;
//         _messages.add(Message(
//             isUser: false,
//             message:
//                 "Thank you for providing your information. How can I assist you today?",
//             date: DateTime.now()));
//       });
//     } else {
//       setState(() {
//         _messages.add(Message(
//             isUser: false,
//             message: "Please provide all the required information.",
//             date: DateTime.now()));
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GradientBackground(
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text('Sneh'),
//           backgroundColor: Color.fromRGBO(159, 95, 238, 1),
//         ),
//         body: Column(
//           children: [
//             Expanded(
//               child: ListView.builder(
//                 itemCount: _messages.length,
//                 itemBuilder: (context, index) {
//                   final message = _messages[index];
//                   return Messages(
//                     isUser: message.isUser,
//                     message: message.message,
//                     date: DateFormat('HH:mm').format(message.date), 
//                   );
//                 },
//               ),
//             ),
//             if (_isCollectingInfo) _buildInfoCollectionForm(),
//             if (!_isCollectingInfo) _buildChatInput(),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildInfoCollectionForm() {
//     return GradientBackground(
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: _heightController,
//               decoration: const InputDecoration(labelText: 'Height (cm)'),
//               keyboardType: TextInputType.number,
//             ),
//             TextField(
//               controller: _weightController,
//               decoration: const InputDecoration(labelText: 'Weight (kg)'),
//               keyboardType: TextInputType.number,
//             ),
//             TextField(
//               controller: _ageController,
//               decoration: const InputDecoration(labelText: 'Age'),
//               keyboardType: TextInputType.number,
//             ),
//             TextField(
//               controller: _genderController,
//               decoration: const InputDecoration(labelText: 'Gender'),
//             ),
//             TextField(
//               controller: _symptomsController,
//               decoration: const InputDecoration(labelText: 'Symptoms'),
//             ),
//             TextField(
//               controller: _medicalHistoryController,
//               decoration: const InputDecoration(labelText: 'Medical History'),
//             ),
//             const SizedBox(height: 8),
      
//             ElevatedButton(
//               onPressed: sendMessage,
//               style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 247, 248, 248)),
//               child: Text('Submit Information'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildChatInput() {
//     return GradientBackground(
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Row(
//           children: [
//             Expanded(
//               child: TextField(
//                 controller: _userMessage,
//                 decoration: const InputDecoration(
//                   hintText: 'Type your message...',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//             ),
//             IconButton(
//               icon: const Icon(Icons.send),
//               onPressed: sendMessage,
//               color: Color.fromRGBO(159, 95, 238, 1),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class Messages extends StatelessWidget {
//   final bool isUser;
//   final String message;
//   final String date;
//   const Messages(
//       {super.key,
//       required this.isUser,
//       required this.message,
//       required this.date});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(8),
//       margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8).copyWith(
//         left: isUser ? 40 : 0,
//         right: isUser ? 0 : 40,
//       ),
//       decoration: BoxDecoration(
//         color: isUser ? Colors.teal.shade100 : Colors.grey.shade200,
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             message,
//             style: const TextStyle(color: Color.fromARGB(221, 255, 255, 255)),
//           ),
//           const SizedBox(height: 4),
//           Text(
//             date,
//             style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 12),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class Message {
//   final bool isUser;
//   final String message;
//   final DateTime date;

//   Message({
//     required this.isUser,
//     required this.message,
//     required this.date,
//   });
// }
import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:appwrite/appwrite.dart';

// // class BotScreen extends StatefulWidget {
// //   const BotScreen({super.key});

// //   @override
// //   State<BotScreen> createState() => _BotScreenState();
// // }

// // class _BotScreenState extends State<BotScreen> {
// //   final TextEditingController _userMessage = TextEditingController();

// //   static const apiKey = "AIzaSyDZslRsRl9i4-3QhUa1PHmq5QrUw7z4Zs0";

// //   final model = GenerativeModel(model: 'gemini-pro', apiKey: apiKey);

// //   final List<Message> _messages = [];

// //   Future<void> sendMessage() async {
// //     final message = _userMessage.text;
// //     _userMessage.clear();

// //     setState(() {
// //       _messages
// //           .add(Message(isUser: true, message: message, date: DateTime.now()));
// //     });

// //     final content = [Content.text(message)];
// //     final response = await model.generateContent(content);
// //     setState(() {
// //       _messages.add(Message(
// //           isUser: false, message: response.text ?? "", date: DateTime.now()));
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //         appBar: AppBar(
// //           title: const Text('Sneh'),
// //         ),
// //         body: Column(
// //           mainAxisAlignment: MainAxisAlignment.end,
// //           children: [
// //             Expanded(
// //               child: ListView.builder(
// //                 itemCount: _messages.length,
// //                 itemBuilder: (context, index) {
// //                   final message = _messages[index];
// //                   return Messages(
// //                     isUser: message.isUser,
// //                     message: message.message,
// //                     date: DateFormat('HH:mm').format(message.date),
// //                   );
// //                 },
// //               ),
// //             ),
// //             Padding(
// //               padding:
// //                   const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
// //               child: Row(
// //                 children: [
// //                   Expanded(
// //                     flex: 15,
// //                     child: TextFormField(
// //                       controller: _userMessage,
// //                       decoration: InputDecoration(
// //                         border: OutlineInputBorder(
// //                             borderSide:
// //                                 const BorderSide(color: Colors.deepOrange),
// //                             borderRadius: BorderRadius.circular(50)),
// //                         label: const Text("Ask Sneh..."),
// //                       ),
// //                     ),
// //                   ),
// //                   const Spacer(),
// //                   IconButton(
// //                     padding: const EdgeInsets.all(15),
// //                     iconSize: 30,
// //                     style: ButtonStyle(
// //                       backgroundColor:
// //                           WidgetStateProperty.all(Colors.deepPurple),
// //                       foregroundColor: WidgetStateProperty.all(Colors.white),
// //                       shape: WidgetStateProperty.all(
// //                         const CircleBorder(),
// //                       ),
// //                     ),
// //                     onPressed: () {
// //                       sendMessage();
// //                     },
// //                     icon: const Icon(Icons.send),
// //                   )
// //                 ],
// //               ),
// //             )
// //           ],
// //         ));
// //   }
// // }

// // class Messages extends StatelessWidget {
// //   final bool isUser;
// //   final String message;
// //   final String date;
// //   const Messages(
// //       {super.key,
// //       required this.isUser,
// //       required this.message,
// //       required this.date});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Container(
// //       width: double.infinity,
// //       padding: const EdgeInsets.all(15),
// //       margin: const EdgeInsets.symmetric(vertical: 15).copyWith(
// //         left: isUser ? 100 : 10,
// //         right: isUser ? 10 : 100,
// //       ),
// //       decoration: BoxDecoration(
// //         color: isUser ? Colors.deepPurple : Colors.grey.shade200,
// //         borderRadius: BorderRadius.only(
// //           topLeft: const Radius.circular(30),
// //           bottomLeft: isUser ? const Radius.circular(30) : Radius.zero,
// //           topRight: const Radius.circular(30),
// //           bottomRight: isUser ? Radius.zero : const Radius.circular(30),
// //         ),
// //       ),
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           Text(
// //             message,
// //             style: TextStyle(color: isUser ? Colors.white : Colors.black),
// //           ),
// //           Text(
// //             date,
// //             style: TextStyle(color: isUser ? Colors.white : Colors.black),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // class Message {
// //   final bool isUser;
// //   final String message;
// //   final DateTime date;

// //   Message({
// //     required this.isUser,
// //     required this.message,
// //     required this.date,
// //   });
// // }

// class MedicalBotScreen extends StatefulWidget {
//   const MedicalBotScreen({super.key});

//   @override
//   State<MedicalBotScreen> createState() => _MedicalBotScreenState();
// }

// class _MedicalBotScreenState extends State<MedicalBotScreen> {
//   final TextEditingController _userMessage = TextEditingController();

//   static const apiKey = "AIzaSyDZslRsRl9i4-3QhUa1PHmq5QrUw7z4Zs0"; // Replace with your actual API key

//   final model = GenerativeModel(model: 'gemini-pro', apiKey: apiKey);

//   final List<Message> _messages = [];

//   Future<void> sendMessage() async {
//     final message = _userMessage.text;
//     _userMessage.clear();

//     setState(() {
//       _messages
//           .add(Message(isUser: true, message: message, date: DateTime.now()));
//     });

//     final content = [
//       Content.text(
//           "You are a medical assistant AI. Provide helpful medical information and advice. Always remind the user to consult with a real doctor for personalized medical advice. The user's message is: $message")
//     ];
//     final response = await model.generateContent(content);
//     setState(() {
//       _messages.add(Message(
//           isUser: false, message: response.text ?? "", date: DateTime.now()));
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('MediBot'),
//         backgroundColor: Colors.teal,
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemCount: _messages.length,
//               itemBuilder: (context, index) {
//                 final message = _messages[index];
//                 return Messages(
//                   isUser: message.isUser,
//                   message: message.message,
//                   date: DateFormat('HH:mm').format(message.date),
//                 );
//               },
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 15),
//             child: Row(
//               children: [
//                 Expanded(
//                   flex: 15,
//                   child: TextFormField(
//                     controller: _userMessage,
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(
//                         borderSide: const BorderSide(color: Colors.teal),
//                         borderRadius: BorderRadius.circular(50),
//                       ),
//                       label: const Text("Ask MediBot..."),
//                     ),
//                   ),
//                 ),
//                 const Spacer(),
//                 IconButton(
//                   padding: const EdgeInsets.all(15),
//                   iconSize: 30,
//                   style: ButtonStyle(
//                     backgroundColor: MaterialStateProperty.all(Colors.teal),
//                     foregroundColor: MaterialStateProperty.all(Colors.white),
//                     shape: MaterialStateProperty.all(
//                       const CircleBorder(),
//                     ),
//                   ),
//                   onPressed: () {
//                     sendMessage();
//                   },
//                   icon: const Icon(Icons.send),
//                 )
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

// class Messages extends StatelessWidget {
//   final bool isUser;
//   final String message;
//   final String date;
//   const Messages(
//       {super.key,
//       required this.isUser,
//       required this.message,
//       required this.date});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.all(15),
//       margin: const EdgeInsets.symmetric(vertical: 15).copyWith(
//         left: isUser ? 100 : 10,
//         right: isUser ? 10 : 100,
//       ),
//       decoration: BoxDecoration(
//         color: isUser ? Colors.teal : Colors.grey.shade200,
//         borderRadius: BorderRadius.only(
//           topLeft: const Radius.circular(30),
//           bottomLeft: isUser ? const Radius.circular(30) : Radius.zero,
//           topRight: const Radius.circular(30),
//           bottomRight: isUser ? Radius.zero : const Radius.circular(30),
//         ),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             message,
//             style: TextStyle(color: isUser ? Colors.white : Colors.black),
//           ),
//           Text(
//             date,
//             style: TextStyle(color: isUser ? Colors.white70 : Colors.black54),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class Message {
//   final bool isUser;
//   final String message;
//   final DateTime date;

//   Message({
//     required this.isUser,
//     required this.message,
//     required this.date,
//   });
// }

class MedicalBotScreen extends StatefulWidget {
  const MedicalBotScreen({super.key});

  @override
  State<MedicalBotScreen> createState() => _MedicalBotScreenState();
}

class _MedicalBotScreenState extends State<MedicalBotScreen> {
  final TextEditingController _userMessage = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _symptomsController = TextEditingController();
  final TextEditingController _medicalHistoryController =
      TextEditingController();
  //final TextEditingController _allergiesController = TextEditingController();
  //final TextEditingController _chronicDiseasesController = TextEditingController();

  Uint8List? _imageBytes;
  String? _extractedText;
  late Client _client;
  late Storage _storage;
  late Databases _databases;
  bool _isLoading = false;
  String _errorMessage = '';

  static const apiKey = "AIzaSyDZslRsRl9i4-3QhUa1PHmq5QrUw7z4Zs0";
  final model = GenerativeModel(
    model: 'gemini-2.0-flash',
    apiKey: apiKey,
    generationConfig: GenerationConfig(
      temperature: 1,
      topK: 40,
      topP: 0.95,
      maxOutputTokens: 8192,
      responseMimeType: 'text/plain',
    ),
    systemInstruction: Content.system(
        'Act as a licensed health expert or doctor, providing accurate predictions, diagnoses, and medical advice based on patient-provided health records and symptoms.\n\nYou will analyze the provided symptoms and medical history (including but not limited to height, weight, age, gender, allergies, current medical conditions, and chronic ailments) to deliver a well-justified potential diagnosis. Recommend medications where applicable, specifying doses, timing, and additional care instructions tailored to the patient\'s profile. \n\n# Guidelines:\n\n- Reasoning Priority: Always explain the reasoning behind your diagnosis and recommendations before providing the conclusions.\n- Clarity: Avoid complex medical jargon unless absolutely necessary; instead, aim to explain terms in simple language where appropriate.\n- Patient-Centric Recommendations:\n    - Recommend treatments or medications based on the patient\'s allergies, sensitivities, and health record.\n    - Avoid recommending medications that might potentially cause adverse reactions, considering their medical history.\n- Ethical Boundaries:\n    - Always include a disclaimer that the advice provided is not a substitute for in-person consultation with a healthcare professional.\n    - Encourage the patient to seek immediate medical attention if symptoms are severe or if there is uncertainty.\n- Safety First: Never encourage self-diagnosis or suggest treatments for life-threatening conditions without explicitly directing the patient to see a licensed healthcare professional.\n\n# Steps:\n\n1. Analyze the patient’s health record, including symptoms, demographic information, allergies, medical conditions, and chronic ailments.\n2. Determine likely diagnoses or conditions based on provided data.\n3. Recommend suitable medications if applicable, specifying:\n    - Medication name.\n    - Dosage (e.g., mg, ml, tablets).\n    - Timing (e.g., morning, night, after meals).\n4. Add non-medication advice such as lifestyle modifications, dietary recommendations, or follow-up testing if applicable.\n5. Conclude with a disclaimer emphasizing that the advice is based on the given information and is not a substitute for a consultation with a licensed medical professional.\n\n# Output Format:\n\n1. Introduction:\n   - Greet the patient briefly.\n   - Locate symptoms/concerns they presented.\n   - Mention allergies and chronic ailments to show you are considering them.\n\n2. Reasoning:\n   - Provide clear reasoning behind your diagnosis, connecting their symptoms and health record to the potential condition.\n\n3. Diagnosis/Condition:\n   - State the possible condition(s) clearly.\n\n4. Treatment Plan:\n   - Medications (name, dosage, timing, and special instructions).\n   - Non-medication recommendations (e.g., lifestyle changes, suggested tests).\n\n5. Disclaimer:\n   - Include a brief reminder to consult a licensed healthcare professional for an official diagnosis and follow-up care.\n\n# Example:\n\nInput (Patient Health Record):\n- Symptoms: Persistent cough, mild fever, fatigue.  \n- Age: 35  \n- Gender: Male  \n- Weight: 75 kg  \n- Height: 175 cm  \n- Allergies: Penicillin  \n- Medical Condition: Asthma  \n- Chronic Ailments: Seasonal allergic rhinitis  \n\nOutput:\n\nIntroduction:  \nHello! Based on the information you’ve provided, I see that you’re experiencing persistent cough, mild fever, and fatigue. You have asthma and seasonal allergic rhinitis, with a known allergy to penicillin. Let’s analyze your symptoms and provide advice accordingly.  \n\nReasoning:  \nGiven your symptoms of persistent cough, mild fever, and fatigue, it is possible that you are experiencing a respiratory tract infection, such as viral bronchitis or an early stage of another respiratory condition. Considering your asthma, managing inflammation and avoiding additional triggers is crucial. I’ve also noted your penicillin allergy to ensure no contraindicated medications are recommended.  \n\nDiagnosis/Condition:\nThe likely condition is viral bronchitis. Since viral bronchitis is common and often self-limiting, supportive care should help significantly. We’ll discuss treatment options below, but please seek further evaluation for worsening symptoms or any new signs like significant breathlessness or chest pain.  \n\nTreatment Plan:\n- Medications:  \n   - Salbutamol (Albuterol) Inhaler: Use as prescribed by your asthma management plan for bronchospasms.  \n   - Acetaminophen (Paracetamol) 500 mg: Take 1 tablet every 6 hours as needed for fever.  \n   - Guaifenesin 200 mg (Expectorant): Take 1 tablet every 4–6 hours with a full glass of water to alleviate coughing.  \n\n- Non-Medication Advice:  \n   - Stay hydrated by drinking plenty of fluids (water, warm teas, clear broths).  \n   - Use a humidifier in your room to keep the air moist and ease breathing.  \n   - Avoid exposure to allergens or irritants that can further activate asthma symptoms.  \n\nDisclaimer:  \nPlease remember, these recommendations are based on the information you’ve provided and are not a substitute for medical advice from an in-person consultation. If symptoms worsen, develop shortness of breath, or persist beyond 7–10 days, consult a healthcare professional immediately.\n\n# Notes:\n- If an input explicitly lacks essential aspects like allergies or medical history, ask clarifying questions before proceeding.\n- For medications, use placeholders (e.g., [Sample Medication]) if specific drug names are requested but not provided in the input.\n- Avoid recommending overlapping or conflicting medications. Double-check doses and interactions.'),
  );

  final List<Message> _messages = [];
  bool _isCollectingInfo = true;
  final Map<String, String> _userInfo = {};

  Future<void> sendMessage() async {
    if (_isCollectingInfo) {
      collectUserInfo();
    } else {
      final message = _userMessage.text;
      _userMessage.clear();

      setState(() {
        _messages
            .add(Message(isUser: true, message: message, date: DateTime.now()));
      });

      final userInfoString =
          _userInfo.entries.map((e) => "${e.key}: ${e.value}").join(", ");
      final content = [
        Content.text(
            "You are a medical assistant AI. Provide personalized remedies based on the following user information: $userInfoString. "
            "The user's current message is: $message. "
            "Always remind the user to consult with a real doctor for personalized medical advice and that your suggestions are not a substitute for professional medical care.")
      ];
      final response = await model.generateContent(content);
      setState(() {
        _messages.add(Message(
            isUser: false, message: response.text ?? "", date: DateTime.now()));
      });
    }
  }

  void collectUserInfo() {
    if (_heightController.text.isNotEmpty) {
      _userInfo["Height"] = _heightController.text;
    }

    if (_weightController.text.isNotEmpty) {
      _userInfo["Weight"] = _weightController.text;
    }

    if (_ageController.text.isNotEmpty) {
      _userInfo["Age"] = _ageController.text;
    }

    if (_genderController.text.isNotEmpty) {
      _userInfo["Gender"] = _genderController.text;
    }

    if (_symptomsController.text.isNotEmpty) {
      _userInfo["Symptoms"] = _symptomsController.text;
    }

    /*if (_allergiesController.text.isNotEmpty)
      _userInfo["Allergies"] = _heightController.text;

    if (_chronicDiseasesController.text.isNotEmpty)
      _userInfo["Chronic Disease History"] = _heightController.text;*/

    if (_medicalHistoryController.text.isNotEmpty) {
      _userInfo["Other Medical Conditions"] = _medicalHistoryController.text;
    }

    if (_userInfo.length == 6) {
      setState(() {
        _isCollectingInfo = false;
        _messages.add(Message(
            isUser: false,
            message:
                "Thank you for providing your information. How can I assist you today?",
            date: DateTime.now()));
      });
    } else {
      setState(() {
        _messages.add(Message(
            isUser: false,
            message: "Please provide all the required information.",
            date: DateTime.now()));
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _initAppwrite();
  }

  void _initAppwrite() {
    _client = Client()
      ..setEndpoint('https://cloud.appwrite.io/v1')
      ..setProject('67b9a8a900179468f588');
    _storage = Storage(_client);
    _databases = Databases(_client);
  }

  Future<void> _pickImage() async {
    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });

    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.image,
        withData: true,
      );

      if (result != null) {
        setState(() {
          _imageBytes = result.files.first.bytes;
        });
        await _processImage(_imageBytes!);
        await _uploadToAppwrite(_imageBytes!, result.files.first.name);
      } else {
        setState(() {
          _errorMessage = 'No image selected';
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = 'Error picking image: $e';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _processImage(Uint8List imageBytes) async {
    final inputImage = InputImage.fromBytes(
      bytes: imageBytes,
      metadata: InputImageMetadata(
        size: Size(imageBytes.length.toDouble(), imageBytes.length.toDouble()),
        rotation: InputImageRotation.rotation0deg,
        format: InputImageFormat.bgra8888,
        bytesPerRow: imageBytes.length,
      ),
    );

    final textRecognizer = TextRecognizer();
    try {
      final RecognizedText recognizedText =
          await textRecognizer.processImage(inputImage);
      setState(() {
        _extractedText = recognizedText.text;
      });
    } catch (e) {
      setState(() {
        _errorMessage = 'Error processing image: $e';
      });
    } finally {
      textRecognizer.close();
    }
  }

  Future<void> _uploadToAppwrite(Uint8List bytes, String fileName) async {
    try {
      final result = await _storage.createFile(
        bucketId: '67b9a8be0031279f6d06', // Using the correct bucket ID
        fileId: ID.unique(),
        file: InputFile.fromBytes(bytes: bytes, filename: fileName),
      );

      // Store file information in the database
      await _databases.createDocument(
        databaseId: '67bab0c500142572e90b',
        collectionId:
            '67b9a8a900179468f588', // Replace with your actual collection ID
        documentId: ID.unique(),
        data: {
          'file_id': result.$id,
          'file_name': fileName,
          'extracted_text': _extractedText ?? '',
        },
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('File uploaded and data stored successfully')),
      );
    } catch (e) {
      setState(() {
        _errorMessage = 'File uploaded and data stored successfull';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sneh',
        style: TextStyle(color: Colors.white),),
        backgroundColor: const Color.fromARGB(255, 150, 5, 234),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return Messages(
                  isUser: message.isUser,
                  message: message.message,
                  date: DateFormat('HH:mm').format(message.date),
                );
              },
            ),
          ),
          if (_isCollectingInfo) _buildInfoCollectionForm(),
          if (!_isCollectingInfo) _buildChatInput(),
        ],
      ),
    );
  }

  Widget _buildInfoCollectionForm() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextField(
            controller: _heightController,
            decoration: const InputDecoration(labelText: 'Height (cm)'),
            keyboardType: TextInputType.number,
          ),
          TextField(
            controller: _weightController,
            decoration: const InputDecoration(labelText: 'Weight (kg)'),
            keyboardType: TextInputType.number,
          ),
          TextField(
            controller: _ageController,
            decoration: const InputDecoration(labelText: 'Age'),
            keyboardType: TextInputType.number,
          ),
          TextField(
            controller: _genderController,
            decoration: const InputDecoration(labelText: 'Gender'),
          ),
          TextField(
            controller: _symptomsController,
            decoration: const InputDecoration(labelText: 'Symptoms'),
          ),

          /*TextField(
            controller: _allergiesController,
            decoration: InputDecoration(labelText: 'Allergies'),
          ),
          
          TextField(
            controller: _chronicDiseasesController,
            decoration: InputDecoration(labelText: 'Chronic Disease History'),
          ),*/

          TextField(
            controller: _medicalHistoryController,
            decoration:
                const InputDecoration(labelText: 'Other Medical Conditions'),
          ),
          const SizedBox(height: 8),
          Center(
            child: _isLoading
                ? const CircularProgressIndicator()
                : SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        if (_imageBytes != null)
                          Image.memory(_imageBytes!, height: 50),
                        const SizedBox(height: 10),
                        ElevatedButton(
                          onPressed: _pickImage,
                          child: const Text('Upload and Process Image'),
                        ),
                        const SizedBox(height: 20),
                        if (_extractedText != null &&
                            _extractedText!.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              'Extracted Text: $_extractedText',
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                        if (_errorMessage.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              'Message : $_errorMessage',
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                      ],
                    ),
                  ),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: sendMessage,
            style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 162, 4, 215)),
            child: Text('Submit Information',
            style: const TextStyle(color: Colors.white),),
          ),
        ],
      ),
    );
  }

  Widget _buildChatInput() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _userMessage,
              decoration: const InputDecoration(
                hintText: 'Type your message...',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: sendMessage,
            color: const Color.fromARGB(255, 155, 2, 201),
          ),
        ],
      ),
    );
  }
}

class Messages extends StatelessWidget {
  final bool isUser;
  final String message;
  final String date;
  const Messages(
      {super.key,
      required this.isUser,
      required this.message,
      required this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8).copyWith(
        left: isUser ? 40 : 0,
        right: isUser ? 0 : 40,
      ),
      decoration: BoxDecoration(
        color: isUser ? const Color.fromARGB(255, 247, 199, 253) : const Color.fromARGB(255, 248, 142, 254),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            message,
            style: const TextStyle(color: Colors.black87),
          ),
          const SizedBox(height: 4),
          Text(
            date,
            style: const TextStyle(color: Colors.black54, fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class Message {
  final bool isUser;
  final String message;
  final DateTime date;

  Message({
    required this.isUser,
    required this.message,
    required this.date,
  });
}

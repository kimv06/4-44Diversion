// import 'package:flutter/material.dart';
// //import 'package:flutter_local_notifications.dart';

// void main() {
//   runApp(const MedicalChatbotApp());
// }

// class MedicalChatbotApp extends StatelessWidget {
//   const MedicalChatbotApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Medical Chatbot',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const ChatScreen(),
//     );
//   }
// }

// class ChatScreen extends StatefulWidget {
//   const ChatScreen({super.key});

//   @override
//   State<ChatScreen> createState() => _ChatScreenState();
// }

// class _ChatScreenState extends State<ChatScreen> {
//   final List<ChatMessage> _messages = [];
//   final TextEditingController _textController = TextEditingController();
  
//   String _name = "";
//   int _age = 0;
//   String _medications = "";

//   void _handleSubmitted(String text) {
//     _textController.clear();
//     _addMessage(ChatMessage(text: text, isUser: true));

//     // Process user input and generate bot responses
//     String botResponse = _generateBotResponse(text);
//     _addMessage(ChatMessage(text: botResponse, isUser: false));
//   }

//   String _generateBotResponse(String userMessage) {
//     userMessage = userMessage.toLowerCase();

//     if (_name.isEmpty) {
//       _name = userMessage; 
//       return "Hello, $_name! What is your age?";
//     } else if (_age == 0) {
//       try {
//         _age = int.parse(userMessage); 
//         return "Okay, $_age years old. Please list your medications (separated by commas):";
//       } catch (e) {
//         return "Invalid age. Please enter a number.";
//       }
//     } else if (_medications.isEmpty) {
//       _medications = userMessage;
//       return "Thank you. Here are some general recommendations: \n"
//           "Medications: $_medications \n"
//           "Schedule: Take medications as prescribed. Set reminders! \n"
//           "Log: Keep track of your medication intake and any side effects.";
//     } else if (userMessage.contains("reminder")) {
//       return "Reminder set!"; 
//     } else if (userMessage.contains("log")) {
//       return "Log created!"; 
//     } else if (_getMedicineRecommendation(userMessage).isNotEmpty) {
//       return _getMedicineRecommendation(userMessage);
//     } else {
//       return "I can provide information about medications, remedies, and more. Ask me!";
//     }
//   }

//   // New function to provide medicine recommendations
//   String _getMedicineRecommendation(String disease) {
//     if (disease.contains("fever")) {
//       return "For fever, you can take Paracetamol or Ibuprofen. Drink plenty of fluids and rest.";
//     } else if (disease.contains("cold")) {
//       return "For a common cold, try using saline nasal spray, warm fluids, and rest.";
//     } else if (disease.contains("headache")) {
//       return "For headaches, consider using Paracetamol or Ibuprofen. Stay hydrated and avoid stress.";
//     } else if (disease.contains("stomach pain")) {
//       return "For stomach pain, you may try Antacids or Pepto-Bismol. Stay hydrated and avoid spicy food.";
//     } else if (disease.contains("cough")) {
//       return "For a cough, you can use Cough Syrup, Honey & Lemon, or warm salt water gargles.";
//     } else {
//       return "I am not sure about that disease. Could you provide more details?";
//     }
//   }

//   void _addMessage(ChatMessage message) {
//     setState(() {
//       _messages.insert(0, message);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Medical Chatbot'),
//       ),
//       body: Column(
//         children: <Widget>[
//           Expanded(
//             child: ListView.builder(
//               reverse: true,
//               padding: const EdgeInsets.all(8.0),
//               itemCount: _messages.length,
//               itemBuilder: (_, int index) => _messages[index],
//             ),
//           ),
//           _buildTextComposer(),
//         ],
//       ),
//     );
//   }

//   Widget _buildTextComposer() {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 8.0),
//       child: Row(
//         children: <Widget>[
//           Flexible(
//             child: TextField(
//               controller: _textController,
//               onSubmitted: _handleSubmitted,
//               decoration: InputDecoration(
//                 hintText: 'Ask about diseases or send a message...',
//               ),
//             ),
//           ),
//           IconButton(
//             onPressed: () => _handleSubmitted(_textController.text),
//             icon: const Icon(Icons.send),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class ChatMessage extends StatelessWidget {
//   const ChatMessage({super.key, required this.text, required this.isUser});

//   final String text;
//   final bool isUser;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 10.0),
//       child: Row(
//         mainAxisAlignment:
//             isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
//         children: <Widget>[
//           if (!isUser) // Bot message
//             const CircleAvatar(child: Text('Bot')), // Replace with bot avatar
//           Expanded(
//             child: Container(
//               padding: const EdgeInsets.all(10.0),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10.0),
//                 color: isUser ? Colors.blue[100] : Colors.grey[200],
//               ),
//               child: Text(text),
//             ),
//           ),
//           if (isUser) // User message
//             const CircleAvatar(child: Icon(Icons.person)),
//         ],
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MedicalChatbotApp());
// }

// class MedicalChatbotApp extends StatelessWidget {
//   const MedicalChatbotApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Medical Chatbot',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const ChatScreen(),
//     );
//   }
// }

// class ChatScreen extends StatefulWidget {
//   const ChatScreen({super.key});

//   @override
//   State<ChatScreen> createState() => _ChatScreenState();
// }

// class _ChatScreenState extends State<ChatScreen> {
//   final List<ChatMessage> _messages = [];
//   final TextEditingController _textController = TextEditingController();

//   void _handleSubmitted(String text) {
//     if (text.isEmpty) return; // Prevent empty messages
//     _textController.clear();
//     _addMessage(ChatMessage(text: text, isUser:  true));

//     // Generate bot response
//     String botResponse = _generateBotResponse(text);
//     _addMessage(ChatMessage(text: botResponse, isUser:  false));
//   }

//   String _generateBotResponse(String userMessage) {
//     userMessage = userMessage.toLowerCase();

//     if (userMessage.contains("fever")) {
//       return "For fever, you can take Paracetamol or Ibuprofen. Drink plenty of fluids and rest.";
//     } else if (userMessage.contains("cold")) {
//       return "For a common cold, try using saline nasal spray, warm fluids, and rest.";
//     } else if (userMessage.contains("headache")) {
//       return "For headaches, consider using Paracetamol or Ibuprofen. Stay hydrated and avoid stress.";
//     } else if (userMessage.contains("stomach pain")) {
//       return "For stomach pain, you may try Antacids or Pepto-Bismol. Stay hydrated and avoid spicy food.";
//     } else if (userMessage.contains("cough")) {
//       return "For a cough, you can use Cough Syrup, Honey & Lemon, or warm salt water gargles.";
//     } else if (userMessage.contains("reminder")) {
//       return "Reminder set! Please specify what you want to be reminded about.";
//     } else if (userMessage.contains("log")) {
//       return "Log created! Please specify what you want to log.";
//     } else {
//       return "I can provide information about medications, remedies, and more. Ask me!";
//     }
//   }

//   void _addMessage(ChatMessage message) {
//     setState(() {
//       _messages.insert(0, message);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Medical Chatbot'),
//       ),
//       body: Column(
//         children: <Widget>[
//           Expanded(
//             child: ListView.builder(
//               reverse: true,
//               padding: const EdgeInsets.all(8.0),
//               itemCount: _messages.length,
//               itemBuilder: (_, int index) => _messages[index],
//             ),
//           ),
//           _buildTextComposer(),
//         ],
//       ),
//     );
//   }

//   Widget _buildTextComposer() {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 8.0),
//       child: Row(
//         children: <Widget>[
//           Flexible(
//             child: TextField(
//               controller: _textController,
//               onSubmitted: _handleSubmitted,
//               decoration: const InputDecoration(
//                 hintText: 'Ask about diseases or send a message...',
//               ),
//             ),
//           ),
//           IconButton(
//             onPressed: () => _handleSubmitted(_textController.text),
//             icon: const Icon(Icons.send),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class ChatMessage extends StatelessWidget {
//   const ChatMessage({super.key, required this.text, required this.isUser });

//   final String text;
//   final bool isUser ;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 10.0),
//       child: Row(
//         mainAxisAlignment: isUser  ? MainAxisAlignment.end : MainAxisAlignment.start,
//         children: <Widget>[
//           if (!isUser ) // Bot message
//             const CircleAvatar(child: Text('Bot')), // Replace with bot avatar
//           Expanded(
//             child: Container(
//               padding: const EdgeInsets.all(10.0),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10.0),
//                 color: isUser  ? Colors.blue[100] : Colors.grey[200],
//               ),
//               child: Text(text),
//             ),
//           ),
//           if (isUser ) // User message
//             const CircleAvatar(child: Icon(Icons.person)),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

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

  static const apiKey =
      "AIzaSyDZslRsRl9i4-3QhUa1PHmq5QrUw7z4Zs0";
  final model = GenerativeModel(model: 'gemini-pro', apiKey: apiKey);

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
    if (_ageController.text.isNotEmpty) _userInfo["Age"] = _ageController.text;
    if (_genderController.text.isNotEmpty) {
      _userInfo["Gender"] = _genderController.text;
    }
    if (_symptomsController.text.isNotEmpty) {
      _userInfo["Symptoms"] = _symptomsController.text;
    }
    if (_medicalHistoryController.text.isNotEmpty) {
      _userInfo["Medical History"] = _medicalHistoryController.text;
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sneh'),
        backgroundColor: Colors.teal,
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
          TextField(
            controller: _medicalHistoryController,
            decoration: const InputDecoration(labelText: 'Medical History'),
          ),
          const SizedBox(height: 8),

          ElevatedButton(
            onPressed: sendMessage,
            style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
            child: Text('Submit Information'),
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
            color: Colors.teal,
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
        color: isUser ? Colors.teal.shade100 : Colors.grey.shade200,
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

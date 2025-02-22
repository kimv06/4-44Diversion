import 'package:flutter/material.dart';
import 'package:myapp/main.dart';


class InterestSelectionScreen extends StatefulWidget {
  const InterestSelectionScreen({super.key});

  @override
  _InterestSelectionScreenState createState() =>
      _InterestSelectionScreenState();
}

class _InterestSelectionScreenState extends State<InterestSelectionScreen> {
  final List<String> _interests = [
    'Technology',
    'Gaming',
    'Cooking',
    'Travel',
    'Music',
    'Art',
    'Sports',
    'Books',
    'Science',
    'Politics',
    'Business',
    'Photography',
    'Fitness',
    'Fashion',
  ];



final List<String> _selectedInterests = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Select Your Interests')),
      body: Center(
        child: Padding( // Add padding for better layout
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Wrap(
                spacing: 8.0,
                runSpacing: 4.0,
                children: _interests.map((interest) {
                  bool isSelected = _selectedInterests.contains(interest);
                  return FilterChip(
                    label: Text(interest),
                    selected: isSelected,
                    onSelected: (bool selected) {
                      setState(() {
                        if (selected) {
                          _selectedInterests.add(interest);
                        } else {
                          _selectedInterests.remove(interest);
                        }
                      });
                    },
                  );
                }).toList(),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _selectedInterests.isEmpty
                    ? null
                    : () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ContentSuggestionScreen(
                              selectedInterests: _selectedInterests,
                            ),
                          ),
                        );
                      },
                child: Text('Get Suggestions'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ContentSuggestionScreen extends StatelessWidget {
  final List<String> selectedInterests;

  ContentSuggestionScreen({super.key, required this.selectedInterests});

  // Placeholder for content suggestions (REPLACE WITH REAL DATA/API CALL)
  final Map<String, List<String>> _contentSuggestions = {
    'Technology': [
      'Latest smartphone reviews',
      'Artificial intelligence advancements',
      'The future of coding',
    ],
    'Gaming': [
      'New game releases',
      'Esports tournament highlights',
      'Tips and tricks for popular games',
    ],
    // ... Add more suggestions for other interests
    'Cooking': [
        'Easy recipes for beginners',
        'Gourmet cooking techniques',
        'Healthy meal prep ideas',
      ],
      'Travel': [
        'Budget travel tips',
        'Hidden gems around the world',
        'Sustainable tourism destinations',
      ],
      'Music': [
        'New music releases',
        'Interviews with musicians',
        'Music festival guides',
      ],
      'Art': [
        'Famous artists and their works',
        'Art exhibition reviews',
        'DIY art projects',
      ],
      'Sports': [
        'Latest sports news',
        'Highlights from recent games',
        'Fantasy sports analysis',
      ],
      'Books': [
        'Book reviews',
        'Interviews with authors',
        'Book club recommendations',
      ],
      'Science': [
        'Breakthroughs in science',
        'Space exploration updates',
        'The latest on climate change',
      ],
      'Politics': [
        'Analysis of current political events',
        'Interviews with political figures',
        'Debates on important political issues',
      ],
      'Business': [
        'Business news and trends',
        'Tips for entrepreneurs',
        'Investment strategies',
      ],
      'Photography': [
        'Photography tips and techniques',
        'Showcases of amazing photography',
        'Reviews of photography equipment',
      ],
      'Fitness': [
        'Workout routines',
        'Nutrition advice',
        'Mental wellness tips',
      ],
      'Fashion': [
        'Fashion trends',
        'Style guides',
        'Fashion show reviews',
      ],
  };

  @override
  Widget build(BuildContext context) {
    List<String> suggestions = [];

    for (String interest in selectedInterests) {
      if (_contentSuggestions.containsKey(interest)) {
        suggestions.addAll(_contentSuggestions[interest]!);
      }
    }

    return Scaffold(
      appBar: AppBar(title: Text('Content Suggestions')),
      body: GradientBackground(
        child: Center(
          child: suggestions.isEmpty
              ? Text('No suggestions found for your selected interests.')
              : ListView.builder(
                  itemCount: suggestions.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(suggestions[index]),
                      // You can add more details or actions here, e.g., links to content
                    );
                  },
                ),
        ),
      ),
    );
  }
}

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }


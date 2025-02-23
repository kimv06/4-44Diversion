import 'package:flutter/material.dart';
import 'package:myapp/main.dart';
import 'package:url_launcher/url_launcher.dart';

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
    return GradientBackground(
      child: Scaffold(
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
      ),
    );
  }
}

class ContentSuggestionScreen extends StatelessWidget {
  final List<String> selectedInterests;

  ContentSuggestionScreen({super.key, required this.selectedInterests});

  // Placeholder for content suggestions (REPLACE WITH REAL DATA/API CALL)
  final Map<String, List<Map<String, String>>> _contentSuggestions = {
    'Technology': [
      {'title': 'Latest smartphone reviews', 'url': 'https://www.gadgets360.com/mobiles/reviews'},
      {'title': 'Artificial intelligence advancements', 'url': 'https://online-engineering.case.edu/blog/advancements-in-artificial-intelligence-and-machine-learning'},
      {'title': 'The future of coding', 'url': 'https://www.forbes.com/sites/johnwerner/2024/01/24/ai-and-the-future-of-coding/'},
    ],
    'Gaming': [
      {'title': 'New game releases', 'url': 'https://www.metacritic.com/news/major-new-and-upcoming-video-games-ps5-xbox-switch-pc/'},
      {'title': 'Esports tournament highlights', 'url': 'https://www.shutterstock.com/video/search/esports-tournament'},
      {'title': 'Tips and tricks for popular games', 'url': 'https://www.hp.com/ca-en/shop/offer.aspx?p=top-10-gaming-tips-and-tricks-pro'},
    ],
    // ... Add more suggestions for other interests
    'Cooking': [
      {'title': 'Easy recipes for beginners', 'url': 'https://www.allrecipes.com/gallery/easy-dinner-recipes-beginners/'},
      {'title': 'Gourmet cooking techniques', 'url': 'https://chefiq.com/blogs/blog/advanced-cooking-techniques-for-gourmet-dishes?srsltid=AfmBOoro3X-k0m82hEfgCYhCCnWibDqlDJ23JzrGtfgBBz4BDeu-DzDc'},
      {'title': 'Healthy meal prep ideas', 'url': 'https://www.loveandlemons.com/healthy-meal-prep-ideas/'},
    ],
    'Travel': [
      {'title': 'Budget travel tips', 'url': 'https://www.ef.com/wwen/blog/language/how-to-travel-on-a-budget-9-best-tips/'},
      {'title': 'Hidden gems around the world', 'url': 'https://www.wanderlustmagazine.com/inspiration/27-secret-travel-destinations/'},
      {'title': 'Sustainable tourism destinations', 'url': 'https://www.greendestinations.org/top-100-destinations/'},
    ],
    'Music': [
      {'title': 'New music releases', 'url': 'https://www.metacritic.com/browse/albums/release-date/new-releases/date'},
      {'title': 'Interviews with musicians', 'url': 'https://www.npr.org/sections/music-interviews/'},
      {'title': 'Music festival guides', 'url': 'https://www.thatfestivalsite.com/'},
    ],
    'Art': [
      {'title': 'Famous artists and their works', 'url': 'https://artevenue.com/curated-art-prints/world-famous-paintings/?srsltid=AfmBOoqcjt6n7eWPnceHhDtvXLVsWMyIE--W6AHQDsqCOTCS__9kz6VH'},
      {'title': 'Art exhibition reviews', 'url': 'https://www.frieze.com/archive/exhibition-reviews'},
      {'title': 'DIY art projects', 'url': 'https://www.hgtv.com/design/decorating/design-101/diy-wall-art-projects-pictures'},
    ],
    'Sports': [
      {'title': 'Latest sports news', 'url': 'https://www.thehindu.com/sport/'},
      {'title': 'Highlights from recent games', 'url': 'https://www.nfl.com/videos/channel/game-highlights-vc'},
      {'title': 'Fantasy sports analysis', 'url': 'https://www.mordorintelligence.com/industry-reports/fantasy-sports-market'},
    ],
    'Books': [
      {'title': 'Book reviews', 'url': 'https://www.goodreads.com/shelf/show/book-reviews'},
      {'title': 'Interviews with authors', 'url': 'https://www.writersandartists.co.uk/advice/interviews-authors'},
      {'title': 'Book club recommendations', 'url': 'https://www.goodreads.com/shelf/show/book-club'},
    ],
    'Science': [
      {'title': 'Breakthroughs in science', 'url': 'https://www.cas.org/resources/cas-insights/scientific-breakthroughs-2024-emerging-trends-watch'},
      {'title': 'Space exploration updates', 'url': 'https://www.space.com/space-exploration'},
      {'title': 'The latest on climate change', 'url': 'https://www.un.org/en/climatechange/reports'},
    ],
    'Politics': [
      {'title': 'Analysis of current political events', 'url': 'https://indianexpress.com/section/political-pulse/'},
      {'title': 'Interviews with political figures', 'url': 'https://www.thehindu.com/opinion/interview/'},
      {'title': 'Debates on important political issues', 'url': 'https://www.sciencedirect.com/topics/engineering/political-debate'},
    ],
    'Business': [
      {'title': 'Business news and trends', 'url': 'https://www.business-standard.com/'},
      {'title': 'Tips for entrepreneurs', 'url': 'https://www.indeed.com/career-advice/career-development/how-to-be-a-success-entrepreneur'},
      {'title': 'Investment strategies', 'url': 'https://www.cafonline.org/services-for-charities/charity-banking-investments/investments/resources/understanding-strategies-and-styles-of-investing7y'},
    ],
    'Photography': [
      {'title': 'Photography tips and techniques', 'url': 'http://brand.uark.edu/visual-media/tips-for-taking-great-photos.php'},
      {'title': 'Showcases of amazing photography', 'url': 'https://www.forbes.com/sites/ceciliarodriguez/2024/11/22/best-of-nature-20-shortlisted-photos-of-close-up-photographer-of-the-year/'},
      {'title': 'Reviews of photography equipment', 'url': 'https://www.all-things-photography.com/photography-equipment-and-software-reviews/'},
    ],
    'Fitness': [
      {'title': 'Workout routines', 'url': 'https://www.healthline.com/nutrition/workout-routine-for-men'},
      {'title': 'Nutrition advice', 'url': 'https://www.healthline.com/nutrition/27-health-and-nutrition-tips'},
      {'title': 'Mental wellness tips', 'url': 'https://www.nhs.uk/mental-health/self-help/guides-tools-and-activities/five-steps-to-mental-wellbeing/'},
    ],
    'Fashion': [
      {'title': 'Fashion trends', 'url': 'https://www.vogue.com/fashion/trends'},
      {'title': 'Style guides', 'url': 'https://en.wikipedia.org/wiki/List_of_style_guides'},
      {'title': 'Fashion show reviews', 'url': 'https://wwd.com/fashion-news/shows-reviews/'},
    ],
  };

  void _launchURL(String url) async {
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> suggestions = [];

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
                      title: Text(suggestions[index]['title']!),
                      onTap: () => _launchURL(suggestions[index]['url']!),
                    );
                  },
                ),
        ),
      ),
    );
  }
}


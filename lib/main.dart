import 'package:flutter/material.dart';
import 'story_brain.dart';

void main() {
  runApp(Destini());
}

class Destini extends StatelessWidget {
  const Destini({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/destini_app_background.png'),
              fit: BoxFit.cover,
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 50),
          constraints: BoxConstraints.expand(),
          child: SafeArea(
            child: StoryPage(),
          ),
        ),
      ),
    );
  }
}

class StoryPage extends StatefulWidget {
  StoryPage({super.key});

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {

  StoryBrain storyBrain = StoryBrain();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          flex: 6,
          child: Center(
            child: Text(
              storyBrain.getStoryTitle(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
        ),

        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red),
                ),
                child: Text(
                  storyBrain.getStoryChoice1(),
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              onPressed: (){
                  setState(() {
                    storyBrain.nextStory(1);
                  });
              },
            ),
          ),
        ),

        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Visibility(
              visible: storyBrain.buttonShouldBeVisible(),
              child: TextButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),

                ),
                  onPressed: (){
                  setState(() {
                    storyBrain.nextStory(2);
                  });
                  },
                  child: Text(
                    storyBrain.getStoryChoice2(),
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}



import 'package:destini_challenge_starting/choice.dart';
import 'package:destini_challenge_starting/story.dart';
import 'package:flutter/cupertino.dart';


Story s0 = new Story(
    'Your car has blown a tire on a winding road in the middle of nowhere with no cell phone reception. You decide to hitchhike. A rusty pickup truck rumbles to a stop next to you. A man with a wide brimmed hat with soulless eyes opens the passenger door for you and asks: "Need a ride, boy?".',
    new Choice('I\'ll hop in. Thanks for the help!', null),
    new Choice('Better ask him if he\'s a murderer first.', null));

Story s1 = new Story(
    'He nods slowly, unphased by the question.',
    new Choice('At least he\'s honest. I\'ll climb in.', null),
    new Choice('Wait, I know how to change a tire.', null));
Story s2 = new Story(
    'As you begin to drive, the stranger starts talking about his relationship with his mother. He gets angrier and angrier by the minute. He asks you to open the glovebox. Inside you find a bloody knife, two severed fingers, and a cassette tape of Elton John. He reaches for the glove box.',
    new Choice('I love Elton John! Hand him the cassette tape.', null),
    new Choice('It\'s him or me! You take the knife and stab him.', null));
Story s3 = new Story(
    'What? Such a cop out! Did you know traffic accidents are the second leading cause of accidental death for most adult age groups?',
    new Choice('Restart', null),
    new Choice('', null));
Story s4 = new Story(
    'As you smash through the guardrail and careen towards the jagged rocks below you reflect on the dubious wisdom of stabbing someone while they are driving a car you are in.',
    new Choice('Restart', null),
    new Choice('', null));
Story s5 = new Story(
    'You bond with the murderer while crooning verses of "Can you feel the love tonight". He drops you off at the next town. Before you go he asks you if you know any good places to dump bodies. You reply: "Try the pier".',
    new Choice('Restart', null),
    new Choice('', null));


class StoryBrain {

  Story _currentStory = s0;

  StoryBrain(){
    s0.getChoice1().setNextStory(s1);
    s0.getChoice2().setNextStory(s1);
    s1.getChoice1().setNextStory(s2);
    s1.getChoice2().setNextStory(s3);
    s2.getChoice1().setNextStory(s5);
    s2.getChoice2().setNextStory(s4);
    s3.getChoice1().setNextStory(s0);
    s4.getChoice1().setNextStory(s0);
    s5.getChoice1().setNextStory(s0);

    print(buttonShouldBeVisible());
  }

  String getStory() => _currentStory.getStoryTitle();

  String getCurrentChoice1() => _currentStory.getChoice1().getChoice();

  String getCurrentChoice2() => _currentStory.getChoice2().getChoice();

  Story getCurrentStory() => _currentStory;
  void setCurrentStory(Story story) => _currentStory = story;

  void nextStory(int choice){
    print(choice);
    Story nextStory = choice == 1 ? getCurrentStory().getChoice1().getNextStory() : getCurrentStory().getChoice2().getNextStory();
    print(nextStory.getStoryTitle());
    nextStory == null ? reset() : setCurrentStory(nextStory);
  }

  void reset() => setCurrentStory(s0);

  bool buttonShouldBeVisible() => _currentStory.getChoice1().getNextStory() != null && _currentStory.getChoice2().getNextStory() != null;
}

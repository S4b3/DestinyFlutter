import 'story.dart';

class Choice{
  String _choiceText;
  Story _nextStory;

  String getChoice() => _choiceText;
  Story getNextStory() => _nextStory;

  Choice(this._choiceText, this._nextStory);

  void setNextStory(story) => this._nextStory = story;
}

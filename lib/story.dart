import 'package:destini_challenge_starting/choice.dart';

class Story{
  String _storyTitle;
  Choice _choice1;
  Choice _choice2;

  Story(this._storyTitle, this._choice1, this._choice2);

  String getStoryTitle() => _storyTitle;
  Choice getChoice1() => _choice1;
  Choice getChoice2() => _choice2;

}

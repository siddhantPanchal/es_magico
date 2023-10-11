import 'package:es_magico/models/story.dart';
import 'package:flutter/material.dart';

import 'story_widget.dart';

class StoryPreview extends StatelessWidget {
  const StoryPreview({
    super.key,
    required this.story,
  });

  final Story story;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return StoryWidget(story: story);
          },
        );
      },
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: "profile",
              child: DecoratedBox(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).primaryColor,
                    width: 2,
                    strokeAlign: 1,
                  ),
                  shape: BoxShape.circle,
                ),
                child: SizedBox(
                  height: 75,
                  width: 75,
                  child: CircleAvatar(
                    radius: 35,
                    child: Image.asset(story.previewImage, fit: BoxFit.fill),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Text(story.title),
          ],
        ),
      ),
    );
  }
}

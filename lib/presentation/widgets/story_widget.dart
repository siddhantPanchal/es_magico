import 'dart:math' as math;

import 'package:es_magico/common/assets.dart';
import 'package:es_magico/models/story.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class StoryWidget extends StatefulWidget {
  const StoryWidget({
    super.key,
    required this.story,
  });

  final Story story;

  @override
  State<StoryWidget> createState() => _StoryWidgetState();
}

class _StoryWidgetState extends State<StoryWidget> {
  int _currentIndex = 0;

  bool _isDragging = false;

  void _nextImage() {
    if ((_currentIndex + 1) == widget.story.images.length) {
      Navigator.pop(context);
      return;
    }
    setState(() {
      _currentIndex += 1;
    });
  }

  void _previousImage() {
    setState(() {
      _currentIndex = math.max<int>(_currentIndex - 1, 0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: GestureDetector(
        onVerticalDragStart: (details) {
          setState(() {
            _isDragging = true;
          });
        },
        onVerticalDragUpdate: (details) {
          // checking for is dragging and check distance traveled
          if (_isDragging && details.delta.distanceSquared > 50) {
            // checking for the down direction if so then navigate back
            if (details.delta.direction > 0) {
              Navigator.pop(context);
              return;
            }
            // else stop _isDragging and navigate back and then lunch the uri
            setState(() {
              _isDragging = false;
            });
            Navigator.pop(context);
            _lunchUrl(widget.story.offerUri);
          }
        },
        onVerticalDragEnd: (_) {
          setState(() {
            _isDragging = false;
          });
        },
        onVerticalDragCancel: () {
          setState(() {
            _isDragging = false;
          });
        },
        child: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0)
                            .add(const EdgeInsets.only(left: 10)),
                        child: Row(
                          children: [
                            Hero(
                              tag: "profile",
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Theme.of(context).primaryColor,
                                    width: 1,
                                    strokeAlign: 1,
                                  ),
                                  shape: BoxShape.circle,
                                ),
                                child: SizedBox(
                                  child: CircleAvatar(
                                    radius: 20,
                                    child: Image.asset(
                                        widget.story.profileImage,
                                        fit: BoxFit.fill),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              widget.story.title,
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Spacer(),
                            IconButton(
                              icon: const Icon(Icons.bookmark_border_rounded),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: const Icon(Icons.close),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Stack(
                  children: [
                    Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          widget.story.images[_currentIndex],
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20)
                          .add(const EdgeInsets.only(top: 20)),
                      child: Row(
                        children: [
                          for (int index = 0;
                              index < widget.story.images.length;
                              index++) ...[
                            Expanded(
                              flex: 10,
                              child: LinearProgressIndicator(
                                value: _currentIndex >= index ? 100 : 0,
                                minHeight: 10,
                                backgroundColor: Colors.black26,
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            if (index != widget.story.images.length - 1)
                              const Expanded(
                                flex: 1,
                                child: SizedBox(height: 10),
                              ),
                          ],
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                        onTap: _previousImage,
                        child: ColoredBox(
                          color: Colors.transparent,
                          child: SizedBox(
                            width: 80,
                            height: MediaQuery.of(context).size.height * 0.8,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: _nextImage,
                        child: ColoredBox(
                          color: Colors.transparent,
                          child: SizedBox(
                            width: 80,
                            height: MediaQuery.of(context).size.height * 0.8,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  _lunchUrl(widget.story.offerUri);
                },
                child: SizedBox(
                  height: 80,
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Image.asset(
                          ProjectAssets.swipeUpBGImg,
                          scale: 1,
                        ),
                      ),
                      Positioned(
                        top: 5,
                        left: MediaQuery.of(context).size.width * 0.39,
                        child: Column(
                          children: [
                            Image.asset(
                              ProjectAssets.swipeUpImg,
                              scale: 1,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              "swipe up",
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5),
                            const Text("grab this offer"),
                          ],
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
    );
  }

  Future<void> _lunchUrl(Uri uri) async {
    var of = ScaffoldMessenger.of(context);
    if (!await canLaunchUrl(uri)) {
      of
        ..hideCurrentSnackBar()
        ..showSnackBar(
          const SnackBar(
            content: Text("Cannot launch url"),
          ),
        );
      return;
    }
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }
}

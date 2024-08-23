import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';


import 'color1.dart';
import 'color10.dart';
import 'pollpage.dart';


class PollDetails extends StatefulWidget {
  final String question;
  final List<String> choices;
  final DateTime selectedDate;
  final TimeOfDay selectedTime;

  const PollDetails({
    super.key,
    required this.question,
    required this.choices,
    required this.selectedDate,
    required this.selectedTime,
  });

  @override
  _PollDetailsState createState() => _PollDetailsState();
}

class _PollDetailsState extends State<PollDetails> with SingleTickerProviderStateMixin {
  int likeCount = 0;
  bool isLiked = true;
  int? _selectedChoiceIndex;
  List<int> _votes = [];
  bool _voted = false;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _votes = List<int>.filled(widget.choices.length, 0);
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  void _vote(int index) {
    setState(() {
      _selectedChoiceIndex = index;
      _votes[index] += 1;
      _voted = true;
    });
    _controller.forward(); // Start the animation after voting
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Polling Booth')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Question: ${widget.question}",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text(
              "Choices:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            for (var i = 0; i < widget.choices.length; i++)
              GestureDetector(
                onTap: () {
                  if (!_voted) {
                    _vote(i);
                  }
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: _selectedChoiceIndex == i
                        ? Colors.blueAccent.withOpacity(0.8)
                        : Colors.grey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.choices[i],
                        style: const TextStyle(fontSize: 18),
                      ),
                      if (_voted)
                        AnimatedBuilder(
                          animation: _controller,
                          builder: (context, child) {
                            return Text(
                              "${(_votes[i] / _votes.reduce((a, b) => a + b) * 100).toStringAsFixed(1)}%",
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            );
                          },
                        ),
                    ],
                  ),
                ),
              ),///
            const SizedBox(height: 20),
            Text(
              "Poll Date: ${widget.selectedDate.toLocal()}".split(' ')[0],
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              "Poll Time: ${widget.selectedTime.format(context)}",
              style: const TextStyle(fontSize: 18),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                LikeButton(
                  // size: 20,
                  isLiked: isLiked,
                  likeCount: likeCount,
                  likeBuilder: (bool isLiked) {
                    return Icon(
                      CupertinoIcons.heart,
                      color: isLiked ? Colors.blue : Colors.grey,
                      size: 40,
                    );
                  },
                  countBuilder: (int? count, bool isLiked, String text) {
                    var color = isLiked ? Colors.blue : Colors.grey;
                    Widget result;
                    if (count == 0) {
                      result = Text(
                        "",
                        style: TextStyle(color: color),
                      );
                    } else {
                      result = Text(
                        text,
                        style: TextStyle(color: color),
                      );
                    }
                    return result;
                  },
                  onTap: (bool isLiked) async {
                    this.isLiked = !isLiked;
                    likeCount += this.isLiked ?1:0;
                    setState(() {});
                    return this.isLiked;
                  },
                ),
                IconButton(onPressed: (){},icon: Icon(CupertinoIcons.repeat,color: bac,)),
                IconButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>pollpage()));
                },icon: Icon(Icons.comment,color: bac,)),
                IconButton(onPressed:(){},icon: Icon(Icons.share,color: bac,)),
                IconButton(onPressed: (){},icon: Icon(Icons.bookmark,color: bac,)),

              ],
            )
          ],
        ),
      ),
    );
  }
}
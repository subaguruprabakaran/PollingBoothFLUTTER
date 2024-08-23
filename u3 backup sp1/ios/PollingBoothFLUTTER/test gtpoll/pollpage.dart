import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import 'color1.dart';
import 'color10.dart';

class pollpage extends StatefulWidget {
  const pollpage({super.key});

  @override
  State<pollpage> createState() => _pollpageState();
}

class _pollpageState extends State<pollpage> {
  final TextEditingController _commentController = TextEditingController();
  final TextEditingController _replyController = TextEditingController();
  final List<Comment> _comments = [];
  var _replyingToCommentIndex;


  void _addComment(String text, [int? parentId]) {
    final newComment = Comment(
      id: Uuid().v4(),
      userName: 'User ${_comments.length + 1}',
      commentText: text,
      commentTime: DateTime.now(),
    );
    setState(() {
      if (parentId == null) {
        _comments.add(newComment);
      } else {
        final parentComment = _comments.firstWhere((comment) => comment.id == parentId);
        parentComment.replies.add(newComment);
      }
    });
    _commentController.clear();
    _replyingToCommentIndex = null;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bac,
      appBar: AppBar(
        backgroundColor: bac,
        title: Text("Poll",style: TextStyle(fontWeight: FontWeight.w800,color: Colors.white),),
      ),
      body: Column(
        children: [
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //Text("Question",style: TextStyle(color: Colors.black),),
                  SizedBox(
                    height: 20,
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.start,
                  //   children: [
                  //     Padding(
                  //       padding: const EdgeInsets.all(8.0),
                  //       child: CircleAvatar(),
                  //     ),
                  //     Text(name[index],style: TextStyle(color: Colors.black),),
                  //     Icon(Icons.verified_outlined,color: Colors.black,),
                  //
                  //     Row(
                  //       children: [
                  //         ElevatedButton(
                  //             style: ElevatedButton.styleFrom(
                  //                 shape: RoundedRectangleBorder(
                  //                   borderRadius: BorderRadius.circular(10),
                  //
                  //                 ),
                  //                 backgroundColor: headercolo
                  //             ),
                  //             onPressed: (){
                  //               Navigator.push(context, MaterialPageRoute(builder: (context)=>userdraw()));
                  //             }, child: Text("Following",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)),
                  //         Icon(Icons.more_vert,color: Colors.black,),
                  //       ],
                  //     ),
                  //   ]
                  // ),
                  Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      child:ListTile(
                        leading: CircleAvatar(
                          radius: 20,
                        ),
                        title: Text("akash"),
                        trailing: Container(height: 50,
                            width:150,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ElevatedButton(onPressed: (){}, child: Text("Following")),
                                Icon(Icons.more_vert)
                              ],

                            )),
                      )
                  ),
                  Text("this or that",style: TextStyle(color: Colors.black),),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: "test1",
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          hintText: "test2",
                          filled: true,
                          border: OutlineInputBorder()

                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.white
                              )
                          )
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(onPressed: (){},icon: Icon(CupertinoIcons.heart,color: bac,)),
                        IconButton(onPressed: (){},icon: Icon(CupertinoIcons.repeat,color: bac,)),
                        IconButton(onPressed: (){},icon: Icon(Icons.comment,color: bac,)),
                        IconButton(onPressed: (){},icon: Icon(Icons.share,color: bac,)),
                        IconButton(onPressed: (){},icon: Icon(Icons.bookmark,color: bac,)),
                      ],
                    ),
                  ),

                ],
              ),
            ),
          ),
          Divider(),
          Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: Container(
                      height: 300,
                      child: ListView.builder(
                        itemCount: _comments.length,
                        itemBuilder: (context, index) {
                          final comment = _comments[index];
                          return _buildComment(comment,); // Start with depth 0
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(

                            controller: _commentController,
                            decoration: InputDecoration(
                                fillColor: Colors.white,
                                hintText: _replyingToCommentIndex == null
                                    ? 'Add a comment...'
                                    : 'Replying...',
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.white
                                    )
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.white
                                    )
                                )
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.send,color: Colors.white,),
                        onPressed: () {
                          if (_commentController.text.isNotEmpty) {
                            _addComment(_commentController.text, _replyingToCommentIndex);
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ]
          )
        ],
      ),
    );
  }
}


Widget _buildComment(Comment comment,  {int depth = 0}) {
  return Padding(
    padding: EdgeInsets.only(left: depth * 20.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          leading: CircleAvatar(
            child: Text(comment.userName[0]),
          ),
          title: Text(comment.userName),
          subtitle: Text(comment.commentText),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '${comment.commentTime.hour}:${comment.commentTime.minute}',
                style: TextStyle(fontSize: 12),
              ),
              IconButton(
                icon: Icon(Icons.reply),
                onPressed: () {
                  // _replyingToCommentIndex = null;
                },
              ),
              IconButton(onPressed: (){}, icon: Icon(Icons.more_vert))
            ],
          ),
        ),
        // Display replies recursively
        if (comment.replies.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Column(
              children: comment.replies
                  .map((reply) => _buildComment(reply, depth: depth + 1))
                  .toList(),
            ),
          ),
        Divider(),
      ],
    ),
  );
}
class Comment {
  final String id;
  final String userName;
  final String commentText;
  final DateTime commentTime;
  final List<Comment> replies;

  Comment({
    required this.id,
    required this.userName,
    required this.commentText,
    required this.commentTime,
    this.replies = const [],
  });
}
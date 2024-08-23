import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';


import 'color10.dart';
import 'createrdpoll1.dart';
import 'newpoll1.dart';
import 'pollpage.dart';
import 'userprofile1.dart';
import 'usersign1.dart';


class userdraw extends StatefulWidget {
  final String question;
  final List<String> choices;
  final DateTime selectedDate;
  final TimeOfDay selectedTime;

  const userdraw({
    super.key,
    required this.question,
    required this.choices,
    required this.selectedDate,
    required this.selectedTime,
  });

  @override
  State<userdraw> createState() => _userdrawState();
}

class _userdrawState extends State<userdraw>
    with SingleTickerProviderStateMixin {
  int likeCount = 0;
  bool isLiked = true;
  int? _selectedChoiceIndex;
  List<int> _votes = [];
  bool _voted = false;
  late AnimationController _controller;
  List ques = [
    "which is best",
    "which has more power",
    "this or that",
    "english or spanish",
  ];
  List name=[
    "akash",
    "rishi",
    "mithun",
    "rohit",
  ];
  List op = ["android", "ktm", "choco","english",];
  List op1 = ["ios", "yamaha", "vennila","spanish",];


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
    return SafeArea(
      child: Scaffold(
        // floatingActionButton: Icon(CupertinoIcons.plus,size: 35,),
          backgroundColor: bac,
          appBar: AppBar(
            backgroundColor: bac,
            title: Text(
              "POLlING BOOTH",
              style:
              TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          drawer: Drawer(
              backgroundColor: Colors.white,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "SETTINGS",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Icon(
                    Icons.poll,
                    size: 80,
                    color: bac,
                  ),
                  Card(
                    elevation: 20,
                    color: Colors.white,
                    shadowColor: bac,
                    child: ListTile(
                      leading: Icon(
                        Icons.list,
                        color: Colors.black,
                      ),
                      title: Text(
                        "Poll List",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.chevron_right_sharp),
                        color: Colors.black,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NewPolled()));
                        },
                      ),
                    ),
                  ),

                  ///poll list
                  Card(
                    elevation: 20,
                    color: Colors.white,
                    shadowColor: bac,
                    child: ListTile(
                      leading: Icon(
                        Icons.add,
                        color: Colors.black,
                      ),
                      title: Text(
                        "Add Poll",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.chevron_right_sharp),
                        color: Colors.black,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NewPolled()));
                        },
                      ),
                    ),
                  ),

                  ///add poll
                  Card(
                    elevation: 20,
                    color: Colors.white,
                    shadowColor: bac,
                    child: ListTile(
                      leading: Icon(
                        Icons.verified_outlined,
                        color: Colors.black,
                      ),
                      title: Text(
                        "Voted Polls",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.chevron_right_sharp),
                        color: Colors.black,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>   Createdpoll()));
                        },
                      ),
                    ),
                  ),

                  ///Voted polls
                  Card(
                    elevation: 20,
                    color: Colors.white,
                    shadowColor: bac,
                    child: ListTile(
                      leading: Icon(
                        Icons.person,
                        color: Colors.black,
                      ),
                      title: Text(
                        "User Details",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.chevron_right_sharp),
                        color: Colors.black,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UserProfilePage()));
                        },
                      ),
                    ),
                  ),

                  ///user details
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          backgroundColor: sinupbutton),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => usersign()));
                      },
                      child: Text(
                        "Log out",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      )),
                ],
              )),
          body: Container(
            height: double.infinity,
            child: ListView.builder(
                itemCount: ques.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                height: 50,
                                width: MediaQuery.of(context).size.width,
                                child: ListTile(
                                  leading: CircleAvatar(
                                    radius: 20,
                                  ),
                                  title: Text(name[index]),
                                  trailing: Container(
                                      height: 50,
                                      width: 150,
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                        children: [
                                          ElevatedButton(
                                              onPressed: () {},
                                              child: Text("Following")),
                                          Icon(Icons.more_vert)
                                        ],
                                      )),
                                )),
                            Text(
                              ques[index],
                              style: const TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 20),
                            const Text(
                              "Choices:",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 10),
                            TextFormField(
                                decoration: InputDecoration(
                                    hintText: op[index],
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.white)
                                    ), enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black
                                    )
                                )
                                )
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                                decoration: InputDecoration(
                                    hintText: op1[index],
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.white)
                                    ), enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black
                                    )
                                )
                                )
                            ),

                            ///
                            const SizedBox(height: 20),
                            Text(
                              "Poll Date: ${widget.selectedDate.toLocal()}"
                                  .split(' ')[0],
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
                                      color: isLiked ? Colors.red : bac,
                                      size: 30,
                                    );
                                  },
                                  countBuilder:
                                      (int? count, bool isLiked, String text) {
                                    var color =
                                    isLiked ? Colors.blue : Colors.white;
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
                                    likeCount += this.isLiked ? 1 : 0;
                                    setState(() {});
                                    return this.isLiked;
                                  },
                                ),
                                // IconButton(onPressed: (){},icon: Icon(CupertinoIcons.repeat,color: back,)),
                                IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => pollpage()));
                                    },
                                    icon: Icon(
                                      Icons.comment,
                                      color: bac,
                                    )),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.share,
                                      color: bac,
                                    )),
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.bookmark,
                                      color: bac,
                                    )),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          )),
    );
  }
}
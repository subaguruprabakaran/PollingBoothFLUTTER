import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'color1.dart';
import 'color10.dart';

class Createdpoll extends StatefulWidget {
  const Createdpoll({super.key});

  @override
  State<Createdpoll> createState() => _CreatedpollState();
}

class _CreatedpollState extends State<Createdpoll> {
  Uint8List? _image;

  @override
  void initState() {
    super.initState();
    _loadImage();
  }

  Future<void> _selectImage() async {
    final picker = ImagePicker();
    final pickedImage = await showDialog<ImageSource>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Select image from:'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, ImageSource.gallery),
            child: Text('Gallery'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, ImageSource.camera),
            child: Text('Camera'),
          ),
          TextButton(
            onPressed: () {
              _deleteImage();
              Navigator.pop(context);
            },
            child: Text('Delete'),
          ),
        ],
      ),
    );

    if (pickedImage != null) {
      final pickedFile = await picker.pickImage(source: pickedImage);
      if (pickedFile != null) {
        final bytes = await File(pickedFile.path).readAsBytes();
        setState(() {
          _image = bytes;
        });
        _saveImage(bytes);
      }
    }
  }

  Future<void> _saveImage(Uint8List bytes) async {
    final prefs = await SharedPreferences.getInstance();
    final base64String = base64Encode(bytes);
    await prefs.setString('profile_image', base64String);
  }

  Future<void> _loadImage() async {
    final prefs = await SharedPreferences.getInstance();
    final base64String = prefs.getString('profile_image');
    if (base64String != null) {
      setState(() {
        _image = base64Decode(base64String);
      });
    }
  }

  Future<void> _deleteImage() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('profile_image');
    setState(() {
      _image = null;
    });
  }

  Future<Uint8List> loadImage(String path) async {
    final ByteData data = await rootBundle.load(path);
    return data.buffer.asUint8List();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: bac,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),

          title: Center(
            child: Text(
              "Created Polls and Voted Polls",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,color: Colors.white),
            ),
          ),
        ),
        backgroundColor: bac,
        body:
        Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 20,
                shadowColor: Colors.black,
                color: Colors.white,
                child: Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          "Naruto",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        Divider(
                          height: 20,
                          color: Colors.grey,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              children: [
                                Text(
                                  "1",
                                  style: TextStyle(
                                      fontSize: 15, fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Posts",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 15),
                                )
                              ],
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              children: [
                                Text(
                                  "1",
                                  style: TextStyle(
                                      fontSize: 15, fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Followers",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 15),
                                )
                              ],
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              children: [
                                Text(
                                  "0",
                                  style: TextStyle(
                                      fontSize: 15, fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Following",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 15),
                                )
                              ],
                            ),
                          ],
                        ),
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextButton(onPressed: (){},child: Text(
                              "User Details",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold,color: Colors.black),
                            ),
                            )
                        )
                      ],
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Column(
                      children: [
                        Stack(
                          children: [
                            _image != null
                                ? CircleAvatar(
                              radius: 45,
                              backgroundImage: MemoryImage(_image!),
                            )
                                : CircleAvatar(
                              radius: 45,
                              backgroundColor: Colors.grey,
                            ),
                            Positioned(
                                top: 50,
                                left: 50,
                                child: CircleAvatar(
                                    radius: 19,
                                    backgroundColor: bac,
                                    child: IconButton(
                                        onPressed: _selectImage,
                                        icon: Icon(
                                          Icons.camera_alt_rounded,
                                          color: Colors.white,
                                        ))))
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),

            Row(
              children: [
                SizedBox(width: 30,),
                IconButton(
                    onPressed: (){}, icon: Icon(Icons.poll_rounded,color: Colors.white,size: 40,)),
                SizedBox(
                  width: 30,
                ),
                IconButton(
                    onPressed: (){}, icon: Icon(Icons.how_to_vote_rounded,color: Colors.white,size: 40,)),
                SizedBox(
                  width: 30,
                ),
                IconButton(
                    onPressed: (){}, icon: Icon(Icons.thumb_up_alt_rounded,color: Colors.white,size: 40,)),
                SizedBox(
                  width: 30,
                ),
                IconButton(
                    onPressed: (){}, icon: Icon(Icons.comment_rounded,color: Colors.white,size: 40,)),
                SizedBox(
                  width: 30,
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),

            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Text("Created Polls",style: TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.bold),),
                SizedBox(
                  width: 10,
                ),
                Text("Voted Polls",style: TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.w600),),
                SizedBox(width: 10,),
                Text("Liked Polls",style: TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.w600),),
                SizedBox(width: 10,),
                Text("Commented Polls",style: TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.w600),),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text("Created Polls",style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white,fontSize: 20),),
            ExpansionTile(title: Text("Test",style: TextStyle(),),children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text("   a"),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text("   c"),

                      ],
                    ),
                  )
                ],
              )
            ],),
            Divider(
              height: 20,
            ),
            Text("Voted Polls",style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white,fontSize: 20),),
            ExpansionTile(title: Text("Test",style: TextStyle(),),children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text("   a"),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text("   c"),

                      ],
                    ),
                  )
                ],
              )
            ],),
          ],
        ),
      ),
    );
  }
}
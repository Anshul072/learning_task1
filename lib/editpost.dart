import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditPost extends StatefulWidget {
  @override
  _EditPostState createState() => _EditPostState();
}
class _EditPostState extends State<EditPost> {

  late TextEditingController myControllerTitle;
  late TextEditingController myControllerDescription;
  late TextEditingController myControllerImgUrl;
  @override

  void dispose() {
    // Clean up the controller when the widget is disposed.
    myControllerTitle.dispose();
    myControllerDescription.dispose();
    myControllerImgUrl.dispose();
    super.dispose();
  }
  bool emptyValidation =true;

  void addPostFunc() {
    if (myControllerTitle.text.isNotEmpty &&
        myControllerDescription.text.isNotEmpty &&
        myControllerImgUrl.text.isNotEmpty) {
      Navigator.pop(context, {
        'title': myControllerTitle.text,
        'description': myControllerDescription.text,
        'imgUrl': myControllerImgUrl.text,
      });
      emptyValidation=true;
    }
    else {
      emptyValidation=false;
    }
  }

  @override
  Widget build(BuildContext context) {
    Map data={};
    data= data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments as Map;
    myControllerTitle= TextEditingController(text: data['title']);
    myControllerDescription=TextEditingController(text: data['description']);
    myControllerImgUrl=TextEditingController(text: data['imgUrl']);
    return Material(
      child: Form(
        child: SafeArea(
          child: ListView(
            children: [Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter title',
                  ),
                  controller: myControllerTitle,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter description',
                  ),
                  controller: myControllerDescription,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter image Url',
                  ),
                  controller: myControllerImgUrl,
                ),

                Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: (){
                          addPostFunc();
                          if(emptyValidation==false){
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: Text('field cannot be empty'),
                                );
                              },
                            );
                          }
                        },
                        child: Text('  add post'),
                      ),
                    ]
                )
              ],
            ),
            ],
          ),
        ),
      ),
    );
  }
}




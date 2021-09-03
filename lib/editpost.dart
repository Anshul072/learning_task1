import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:validators/validators.dart';

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
  bool urlValidation =true;
  void addPostFunc() {
    urlValidation = isURL(myControllerImgUrl.text);
    emptyValidation = myControllerTitle.text.isNotEmpty &&
        myControllerDescription.text.isNotEmpty &&
        myControllerImgUrl.text.isNotEmpty;
    if ( emptyValidation && urlValidation ) {
      Navigator.pop(context, {
        'title': myControllerTitle.text,
        'description': myControllerDescription.text,
        'imgUrl': myControllerImgUrl.text,
      });
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
          child: Padding(
            padding: const EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 0.0),
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
                  SizedBox(height: 5.0,),
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
                            if(urlValidation==false && emptyValidation==true)
                            {
                              showDialog(
                                  context: context,
                                  builder:(context){
                                    return AlertDialog(
                                      content: Text('invalid url'),
                                    );
                                  }
                              );
                            }
                            if(emptyValidation==false && urlValidation==true){
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    content: Text('field cannot be empty'),
                                  );
                                },
                              );
                            }
                            if(emptyValidation==false && urlValidation==false){
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    content: Text('field cannot be empty and invalid url'),
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
      ),
    );
  }
}




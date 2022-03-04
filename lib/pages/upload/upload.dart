import 'dart:io';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:frontend/pages/shared/config.dart';
import 'package:frontend/pages/shared/themes.dart';
import 'package:frontend/services/httppost.dart';
import 'package:image_picker/image_picker.dart';
import 'package:motion_toast/motion_toast.dart';

class Upload extends StatefulWidget {
  const Upload({Key? key}) : super(key: key);

  @override
  _UploadState createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  final _formkey = GlobalKey<FormState>();
  File? _image;

   String content = '';


  @override
  void initState() {
    super.initState(); 
    _image = null;
  }

    Future<String?> createPost(String content, String userId) {
    var res = HttpConnectPost().createPosts(content, userId);
    return res;
  }

    Future<String?> updatePost(String content, String userId) {
    var res = HttpConnectPost().updatePosts(content, userId);
    return res;
  }


  _imageFromGallery() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _image = File(image!.path);
    });
  }

  _imageFromCamera() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      _image = File(image!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload Post'),),
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Form(
                    key: _formkey,
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          child: Text(
                            'Add New Post',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: blueColor,
                                letterSpacing: 5.0),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Stack(
                          children: [
                            AspectRatio( 
                              aspectRatio: 1,
                              child: Container(
                                key:  const Key('image'),
                                decoration: BoxDecoration(
                                
                            
                                  image: _image != null
                                      ? DecorationImage(
                                          image: FileImage(_image!),
                                          fit: BoxFit.cover)
                                      : const DecorationImage(
                                        
                                          image: AssetImage(
                                              'assets/images/noImageSelected.jpg',
                                              
                                              ),
                                        ),
                                ),
                            
                            
                                child: InkWell(
                                  key: const Key('inkwell'),
                                  onTap: () {
                                    showModalBottomSheet(
                                        context: context,
                                        builder: (builder) => bottomSheet());
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      SizedBox(
                                        height: 40,
                                      ),
                                      Icon(
                                        Icons.upload,
                                        color: Colors.red,
                                        size: 30,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          key:  Key('sizedbox'),
                          height: 20),
                        TextFormField(
                          key: const Key('content'),
                          onSaved: (value) {
                            content = value!;
                          },
                          validator: RequiredValidator(errorText: "required field"),
                          decoration: const InputDecoration(
                              labelText: 'Add the post caption',
                              hintText: 'Enter new caption',
                              border: OutlineInputBorder()),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          key: const Key('postButton'),
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(double.infinity, 50),
                          ),
                          onPressed: () async{
                             if (_formkey.currentState!.validate()) {
                              _formkey.currentState!.save();
                             
                           
                            await HttpConnectPost().createPosts(content, 
                              Config.userId); 
                                // content: content,
                                // user: "61ba2991ffa8a257546e32f0",
                                  AwesomeNotifications().createNotification(
                                      content: NotificationContent(
                                    id: 1,
                                    channelKey: 'letsconnect', 
                                    title: 'Success',
                                    body: 'Post created successfully',
                                  ));
                          
                      
                              MotionToast.success(
                                  description: const Text("Post Created")).show(context);
                         
                            
                            }
                          }, 
                          child: const Text('Add Post'),
                        ),
                      ],
                    )),
              ), 
            ],
          ),
        ],
      ),
    );
  }

//widget to build a bottomsheet for image
  Widget bottomSheet() {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          const Text(
            'Choose post photo',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  _imageFromCamera();
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.camera),
                label: const Text('Camera'),
              ),
              const SizedBox(
                width: 20,
              ),
              ElevatedButton.icon(
                onPressed: () {
                  _imageFromGallery();
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.image),
                label: const Text('Gallery'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

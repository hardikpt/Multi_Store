import 'dart:io';

import 'package:flutter/material.dart';
import 'package:multi_score/widgets/auth_widgets.dart';
import 'package:image_picker/image_picker.dart';
import '../widgets/snackbar.dart';

class CustomerRagister extends StatefulWidget {
  const CustomerRagister({super.key});

  @override
  State<CustomerRagister> createState() => _CustomerRagisterState();
}

class _CustomerRagisterState extends State<CustomerRagister> {
  void showSnackBar() {
    _scaffoldkey.currentState!.hideCurrentSnackBar();
    _scaffoldkey.currentState!.showSnackBar((const SnackBar(
        duration: Duration(seconds: 2),
        backgroundColor: Colors.blue,
        content: Text(
          'please fill all fields',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18, color: Colors.white),
        ))));
  }

  late String name;
  late String email;
  late String password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldMessengerState> _scaffoldkey =
      GlobalKey<ScaffoldMessengerState>();
  bool passwordvisible = false;


  final ImagePicker _picker = ImagePicker();
  XFile? _imageFile;
  dynamic _pickedImageError;

  void _pickImageFromCamera() async {
    try {
      final pickImage = await _picker.pickImage(
          source: ImageSource.camera,
          maxHeight: 300,
          maxWidth: 300,
          imageQuality: 95);
      setState(() {
        _imageFile = pickImage;
      });
    } catch (e) {
      setState(() {
        _pickedImageError = e;
      });
      print(_pickedImageError);
    }
  }

  void _pickImageFromGallary() async {
    try {
      final pickImage = await _picker.pickImage(
          source: ImageSource.gallery,
          maxHeight: 300,
          maxWidth: 300,
          imageQuality: 95);
      setState(() {
        _imageFile = pickImage;
      });
    } catch (e) {
      setState(() {
        _pickedImageError = e;
      });
      print(_pickedImageError);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: _scaffoldkey,
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              reverse: true,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const AuthHeaderLabel(headerLabel: 'Sign Up'),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 40),
                            child: CircleAvatar(
                              radius: 60,
                              backgroundColor: Colors.blueAccent,
                              backgroundImage: _imageFile == null ? null:FileImage(File(_imageFile!.path)),
                            ),
                          ),
                          Column(
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        topRight: Radius.circular(15))),
                                child: IconButton(
                                  icon: const Icon(
                                    Icons.camera_alt,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                    _pickImageFromCamera();
                                  },
                                ),
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(15),
                                        bottomRight: Radius.circular(15))),
                                child: IconButton(
                                  icon: const Icon(
                                    Icons.photo,
                                    color: Colors.white,
                                  ),
                                  onPressed: () {
                                  _pickImageFromGallary();
                                  },
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Your Full Name';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            name = value;
                          },
                          //controller: _namecontroller,
                          decoration: textFormDecoration.copyWith(
                            labelText: 'Full Name',
                            hintText: 'Enter Your Full Name',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Your email';
                            } else if (value.isValidEmail() == false) {
                              return 'invalid email';
                            } else if (value.isValidEmail() == true) {
                              return null;
                            }
                            return null;
                          },
                          onChanged: (value) {
                            email = value;
                          },
                          // controller: _emailcontroller,
                          keyboardType: TextInputType.emailAddress,
                          decoration: textFormDecoration.copyWith(
                            labelText: 'Email Address',
                            hintText: 'Enter Your Email',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Your Password';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            password = value;
                            print(password);
                          },
                          //controller: _passwordcontroller,
                          obscureText: passwordvisible,
                          decoration: textFormDecoration.copyWith(
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    passwordvisible = !passwordvisible;
                                  });
                                },
                                icon: Icon(
                                  passwordvisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.green,
                                )),
                            labelText: 'Password',
                            hintText: 'Enter Your Password',
                          ),
                        ),
                      ),
                      HaveAccount(
                        haveAccount: 'already have a account?',
                        actionLabel: 'Log In',
                        onPressed: () {},
                      ),
                      AuthMainButton(
                        mainButtonLabel: 'Sign Up',
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            if(_imageFile!=null){
                              print('valid');
                              _formKey.currentState!.reset();
                              setState(() {
                                _imageFile = null;
                              });
                            }else{
                              MyMessageHandler.showSnackBar(
                                  _scaffoldkey, 'please pick image first');
                            }
                          } else {
                            MyMessageHandler.showSnackBar(
                                _scaffoldkey, 'please fill all fields');
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:shared_preferences/shared_preferences.dart';
import 'package:uni/db/student.dart';
import 'package:uni/screens/student_register.dart';
import 'package:uni/screens/student.dart';
import 'package:uni/utils/navigations.dart';
import 'package:uni/widgets/custom_text.dart';
import 'package:uni/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class StudentLogin extends StatefulWidget {
  const StudentLogin({Key? key}) : super(key: key);

  @override
  State<StudentLogin> createState() => _StudentLoginState();
}

late SharedPreferences sharedPreferences;

class _StudentLoginState extends State<StudentLogin> {
  StudentsServices studentsServices = StudentsServices();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String email = '', password = '';

  bool hide = true;

  TextEditingController? emailController,
      passwordController = TextEditingController();

  @override
  void initState() {
    init();
    super.initState();
  }

  void init() async {
    SharedPreferences.getInstance().then((prefs) {
      sharedPreferences = prefs;
      if (sharedPreferences.getString('id') != null) {
        changeScreenReplacement(context, const Student());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text("Login"),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            const SizedBox(
              height: 60,
            ),
            Image(
              image: const AssetImage("images/icon.jpg"),
              width: MediaQuery.of(context).size.width * 0.75,
            ),
            CustomTextField(
                hintText: "E-mail",
                controller: emailController,
                icon: Icons.email,
                align: TextAlign.start,
                onChanged: (String value) {
                  email = value.trim();
                }),
            // CustomTextField(
            //     hintText: "Student ID",
            //     controller: idController,
            //     icon: Icons.person_outline,
            //     align: TextAlign.start,
            //     valid: (value) {
            //       if (id.length != 8) {
            //         return "please enter valid ID";
            //       } else {
            //         return null;
            //       }
            //     },
            //     onChanged: (String value) {
            //       id = value.trim();
            //     }),
            const SizedBox(
              height: 12,
            ),
            // CustomTextField(
            //     hintText: "Student Phone",
            //     controller: phoneController,
            //     icon: Icons.phone_outlined,
            //     align: TextAlign.start,
            //     valid: (value) {
            //       if (phone.length != 10) {
            //         return "please enter valid phone number";
            //       } else {
            //         return null;
            //       }
            //     },
            //     onChanged: (String value) {
            //       phone = value.trim();
            //     }),
            const SizedBox(
              height: 12,
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).primaryColor,
                    width: 2,
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  )),
              padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
              margin: const EdgeInsets.fromLTRB(25.0, 5.0, 25.0, 0.0),
              child: Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: TextFormField(
                      obscureText: hide,
                      validator: (value) {
                        if (password == '') {
                          return 'Please Enter Password';
                        } else {
                          return null;
                        }
                      },
                      onChanged: (String value) {
                        password = value.trim();
                      },
                      controller: passwordController,
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                      cursorColor: Theme.of(context).primaryColor,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                            color:
                                Theme.of(context).primaryColor.withOpacity(0.5),
                          ),
                          fillColor: Theme.of(context).primaryColor,
                          focusColor: Theme.of(context).primaryColor,
                          hoverColor: Theme.of(context).primaryColor,
                          hintText: "Password",
                          icon: Icon(
                            Icons.password,
                            color: Theme.of(context).primaryColor,
                          )),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        hide = !hide;
                      });
                    },
                    icon: Icon(
                      Icons.remove_red_eye,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: MaterialButton(
                color: Theme.of(context).primaryColor,
                shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0)),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    await studentsServices.getStudents().then((value) {
                      for (int i = 0; i < value.length; i++) {
                        if (value[i]['email'] == email &&
                            value[i]['password'] == password) {
                          sharedPreferences.setString('email', email);
                          sharedPreferences.setString('id', value[i]['id']);
                          changeScreenReplacement(context, const Student());
                          var snackBar =
                              SnackBar(content: Text("Welcome $email"));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          return;
                        }
                      }
                      var snackBar = const SnackBar(
                          content: Text("E-mail or password wrong!"));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }).catchError((onError) {
                      var snackBar =
                          SnackBar(content: Text(onError.toString()));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    });
                  }
                },
                child: const Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      "Login",
                      style: TextStyle(color: Colors.white),
                    )),
              ),
            ),
            TextButton(
                onPressed: () {
                  changeScreen(context, const StudentRegister());
                },
                child: const CustomText(text: "Have not account? Register"))
          ],
        ),
      ),
    );
  }

  // String generateMd5(String input) {
  //   return md5.convert(utf8.encode(input)).toString();
  // }
}

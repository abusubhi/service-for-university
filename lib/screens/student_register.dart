import 'package:uni/db/student.dart';
import 'package:uni/screens/student.dart';
import 'package:uni/screens/student_login.dart';
import 'package:uni/utils/navigations.dart';
import 'package:uni/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class StudentRegister extends StatefulWidget {
  const StudentRegister({Key? key}) : super(key: key);

  @override
  State<StudentRegister> createState() => _StudentRegisterState();
}

class _StudentRegisterState extends State<StudentRegister> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  StudentsServices studentsServices = StudentsServices();

  String id = '', email = '', password = '';

  bool hide = true;

  TextEditingController? idController,
      emailController,
      passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text("Register"),
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
                hintText: "Student ID",
                controller: idController,
                icon: Icons.person_outline,
                align: TextAlign.start,
                valid: (value) {
                  if (id.length != 8) {
                    return "please enter valid ID";
                  } else {
                    return null;
                  }
                },
                onChanged: (String value) {
                  id = value.trim();
                }),
            const SizedBox(
              height: 12,
            ),
            CustomTextField(
                hintText: "E-mail",
                controller: emailController,
                icon: Icons.email,
                align: TextAlign.start,
                onChanged: (String value) {
                  email = value.trim();
                }),
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
                        value!.isEmpty ? 'Please Enter Password' : null;
                        return null;
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
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    studentsServices.addStudents({
                      'id': id,
                      'email': email,
                      'password': password,
                    }).then((value) {
                      sharedPreferences.setString('email', email);
                      sharedPreferences.setString('id', id);
                      changeScreenReplacement(context, const Student());
                      var snackBar = const SnackBar(
                          content: Text("Registered Successfully"));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      _formKey.currentState!.reset();
                      passwordController!.clear();
                    });
                  }
                },
                child: const Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      "Register",
                      style: TextStyle(color: Colors.white),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}

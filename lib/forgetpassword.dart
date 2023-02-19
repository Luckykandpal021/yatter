import 'package:flutter/material.dart';
import 'afterlogin.dart';

class forgetpassword extends StatefulWidget {
  const forgetpassword({super.key});

  @override
  State<forgetpassword> createState() => _forgetpasswordState();
}

class _forgetpasswordState extends State<forgetpassword> {
  final Color myCustomColor = Color(0xff010526);
  final Color yatterBlue = Color(0xff3390FF);
  final userController = TextEditingController();
  final passwordContoller = TextEditingController();
  String pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';

  final bool _passwordVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/background.png'),
                repeat: ImageRepeat.repeat),
          ),
          child: Column(children: [
            Stack(
              children: [
                Container(
                  height: 180,
                  color: myCustomColor,
                ),
                Container(
                    margin: const EdgeInsets.only(top: 100, left: 120),
                    child: Image.asset(
                      'images/yatter.png',
                      height: 60,
                    ))
              ],
            ),
            Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 114, 184, 254).withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ], color: yatterBlue, borderRadius: BorderRadius.circular(10)),
              width: 330,
              margin: const EdgeInsets.only(top: 90),
              child: Center(
                child: Expanded(
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 30),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 40, left: 20, right: 20),
                          child: TextFormField(
                            controller: userController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'At lease one username';
                              }
                            },
                            decoration: InputDecoration(
                                hintText: 'Your Registered UserName',
                                filled: true,
                                hintStyle: const TextStyle(fontSize: 15),
                                border: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(5)),
                                fillColor: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 40, left: 20, right: 20),
                          child: TextFormField(
                            controller: passwordContoller,
                            decoration: InputDecoration(
                              hintText: 'Your Registered Email ID',
                              hintStyle: TextStyle(fontSize: 15),
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderSide:
                                      const BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: SizedBox(
                              width: 290,
                              height: 50,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          myCustomColor),
                                ),
                                onPressed: () {
                                  RegExp regExp = RegExp(pattern);
                                  final newuser =
                                      userController.text.toString();
                                  final newpass =
                                      passwordContoller.text.toString();

                                  if (newuser.length == 0 &&
                                      newuser.length < 9) {
                                    print('at least eight character');
                                  } else if (!regExp.hasMatch(newpass)) {
                                  } else {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                afterlogin()));
                                  }
                                },
                                child: const Text(
                                  'Reset Your Password',
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 50,
              width: double.infinity,
              color: myCustomColor,
              margin: const EdgeInsets.only(top: 190.5),
              child: Column(
                children: const [
                  Padding(
                    padding: EdgeInsets.only(top: 6.0),
                    child: Text(
                      'Made with ❤️ in India',
                      style: TextStyle(
                          fontSize: 10,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 3.0),
                    child: Text(
                      '© 2023 Infokey Technology Private Limited',
                      style: TextStyle(
                          fontSize: 10,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}

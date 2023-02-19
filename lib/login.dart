import 'package:flutter/material.dart';
import 'afterlogin.dart';
import 'forgetpassword.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final Color myCustomColor = const Color(0xff010526);
  final Color yatterBlue = const Color(0xff3390FF);
  final userController = TextEditingController();
  final passwordContoller = TextEditingController();
  String pattern =
      r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$';
  bool _passwordVisible = true;
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
                                hintText: 'Username',
                                filled: true,
                                border: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(5)),
                                fillColor: Colors.white,
                                errorText:
                                    userController.text.toString().isEmpty
                                        ? 'Please Enter Your Username'
                                        : null),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 40, left: 20, right: 20),
                          child: TextFormField(
                            obscureText: _passwordVisible,
                            controller: passwordContoller,
                            decoration: InputDecoration(
                              errorText: passwordContoller.text.isEmpty
                                  ? 'Please enter your password'
                                  : null,
                              suffixIcon: IconButton(
                                color: myCustomColor,
                                icon: Icon(
                                  _passwordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _passwordVisible = !_passwordVisible;
                                  });
                                },
                              ),
                              hintText: 'Password',
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  //forgetpassword
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder: (context, animation,
                                            secondaryAnimation) =>
                                        forgetpassword(),
                                    transitionsBuilder: (context, animation,
                                        secondaryAnimation, child) {
                                      var begin = Offset(1.0, 0.0);
                                      var end = Offset.zero;
                                      var curve = Curves.ease;

                                      var tween = Tween(begin: begin, end: end)
                                          .chain(CurveTween(curve: curve));
                                      var offsetAnimation =
                                          animation.drive(tween);

                                      return SlideTransition(
                                        position: offsetAnimation,
                                        child: child,
                                      );
                                    },
                                  ));
                            },
                            child: const Text(
                              'Forget Password',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
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
                                  'Login',
                                  style: TextStyle(
                                    fontSize: 20,
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
              margin: const EdgeInsets.only(top: 149.5),
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

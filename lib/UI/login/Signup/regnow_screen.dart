// ignore_for_file: empty_constructor_bodies

import 'package:intense/imports.dart';
// import 'package:intense/UI/utility/account_check.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegNowScreen extends StatefulWidget {
  @override
  _RegNowScreenState createState() => _RegNowScreenState();
}

// enum Mobileverification {
//   Show_Mobile_Form,
//   Show_Otp_Form,
// }

class _RegNowScreenState extends State<RegNowScreen> {
  // Mobileverification currentState = Mobileverification.Show_Mobile_Form;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final TextEditingController _pwd = TextEditingController();
  final TextEditingController _confirmpwd = TextEditingController();
  CollectionReference _colT = FirebaseFirestore.instance.collection('Teacher');
  CollectionReference _colS = FirebaseFirestore.instance.collection('Student');
  String dropdownvalue = 'Teacher';
  // final TextEditingController _otp = TextEditingController();

  // late String verificationID;
  // bool showLoading = false;
  //
  // void signInWithPhoneAuthCredential(
  //     PhoneAuthCredential phoneAuthCredential) async {
  //   setState(() {
  //     showLoading = true;
  //   });
  //
  //   try {
  //     final authCredential =
  //     await _auth.signInWithCredential(phoneAuthCredential);
  //     setState(() {
  //       showLoading = false;
  //     });
  //     if (authCredential.user != null) {
  //       String sa = _phone.text;
  //       Map<String, dynamic> data = {
  //         "Name": _name.text,
  //         "Email": _email.text,
  //         "Contact no": '+91$sa'
  //       };
  //       FirebaseFirestore.instance.collection("NEW-Student").add(data);
  //       // FirebaseDatabase.collection().document().set(data);
  //       // instance.reference().push().set(data);
  //       Navigator.push(context,
  //           MaterialPageRoute(builder: (context) => StudentDashboard()));
  //     }
  //   } on FirebaseAuthException catch (ee) {
  //     setState(() {
  //       showLoading = false;
  //     });
  //     // ScaffoldMessenger.of(context)
  //     //     .showSnackBar(SnackBar(content: Text(ee.message))
  //     // );
  //   }
  // }

  // void _phoneNumberVerification(context) async {
  //   String s = _phone.text;
  //   await _auth.verifyPhoneNumber(
  //     phoneNumber: '+91$s',
  //     verificationCompleted: (phoneAuthCredential) async {
  //       setState(() {
  //         showLoading = false;
  //       });
  //     },
  //     verificationFailed: (verificationFailed) async {
  //       setState(() {
  //         showLoading = false;
  //       });
  //       ScaffoldMessenger.of(context)
  //           .showSnackBar(SnackBar(content: Text(verificationFailed.message)));
  //     },
  //     codeSent: (verificationID, resendingToken) async {
  //       setState(() {
  //         showLoading = false;
  //         currentState = Mobileverification.Show_Otp_Form;
  //         this.verificationID = verificationID;
  //       });
  //     },
  //     codeAutoRetrievalTimeout: (verificationId) {},
  //   );
  //   _otpWidget(context);
  // }

  // _otpWidget(context) async {
  //   return showDialog(
  //     context: context,
  //     builder: (builder) => AlertDialog(
  //       title: Text('OTP Verification'),
  //       content: TextField(
  //         keyboardType: TextInputType.number,
  //         controller: _otp,
  //         decoration: InputDecoration(
  //           labelText: 'OTP',
  //           hintText: 'eg: 454581',
  //           border:
  //           OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
  //         ),
  //       ),
  //       actions: <Widget>[
  //         ElevatedButton(
  //             onPressed: () async {
  //               PhoneAuthCredential phoneAuthCredential =
  //               PhoneAuthProvider.credential(
  //                   verificationId: verificationID, smsCode: _otp.text);
  //               signInWithPhoneAuthCredential(phoneAuthCredential);
  //             },
  //             child: Text('Submit'))
  //       ],
  //     ),
  //   );
  // }

  String? emailValidator(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern.toString());
    if (!regex.hasMatch(value)) {
      return 'Email format is invalid';
    } else {
      return null;
    }
  }

  String? pwdValidator(String value) {
    if (value.length < 8) {
      return 'Password must be longer than 8 characters';
    } else {
      return null;
    }
  }

  Widget _buildNameTF() {
    return Column(children: <Widget>[
      Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        width: MediaQuery.of(context).size.width * 0.8,
        decoration: BoxDecoration(
          border: Border.all(
            color: Color(0xFF6F35A5),
            width: 2,
          ),
          color: Color(0xFFF1E6FF),
          borderRadius: BorderRadius.circular(30.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black38,
              blurRadius: 6.0,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: TextFormField(
          controller: _name,
          keyboardType: TextInputType.name,
          style: TextStyle(
            color: kPrimaryColor,
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.bold,
          ),
          cursorColor: kPrimaryColor,
          validator: (value) {
            if (value!.isEmpty) return '*Please enter your name';
            return null;
          },
          decoration: InputDecoration(
            errorStyle: TextStyle(height: 0),
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 14.0),
            prefixIcon: Icon(
              Icons.account_circle_rounded,
              color: kPrimaryColor,
            ),
            hintText: 'Enter your Name',
            hintStyle: TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      )
    ]);
  }

  Widget _buildEmailTF() {
    return Column(children: <Widget>[
      Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        width: MediaQuery.of(context).size.width * 0.8,
        decoration: BoxDecoration(
          border: Border.all(
            color: Color(0xFF6F35A5),
            width: 2,
          ),
          color: Color(0xFFF1E6FF),
          borderRadius: BorderRadius.circular(30.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black38,
              blurRadius: 6.0,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: TextFormField(
          controller: _email,
          keyboardType: TextInputType.emailAddress,
          style: TextStyle(
            color: kPrimaryColor,
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.bold,
          ),
          cursorColor: kPrimaryColor,
          validator: (value) {
            if (value!.isEmpty) return '*Please enter your email';
            return null;
          },
          decoration: InputDecoration(
            errorStyle: TextStyle(height: 0),
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 14.0),
            prefixIcon: Icon(
              Icons.email,
              color: kPrimaryColor,
            ),
            hintText: 'Enter your Email',
            hintStyle: TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      )
    ]);
  }

  // Widget _buildPhoneTF() {
  //   return Column(children: <Widget>[
  //     Container(
  //       margin: EdgeInsets.symmetric(vertical: 10),
  //       padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
  //       width: MediaQuery.of(context).size.width * 0.8,
  //       decoration: BoxDecoration(
  //         border: Border.all(
  //           color: Color(0xFF6F35A5),
  //           width: 2,
  //         ),
  //         color: Color(0xFFF1E6FF),
  //         borderRadius: BorderRadius.circular(30.0),
  //         boxShadow: [
  //           BoxShadow(
  //             color: Colors.black38,
  //             blurRadius: 6.0,
  //             offset: Offset(0, 2),
  //           ),
  //         ],
  //       ),
  //       child: TextFormField(
  //         controller: _phone,
  //         keyboardType: TextInputType.number,
  //         style: TextStyle(
  //           color: kPrimaryColor,
  //           fontFamily: 'OpenSans',
  //           fontWeight: FontWeight.bold,
  //         ),
  //         cursorColor: kPrimaryColor,
  //         validator: (value) {
  //           if (value!.isEmpty) return '*Please enter your Phone Number';
  //           return null;
  //         },
  //         decoration: InputDecoration(
  //           errorStyle: TextStyle(height: 0),
  //           border: InputBorder.none,
  //           contentPadding: EdgeInsets.only(top: 14.0),
  //           prefixIcon: Icon(
  //             Icons.phone,
  //             color: kPrimaryColor,
  //           ),
  //           hintText: 'Enter your Phone Number',
  //           hintStyle: TextStyle(
  //             color: Colors.black54,
  //             fontWeight: FontWeight.bold,
  //           ),
  //         ),
  //       ),
  //     )
  //   ]);
  // }

  Widget _buildPasswordTF() {
    return Column(children: <Widget>[
      Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        width: MediaQuery.of(context).size.width * 0.8,
        decoration: BoxDecoration(
          border: Border.all(
            color: Color(0xFF6F35A5),
            width: 2,
          ),
          color: Color(0xFFF1E6FF),
          borderRadius: BorderRadius.circular(30.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black38,
              blurRadius: 6.0,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: TextFormField(
          controller: _pwd,
          keyboardType: TextInputType.visiblePassword,
          style: TextStyle(
            color: kPrimaryColor,
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.bold,
          ),
          cursorColor: kPrimaryColor,
          validator: (value) {
            if (value!.isEmpty) return 'Please enter your Password';
            return null;
          },
          decoration: InputDecoration(
            errorStyle: TextStyle(height: 0),
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 14.0),
            prefixIcon: Icon(
              Icons.password,
              color: kPrimaryColor,
            ),
            hintText: 'Enter your Password',
            hintStyle: TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      )
    ]);
  }

  Widget _buildConfirmPasswordTF() {
    return Column(children: <Widget>[
      Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        width: MediaQuery.of(context).size.width * 0.8,
        decoration: BoxDecoration(
          border: Border.all(
            color: Color(0xFF6F35A5),
            width: 2,
          ),
          color: Color(0xFFF1E6FF),
          borderRadius: BorderRadius.circular(30.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black38,
              blurRadius: 6.0,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: TextFormField(
          controller: _confirmpwd,
          keyboardType: TextInputType.visiblePassword,
          style: TextStyle(
            color: kPrimaryColor,
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.bold,
          ),
          cursorColor: kPrimaryColor,
          validator: (value) {
            if (value!.isEmpty) return 'Please enter your Password';
            return null;
          },
          decoration: InputDecoration(
            errorStyle: TextStyle(height: 0),
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 14.0),
            prefixIcon: Icon(
              Icons.password,
              color: kPrimaryColor,
            ),
            hintText: 'Enter your Password',
            hintStyle: TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      )
    ]);
  }

  Widget _buildLoginBtn() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: MediaQuery.of(context).size.width * 0.4,
      child: MaterialButton(
        elevation: 6.0,
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
        color: kPrimaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        onPressed: () {
          if (_key.currentState!.validate()) {
            if (_pwd.text == _confirmpwd.text) {
              FirebaseAuth.instance
                  .createUserWithEmailAndPassword(
                      email: _email.text, password: _pwd.text)
                  .then((currentUser) => FirebaseFirestore.instance
                          .collection("Users")
                          .doc(currentUser.user!.uid)
                          .set({
                        "uid": currentUser.user!.uid,
                        "name": _name.text,
                        "email": _email.text,
                      }).then((value) async {
                        try {
                          await currentUser.user!.sendEmailVerification();
                          Fluttertoast.showToast(
                              msg: "Verification Email Sent",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 3,
                              textColor: Colors.black,
                              fontSize: 16.0);
                          Map<String, dynamic> _map = {
                            "email": _email.text,
                            "Role": dropdownvalue
                          };
                          if (dropdownvalue == 'Teacher') {
                            _colT.add(_map);
                          } else if (dropdownvalue == 'Student') {
                            _colS.add(_map);
                          } else {}
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    LoginScreen(user: currentUser.user)),
                          );
                          _name.clear();
                          _email.clear();
                          _pwd.clear();
                          _confirmpwd.clear();
                        } catch (e) {
                          print(
                              "An error occurred while trying to send email verification");
                          Fluttertoast.showToast(
                              msg: e.toString(),
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 3,
                              textColor: Colors.black,
                              fontSize: 16.0);
                        }
                      }).catchError((err) => Fluttertoast.showToast(
                              msg: err.toString(),
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 3,
                              textColor: Colors.black,
                              fontSize: 16.0)))
                  .catchError((err) => Fluttertoast.showToast(
                      msg: err.toString(),
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 3,
                      textColor: Colors.black,
                      fontSize: 16.0));
            } else {
              //print( dropdownvalue );
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Error"),
                      content: Text("The passwords do not match"),
                      actions: <Widget>[
                        FlatButton(
                          child: Text("Close"),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        )
                      ],
                    );
                  });
            }
          }
        },
        child: Text(
          'LOGIN',
          style: TextStyle(
            fontFamily: 'OpenSans',
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
          ),
        ),
      ),
    );
  }

  // void call() async {
  //   await Googlesignin.login();
  //   if (Googlesignin.isSigning) {
  //     await Navigator.push(
  //         context, MaterialPageRoute(builder: (context) => NewStudentScreen()));
  //   }
  // }
  Widget dropdown() {
    var items = ['Teacher', 'Student'];

    return DropdownButton(
        value: dropdownvalue,
        icon: Icon(Icons.keyboard_arrow_down),
        items: items.map((String items) {
          return DropdownMenuItem(value: items, child: Text(items));
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            dropdownvalue = newValue!;
          });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
              Text(
                "REGISTER",
                style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 28,
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              SvgPicture.asset(
                "assets/login/signup.svg",
                height: MediaQuery.of(context).size.height * 0.35,
              ),
              Form(
                  key: _key,
                  child: Column(children: <Widget>[
                    _buildNameTF(),
                    _buildEmailTF(),
                    //_buildPhoneTF(),
                    _buildPasswordTF(),
                    _buildConfirmPasswordTF(),
                    dropdown(),
                    _buildLoginBtn(),
                  ])),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              // AlreadyHaveAnAccountCheck(
              //   login: false,
              //   press: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //         builder: (context) {
              //           return LoginScreen();
              //         },
              //       ),
              //     );
              //   },
              // ),
              SizedBox(height: 15.0),
            ],
          ),
        ),
      ),
    );
  }

  @override
  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

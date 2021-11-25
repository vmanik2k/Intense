import 'package:intense/imports.dart';
import 'package:firebase_auth/firebase_auth.dart';

class WelcomeScreen extends StatefulWidget {

  final User? user;
  WelcomeScreen({Key? key,this.user}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
  }

  class _WelcomeScreenState extends State<WelcomeScreen> {

    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

    void _studentCurrentState(){
      FirebaseAuth.instance
          .authStateChanges()
          .listen((User? user) {
        if (user == null) {
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => LoginScreen(user: widget.user)));
        } else {
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => StudentDashboard(user: user)));
        }
      });
    }

    void _teacherCurrentState(){
      FirebaseAuth.instance
          .authStateChanges()
          .listen((User? user) {
        if (user == null) {
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => RegNowScreen()));
        } else {
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => TeacherDashboard(user: user)));
        }
      });
    }

    Widget _buildLoginBtn() {
      return Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Color(0xFFF1E6FF),
            width: 2,
          ),
          color: Color(0xFFF1E6FF),
          borderRadius: BorderRadius.circular(30.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6.0,
              offset: Offset(0, 2),
            ),
          ],
        ),
        margin: EdgeInsets.symmetric(vertical: 10),
        width: MediaQuery.of(context).size.width * 0.8,
        child: MaterialButton(
          elevation: 6.0,
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          color: kPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          onPressed: () {
            _studentCurrentState();
          },
          child: Text('Student',
            style: TextStyle(
              fontFamily: 'OpenSans',
              color: kPrimaryLightColor,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
            ),
          ),
        ),
      );
    }

    Widget _buildRegBtn() {
      return Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Color(0xFF6F35A5),
            width: 2,
          ),
          color: Color(0xFFF1E6FF),
          borderRadius: BorderRadius.circular(30.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6.0,
              offset: Offset(0, 2),
            ),
          ],
        ),
        margin: EdgeInsets.symmetric(vertical: 10),
        width: MediaQuery.of(context).size.width * 0.8,
        child: MaterialButton(
          elevation: 6.0,
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
          color: kPrimaryLightColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          onPressed: () {
            _teacherCurrentState();
          },
          child: Text('Teacher',
            style: TextStyle(
              fontFamily: 'OpenSans',
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
            ),
          ),
        ),
      );
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "WELCOME",
                style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 28,
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              SvgPicture.asset(
                "assets/login/chat.svg",
                height: MediaQuery.of(context).size.height * 0.45,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.05),
              _buildLoginBtn(),
              _buildRegBtn(),
            ],
          ),
        ),
      ),
    );
  }
}

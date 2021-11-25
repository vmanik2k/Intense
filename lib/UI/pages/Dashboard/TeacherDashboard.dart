import 'package:intense/UI/widgets/DashboardButton.dart';
import 'package:intense/imports.dart';

class TeacherDashboard extends StatefulWidget {
  TeacherDashboard({Key? key,required this.user}) : super(key: key);
  //   setCurrentScreen();
  final User user;
  // }
  // static String pageName = string.dashboard;
  _TeacherDashboardState createState() => new _TeacherDashboardState();
}

class _TeacherDashboardState extends State<TeacherDashboard> {
  Widget _buildGrid() {
    return Container(
      padding: EdgeInsets.only(top: 35.0),
      child: Column(
        children: <Widget>[
          SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
              width: MediaQuery.of(context).size.width
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // SizedBox(height: 25),
                DashboardBtn(
                    icon: CustomIcons.megaphone,
                    label: 'Announcement',
                    onPressed:  () {
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => WelcomeScreen()));
                    },
                    tileColor: Colors.deepOrangeAccent
                ),
                DashboardBtn(
                  icon: Icons.av_timer,
                  label: 'Time Table',
                  onPressed:  () {
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => WelcomeScreen()));
                  },
                  tileColor: Colors.blueGrey,
                ),
              ]
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // SizedBox(height: 25),
                DashboardBtn(
                    icon: Icons.assessment,
                    label: 'Result',
                    onPressed:  () {
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => WelcomeScreen()));
                    },
                    tileColor: Colors.deepOrangeAccent
                ),
                DashboardBtn(
                  icon: Icons.assignment,
                  label: 'Exams',
                  onPressed:  () {
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => WelcomeScreen()));
                  },
                  tileColor: Colors.blueGrey,
                ),
              ]
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          brightness: Brightness.dark,
          backgroundColor: Colors.black,
          automaticallyImplyLeading: false,
          title: Text(
            ' \nWelcome Teacher',
            style: TextStyle(
              letterSpacing: 1.5,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
            ),
          ),
          actions: <Widget>[
            IconButton(
                padding: EdgeInsets.only(right: 15, top: 25),
                icon: const Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
                onPressed: () {
                  // signOut();
                  Navigator.of(context, rootNavigator: true).pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content:
                      Text('You have been signed out successfully')));
                }
            ),
            SizedBox(height: 100),
          ]
      ),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
              children: <Widget>[
                Container(
                  height: size.height,
                  width: size.width,
                  color: Colors.white,
                ),
                Container(
                  // color: Colors.white,
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    padding: EdgeInsets.symmetric(
                      horizontal: 0,
                      vertical: 0,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        _buildGrid(),
                      ],
                    ),
                  ),
                ),
              ]
          ),
        ),
      ),
    );
  }
}
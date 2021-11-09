import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:intense/UI/utility/constants.dart';
import 'package:intense/UI/utility/custom_icons.dart';
import 'package:intense/UI/widgets/ColumnReusableCardButton.dart';
import 'package:intense/UI/widgets/RowReusableCardButton.dart';
import 'package:intense/imports.dart';

class StudentDashboard extends StatefulWidget {
  // StudentDashboard({required Key key}) : super(key: key) {
  //   // setCurrentScreen();
  // }
  // static String pageName = string.dashboard;
  _StudentDashboardState createState() => new _StudentDashboardState();
}

class _StudentDashboardState extends State<StudentDashboard> {
  @override
  Widget build(BuildContext context) {
    var string;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(left: 10.0, right: 10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: ListView(
                  children: [
                    Container(
                      height: 110,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RowReusableCardButton(
                            tileColor: Colors.deepOrangeAccent,
                            label: string.e_card,
                            onPressed: () {
                              // kopenPage(context, ECardPage());
                            },
                            icon: Icons.perm_contact_calendar,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          RowReusableCardButton(
                            tileColor: Colors.blueGrey,
                            icon: Icons.av_timer,
                            label: string.timetable,
                            onPressed: () {
                              // kopenPage(context, TimeTablePage());
                            },
                          ),
                        ],
                      ),
                    ),
                    ColumnReusableCardButton(
                      height: 70,
                      tileColor: Colors.orangeAccent,
                      label: string.announcement,
                      icon: CustomIcons.megaphone,
                      directionIcon: Icons.chevron_right, directionIconHeroTag: '',
                      onPressed: () {
                        // kopenPage(context, AnnouncementPage());
                      },
                    ),
                    Container(
                      height: 110,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RowReusableCardButton(
                            tileColor: Colors.blueGrey,
                            icon: CustomIcons.traveler_with_a_suitcase,
                            label: string.holidays,
                            onPressed: () {
                              // kopenPage(context, HolidayPage());
                            },
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          RowReusableCardButton(
                            tileColor: Colors.indigoAccent,
                            icon: Icons.assessment,
                            label: string.results,
                            onPressed: () {
                              // kopenPage(context, ResultPage());
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 110,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RowReusableCardButton(
                            tileColor: Colors.lightGreen,
                            label: string.assignment,
                            onPressed: () {
                              // kopenPage(context, AssignmentsPage());
                            },
                            icon: Icons.assignment,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          RowReusableCardButton(
                            tileColor: Colors.lime,
                            icon: Icons.attach_money,
                            label: string.fees,
                            onPressed: () {
                              // kopenPage(context, FeesPage());
                            },
                          ),
                        ],
                      ),
                    ),
                    ColumnReusableCardButton(
                        height: 70,
                        tileColor: Colors.grey,
                        label: string.transportation,
                        onPressed: () {
                          // kopenPage(context, TransportationPage());
                        },
                        icon: FontAwesomeIcons.bus,
                        directionIcon: Icons.chevron_right, directionIconHeroTag: '',
                    ),
                    SizedBox(
                      height: 105,
                      child: ListView(
                        shrinkWrap: false,
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              RowReusableCardButtonBanner(
                                paddingTop: 0,
                                tileColor: Colors.pink,
                                icon: Icons.assistant_photo,
                                label: string.exams,
                                onPressed: () {
                                  // kopenPage(context, TopicSelectPage());
                                },
                              ),
                              RowReusableCardButtonBanner(
                                paddingTop: 0,
                                tileColor: Colors.tealAccent,
                                icon: FontAwesomeIcons.book,
                                label: string.e_book,
                                onPressed: () {
                                  // kopenPage(context, EBookSelect());
                                },
                              ),
                              RowReusableCardButtonBanner(
                                paddingTop: 0,
                                tileColor: Colors.deepPurpleAccent,
                                icon: FontAwesomeIcons.cameraRetro,
                                label: string.video,
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 110,
                      child: ListView(
                        shrinkWrap: false,
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              RowReusableCardButtonBanner(
                                tileColor: Colors.pinkAccent,
                                icon: FontAwesomeIcons.female,
                                label: string.parenting_guide,
                                onPressed: () {
                                  // kopenPage(context, ParentingGuidePage());
                                },
                              ),
                              RowReusableCardButtonBanner(
                                tileColor: Colors.red,
                                icon: FontAwesomeIcons.medkit,
                                label: string.health_tips,
                                onPressed: () {},
                              ),
                              RowReusableCardButtonBanner(
                                tileColor: Colors.blue,
                                icon: FontAwesomeIcons.userMd,
                                label: string.vaccinations,
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    ColumnReusableCardButton(
                      tileColor: Colors.greenAccent,
                      height: 70,
                      label: string.offers,
                      onPressed: () {},
                      icon: Icons.receipt,
                      directionIcon: Icons.chevron_right, directionIconHeroTag: '',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
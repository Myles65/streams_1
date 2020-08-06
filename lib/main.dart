import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'streams.dart';
import 'activity.dart';
import 'profile.dart';
//import 'info.dart';
import 'login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'size_config.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        theme: ThemeData(
          textTheme: GoogleFonts.bebasNeueTextTheme()
              .apply(bodyColor: Colors.black, displayColor: Colors.black),
        ),
        home: Login(),
        debugShowCheckedModeBanner: false);
  }
}

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  String _userE;


  @override
  Widget build(BuildContext context) {
    FirebaseAuth.instance.currentUser().then((user) {
      _userE = user.email;
    });
    return Drawer(
      child: ListView(
        children: <Widget>[
          Center(
            child: DrawerHeader(
              child: Text(_userE!=null? _userE: 'Email'),
            ),
            //go back and look over
          ),
          ListTile(
            title: Text('About'),
            onTap: () {},
          ),
          ListTile(
            title: Text('Privacy Policy'),
            onTap: () {},
          ),
          ListTile(
            title: Text('Terms & Conditions'),
            onTap: () {},
          ),
          ListTile(
            title: Text('Help'),
            onTap: () {},
          ),
          ListTile(
            title: Text('Reset Password'),
            onTap: () {},
          ),
          ListTile(
            title: Text('Sign Out'),
            onTap: () {
              _signOut();
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Streams()),
              );
            },
          ),
        ],

      ),
    );
  }
}

Future<void> _signOut() async {
  try {
    await FirebaseAuth.instance.signOut();
  } catch (e) {
    print(e);
  }
}
class MyNavigationBar extends StatefulWidget {
  @override
  _MyNavigationBarState createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar>
    with TickerProviderStateMixin {
  int _currentIndex = 0;
  final List<Widget> _children = [
    Streams(),
    Activity(),
    Profile(),
    //InfoPage(),
  ];
  TabController _tabController;

  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
      _tabController.animateTo(_currentIndex);
    });
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: _children.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: _children[_currentIndex],
      appBar: AppBar(
        elevation: 0.0,
        title: Center(
          child: Text(
            'Streams',
            style: GoogleFonts.bebasNeue(
                fontSize: SizeConfig.safeBlockHorizontal * 8,
                textStyle: TextStyle(color: Color(0xFF006994))),
          ),
        ),
        backgroundColor: Colors.white,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: onTappedBar,
        fixedColor: Color(0xFF006994),
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.black),
              title: Text(
                'Home',
                style: GoogleFonts.bebasNeue(
                  fontSize: SizeConfig.safeBlockHorizontal * 4,
                ),
              )),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard, color: Colors.black),
            title: Text(
              'Activity',
              style: GoogleFonts.bebasNeue(
                fontSize: SizeConfig.safeBlockHorizontal * 4,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.perm_identity, color: Colors.black),
            title: Text(
              'Profile',
              style: GoogleFonts.bebasNeue(
                fontSize: SizeConfig.safeBlockHorizontal * 4,
              ),
            ),
          ),
//          **Info page tab in case I want to add later
//          BottomNavigationBarItem(
//              icon: Icon(
//                Icons.info_outline,
//                color: Colors.black,
//              ),
//              title: Text('Info')),
        ],
      ),
    );
  }
}

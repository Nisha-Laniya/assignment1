import 'package:assignment1/screens/login_screen.dart';
import 'package:assignment1/utils/const.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {

  int _currentIndex = 0 ;

  List<Widget> body = const [
    Icon(Icons.home),
    Icon(Icons.person),
    Icon(Icons.list),
    Icon(Icons.category),
    Icon(Icons.add),
  ];


  final auth = FirebaseAuth.instance.currentUser;

  Widget _personName() {
    return Text(
        auth?.displayName ?? '',
      style: TextStyle(
        color:ColorConstants.white1,
        fontSize: 10.sp,
      ),
    );
  }
  
  Widget _personEmail() {
    return Text(
        auth?.email ?? '',
        style: TextStyle(
          color: ColorConstants.white1,
          fontSize: 18.sp,
        ),
    );
  }
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard Screen'),
        backgroundColor: ColorConstants.teal,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
             UserAccountsDrawerHeader(
               accountName: _personName(),
               accountEmail: _personEmail(),
                decoration: BoxDecoration(
                    color: ColorConstants.teal,
                ),
               currentAccountPicture: Icon(
                 Icons.account_circle_sharp,
                 size: 50,
                 color: ColorConstants.white1,
               ),
            ),
            ListTile(
              leading: const Icon(Icons.payment_outlined),
              title: const Text('Payment Method'),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading:const Icon(Icons.home),
              title: const Text('Address'),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: const Icon(Icons.lock_outline),
              title: const Text('Password'),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: const Icon(Icons.house_sharp),
              title: const Text('Household'),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout_outlined),
              title: const Text('Logout'),
              onTap: () {
                FirebaseAuth.instance.signOut().then((value) {
                   Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen()));
                });
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: ColorConstants.black,

        onTap: (int newIndex) {
          setState(() {
            _currentIndex = newIndex;
          });
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(Icons.home),
              backgroundColor: ColorConstants.teal,
          ),
          BottomNavigationBarItem(
              label: 'Vendors',
              icon: Icon(Icons.person),
              backgroundColor: ColorConstants.teal,
          ),
          BottomNavigationBarItem(
              label: 'List',
              icon: Icon(Icons.list),
              backgroundColor: ColorConstants.teal,
          ),
          BottomNavigationBarItem(
              label: 'Category',
              icon: Icon(Icons.category),
              backgroundColor: ColorConstants.teal,
          ),
          BottomNavigationBarItem(
              label: 'More',
              icon: Icon(Icons.add),
              backgroundColor: ColorConstants.teal
          ),
        ],
      ),
      body: Center(
        child: body[_currentIndex],
      ),
    );
  }
}

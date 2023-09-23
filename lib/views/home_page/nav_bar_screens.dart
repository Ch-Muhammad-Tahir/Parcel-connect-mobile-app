import 'package:flutter/material.dart';
import 'package:fyp_parcel_connect/providers/send_parcel_provide.dart';
import 'package:provider/provider.dart';
import '../../views/brief_screen/brief_screen_widget.dart';
import '../../views/home_page/home_screen.dart';
import '../../views/manage_parcel/manage_parcel_screens.dart';
import '../../views/profile/profile_screen_widget.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

class BottomNavBarScreenWidgets extends StatefulWidget {
  const BottomNavBarScreenWidgets({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BottomNavBarScreenWidgetsState createState() =>
      _BottomNavBarScreenWidgetsState();
}

class _BottomNavBarScreenWidgetsState extends State<BottomNavBarScreenWidgets> {
  @override
  void initState() {
    // TODO: implement initState
    Provider.of<SendParcelProvider>(context, listen: false).getBriefs();
    super.initState();
  }

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  static const List<Widget> _widgetOptions = <Widget>[
    HomePageScreenWidget(),
    BriefScreenWidget(),
    ManageParcelScreen(),
    ProfileScreenWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        Provider.of<SendParcelProvider>(context, listen: false).getBriefs();
      }),
      backgroundColor: Colors.white,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 8,
              activeColor: Colors.blue,
              iconSize: 24,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: Colors.grey[100]!,
              color: Colors.black,
              tabs: const [
                GButton(
                  icon: LineIcons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.post_add,
                  text: 'Brief',
                ),
                GButton(
                  icon: LineIcons.box,
                  text: 'Parcels',
                ),
                GButton(
                  icon: LineIcons.user,
                  text: 'Profile',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}

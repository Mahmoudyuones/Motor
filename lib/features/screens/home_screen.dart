import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motor/core/resources/color_manager.dart';
import 'package:motor/core/resources/styles_manager.dart';
import 'package:motor/features/taps/home_tap.dart';
import 'package:motor/features/taps/profile_tap.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _screens = <Widget>[
    HomeTap(),
    Center(child: Text('طلباتي', style: TextStyle(fontSize: 30))),
    Center(child: Text('السلة', style: TextStyle(fontSize: 30))),
    Center(child: Text('المحادثات', style: TextStyle(fontSize: 30))),
    ProfileTap(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildIconWithLabel(String assetPath, String label, int index) {
    final isSelected = _selectedIndex == index;

    final icon = SizedBox(
      height: 24.h,
      width: 24.w,
      child: Image.asset(
        assetPath,
        color: isSelected ? ColorManager.primary : ColorManager.grey,
      ),
    );

    final text = Text(
      label,
      style: StylesManager.getBoldStyle(
        color: isSelected ? ColorManager.primary : ColorManager.grey,
        fontSize: 14.sp,
      ),
    );

    final content = Column(
      mainAxisSize: MainAxisSize.min,
      children: [icon, SizedBox(height: 8.h), text],
    );

    if (isSelected) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
        decoration: BoxDecoration(
          color: ColorManager.backGroundRed,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: content,
      );
    } else {
      return content;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backGroundWhite,
      body: _screens[_selectedIndex],
      floatingActionButton:
          _selectedIndex == 0
              ? FloatingActionButton(
                onPressed: () {
                  print('floating action button pressed');
                },
                backgroundColor: ColorManager.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Image.asset(
                  'assets/icons/whatsapp.png',

                  fit: BoxFit.contain,
                ),
              )
              : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartFloat,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 10,
              offset: Offset(0, -3),
            ),
          ],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.r),
            topRight: Radius.circular(16.r),
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.r),
            topRight: Radius.circular(16.r),
          ),
          child: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: _buildIconWithLabel(
                  'assets/icons/home.png',
                  'الرئيسية',
                  0,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: _buildIconWithLabel(
                  'assets/icons/clipboard-text.png',
                  'طلباتي',
                  1,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: _buildIconWithLabel(
                  'assets/icons/shopping-cart.png',
                  'السلة',
                  2,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: _buildIconWithLabel(
                  'assets/icons/messages-3.png',
                  'المحادثات',
                  3,
                ),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: _buildIconWithLabel(
                  'assets/icons/profile.png',
                  'الحساب',
                  4,
                ),
                label: '',
              ),
            ],
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            backgroundColor: ColorManager.white,
            elevation: 0,
            selectedItemColor: ColorManager.primary,
            unselectedItemColor: ColorManager.grey,
          ),
        ),
      ),
    );
  }
}

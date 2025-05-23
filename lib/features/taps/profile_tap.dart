import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motor/core/resources/color_manager.dart';
import 'package:motor/core/resources/font_manager.dart';
import 'package:motor/core/resources/styles_manager.dart';
import 'package:motor/core/widgets/accoun_information.dart';

class ProfileTap extends StatefulWidget {
  const ProfileTap({super.key});

  @override
  State<ProfileTap> createState() => _ProfileTapState();
}

class _ProfileTapState extends State<ProfileTap> {
  int selectedIndex = 0;
  String userName = 'محمد البشاري';
  String userNumber = '770819441';
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            height: 330.h,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/home_app_bar_image.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          PositionedDirectional(
            top: 50.h,
            start: 0,
            end: 0,
            child: Column(
              children: [
                Container(
                  width: 92,
                  height: 92,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      width: 5,
                      color: ColorManager.white.withOpacity(.4),
                    ),
                  ),
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/profile.png'),
                  ),
                ),
                SizedBox(height: 7.h),
                Text(
                  userName,
                  style: StylesManager.getBoldStyle(
                    color: ColorManager.white,
                    fontSize: FontSize.s18,
                  ),
                ),

                Text(
                  userNumber,
                  style: StylesManager.getMediumStyle(
                    color: ColorManager.white,
                    fontSize: FontSize.s18,
                  ),
                ),
                SizedBox(height: 10.h),
                Container(
                  width: 338.w,
                  height: 64.h,
                  decoration: BoxDecoration(
                    color: ColorManager.white.withOpacity(.2),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '100+',
                              style: StylesManager.getBoldStyle(
                                color: ColorManager.white,
                                fontSize: FontSize.s20,
                              ),
                            ),
                            Text(
                              'عدد الاعلانات',
                              style: StylesManager.getBoldStyle(
                                color: ColorManager.backGroundWhite,
                                fontSize: FontSize.s12,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 15.h),
                          child: VerticalDivider(width: 2),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '100+',
                              style: StylesManager.getBoldStyle(
                                color: ColorManager.white,
                                fontSize: FontSize.s20,
                              ),
                            ),
                            Text(
                              'عدد الاعلانات',
                              style: StylesManager.getBoldStyle(
                                color: ColorManager.backGroundWhite,
                                fontSize: FontSize.s12,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 15.h),
                          child: VerticalDivider(width: 2),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '100+',
                              style: StylesManager.getBoldStyle(
                                color: ColorManager.white,
                                fontSize: FontSize.s20,
                              ),
                            ),
                            Text(
                              'عدد الاعلانات',
                              style: StylesManager.getBoldStyle(
                                color: ColorManager.backGroundWhite,
                                fontSize: FontSize.s12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 310.h),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'بيانات الحساب',
                      style: StylesManager.getSemiBoldStyle(
                        color: ColorManager.grey,
                        fontSize: FontSize.s14,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Container(
                    width: 370.w,
                    height: 300.h,
                    decoration: BoxDecoration(
                      color: ColorManager.white,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.h),
                      child: Column(
                        children: [
                          AccountInformation(
                            iconPath: 'assets/icons/profile.png',
                            title: 'عرض الملف الشخصي',
                            onTap: () {},
                          ),
                          Divider(
                            color: ColorManager.backGroundWhite,
                            thickness: 3.h,
                          ),
                          AccountInformation(
                            iconPath: 'assets/icons/edit.png',
                            title: 'تحرير بيانات الحساب',
                            onTap: () {},
                          ),
                          Divider(
                            color: ColorManager.backGroundWhite,
                            thickness: 3.h,
                          ),
                          AccountInformation(
                            iconPath: 'assets/icons/location.png',
                            title: 'العناوين',
                            onTap: () {},
                          ),
                          Divider(
                            color: ColorManager.backGroundWhite,
                            thickness: 3.h,
                          ),
                          AccountInformation(
                            iconPath: 'assets/icons/heart.png',
                            title: 'المفضلة',
                            onTap: () {},
                          ),
                          Divider(
                            color: ColorManager.backGroundWhite,
                            thickness: 3.h,
                          ),
                          AccountInformation(
                            iconPath: 'assets/icons/clipboard-text.png',
                            title: 'الطلبات',
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'الأعدادات',
                      style: StylesManager.getSemiBoldStyle(
                        color: ColorManager.grey,
                        fontSize: FontSize.s14,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Container(
                    width: 370.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                      color: ColorManager.white,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(bottom: 5),
                                child: Image.asset(
                                  'assets/icons/translate.png',
                                  color: ColorManager.primary,
                                  width: 24.w,
                                  height: 24.h,
                                ),
                              ),
                              SizedBox(width: 15.w),
                              Text(
                                'اللغة',
                                style: StylesManager.getSemiBoldStyle(
                                  color: ColorManager.black,
                                  fontSize: FontSize.s18,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            width: 133.w,
                            height: 35.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                              color: ColorManager.black,
                            ),
                            child: AnimatedToggleSwitch<int>.size(
                              current: selectedIndex,
                              values: const [0, 1],
                              iconOpacity: 1.0,
                              indicatorSize: Size(60.w, 35.h),
                              iconBuilder: (value) {
                                final isSelected = selectedIndex == value;
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      value == 0 ? 'English' : 'العربية',
                                      style: StylesManager.getSemiBoldStyle(
                                        color:
                                            isSelected
                                                ? ColorManager.white
                                                : ColorManager.primary,
                                        fontSize: FontSize.s10,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                );
                              },
                              borderWidth: 0.0,
                              iconAnimationType: AnimationType.onHover,
                              style: ToggleStyle(
                                backgroundColor: ColorManager.backGroundRed,
                                borderRadius: BorderRadius.circular(8.r),
                                indicatorColor: ColorManager.primary,
                              ),
                              onChanged: (i) {
                                setState(() {
                                  selectedIndex = i;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Container(
                    width: 370.w,
                    height: 180.h,
                    decoration: BoxDecoration(
                      color: ColorManager.white,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.h),
                      child: Column(
                        children: [
                          AccountInformation(
                            iconPath: 'assets/icons/document-text.png',
                            title: 'اتفاقية الاستخدام',
                            onTap: () {},
                          ),
                          Divider(
                            color: ColorManager.backGroundWhite,
                            thickness: 3.h,
                          ),
                          AccountInformation(
                            iconPath: 'assets/icons/edit.png',
                            title: 'الشروط والاحكام',
                            onTap: () {},
                          ),
                          Divider(
                            color: ColorManager.backGroundWhite,
                            thickness: 3.h,
                          ),
                          AccountInformation(
                            iconPath: 'assets/icons/location.png',
                            title: 'عن التطبيق',
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Container(
                    height: 60.h,
                    decoration: BoxDecoration(
                      color: ColorManager.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12.r),
                        topRight: Radius.circular(12.r),
                      ),
                    ),
                    child: AccountInformation(
                      iconPath: 'assets/icons/login.png',
                      title: 'تسجيل الخروج',
                      onTap: () {},
                    ),
                  ),
                  Container(height: 3, color: ColorManager.backGroundWhite),
                  Container(
                    height: 60.h,
                    decoration: BoxDecoration(
                      color: ColorManager.backGroundRed,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12.r),
                        bottomRight: Radius.circular(12.r),
                      ),
                    ),
                    child: AccountInformation(
                      iconPath: 'assets/icons/edit.png',
                      title: 'حذف الحساب',
                      onTap: () {},
                      textColor: ColorManager.primary,
                      iconColor: ColorManager.primary,
                    ),
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

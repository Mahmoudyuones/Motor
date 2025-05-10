import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motor/core/resources/color_manager.dart';
import 'package:motor/core/resources/font_manager.dart';
import 'package:motor/core/resources/styles_manager.dart';
import 'package:motor/core/widgets/default_elevated_button.dart';
import 'package:motor/core/widgets/default_text_form_field.dart';
import 'package:motor/core/widgets/phone_input_field.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = '/login';
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  bool isChecked = false;
  String selectedTab = 'حساب فرد';
  void _switchTab(String tab) {
    if (selectedTab != tab) {
      setState(() {
        selectedTab = tab;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/images/background_image.png',
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 130.h),
                  SizedBox(
                    height: 103.h,
                    width: 100.w,
                    child: Image.asset('assets/icons/app_logo.png'),
                  ),
                  SizedBox(height: 10.h),
                  Center(
                    child: Column(
                      children: [
                        Text(
                          'مرحبًا بك في تطبيق "بارت موتور"',
                          style: StylesManager.getBoldStyle(
                            color: ColorManager.white,
                            fontSize: FontSize.s24,
                          ),
                        ),
                        SizedBox(height: 5.h),
                        Text(
                          'وجهتك الأولى لصيانة السيارات، الإنقاذ، وقطع الغيار',
                          style: StylesManager.getBoldStyle(
                            color: Colors.white.withOpacity(.9),
                            fontSize: FontSize.s14,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          'انضم الآن وابدأ رحلتك معنا',
                          style: StylesManager.getBoldStyle(
                            color: Colors.white.withOpacity(.9),
                            fontSize: FontSize.s14,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Container(
                    height: 501.h,
                    width: 382.w,
                    decoration: BoxDecoration(
                      color: ColorManager.white,
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 12.h),
                            child: Container(
                              height: 54.h,
                              width: 360.w,
                              decoration: BoxDecoration(
                                color: Color(0xffFAE7E6),
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5.h),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      height: 42.h,
                                      width: 160.w,
                                      decoration: BoxDecoration(
                                        color:
                                            selectedTab == 'حساب فرد'
                                                ? ColorManager.primary
                                                : null,
                                        borderRadius: BorderRadius.circular(
                                          12.r,
                                        ),
                                      ),
                                      child: TextButton(
                                        onPressed: () => _switchTab('حساب فرد'),
                                        child: Text(
                                          'حساب فرد',
                                          style: StylesManager.getBoldStyle(
                                            color:
                                                selectedTab == 'حساب فرد'
                                                    ? ColorManager.white
                                                    : ColorManager.primary,
                                            fontSize: FontSize.s16,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 42.h,
                                      width: 160.w,
                                      decoration: BoxDecoration(
                                        color:
                                            selectedTab == 'حساب وكيل'
                                                ? ColorManager.primary
                                                : null,
                                        borderRadius: BorderRadius.circular(
                                          12.r,
                                        ),
                                      ),
                                      child: TextButton(
                                        onPressed:
                                            () => _switchTab('حساب وكيل'),
                                        child: Text(
                                          'حساب وكيل',
                                          style: StylesManager.getBoldStyle(
                                            color:
                                                selectedTab == 'حساب وكيل'
                                                    ? ColorManager.white
                                                    : ColorManager.primary,
                                            fontSize: FontSize.s18,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          DefaultTextFormField(
                            hintText: 'اسم المستخدم',
                            isPassword: false,
                            controller: nameController,
                          ),
                          SizedBox(height: 10.h),
                          PhoneInputField(controller: phoneController),
                          DefaultTextFormField(
                            hintText: 'الأيميل (أختيارى)',
                            isPassword: false,
                            controller: emailController,
                          ),
                          SizedBox(height: 20.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Checkbox(
                                activeColor: ColorManager.primary,
                                checkColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.r),
                                ),
                                value: isChecked,
                                onChanged: (bool? value) {
                                  setState(() {
                                    isChecked = value ?? false;
                                  });
                                },
                              ),
                              Column(
                                children: [
                                  Text(
                                    'باستخدامك التطبيق، فأنت توافق على',
                                    style: StylesManager.getBoldStyle(
                                      color: ColorManager.black,
                                      fontSize: FontSize.s14,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(width: 5.w),
                                      GestureDetector(
                                        onTap: () {},
                                        child: Text(
                                          'سياسة الخصوصية',
                                          style: StylesManager.getBoldStyle(
                                            color: ColorManager.textButtonColor,
                                            fontSize: FontSize.s14,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        ' و ',
                                        style: StylesManager.getBoldStyle(
                                          color: ColorManager.black,
                                          fontSize: FontSize.s14,
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {},
                                        child: Text(
                                          'الشروط والأحكام .',
                                          style: StylesManager.getBoldStyle(
                                            color: ColorManager.textButtonColor,
                                            fontSize: FontSize.s14,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 20.h),
                          DefaultElevatedButton(
                            onPressed: () {},
                            text: "انشاء الحساب",
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 15.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'لديك حساب بالفعل؟ ',
                                  style: StylesManager.getBoldStyle(
                                    color: ColorManager.black,
                                    fontSize: FontSize.s14,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Text(
                                    'تسجيل دخول',
                                    style: StylesManager.getBoldStyle(
                                      color: ColorManager.textButtonColor,
                                      fontSize: FontSize.s14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 50.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

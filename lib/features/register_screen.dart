import 'package:animate_do/animate_do.dart';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motor/core/resources/color_manager.dart';
import 'package:motor/core/resources/font_manager.dart';
import 'package:motor/core/resources/styles_manager.dart';
import 'package:motor/core/widgets/clickabe_upload.dart';
import 'package:motor/core/widgets/custom_dropdown.dart';
import 'package:motor/core/widgets/default_elevated_button.dart';
import 'package:motor/core/widgets/default_text_form_field.dart';
import 'package:motor/core/widgets/phone_input_field.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = '/register';
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>
    with TickerProviderStateMixin {
  TextEditingController nameController = TextEditingController();
  TextEditingController agentNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  bool isChecked = false;
  int selectedIndex = 0;
  bool isAgentTab = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('assets/images/background_image.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              ColorManager.backGroundRed.withOpacity(0.5),
              BlendMode.darken,
            ),
          ),
        ),
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.sizeOf(context).height,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: isAgentTab ? 100.h : 150.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (!isAgentTab)
                        FadeInDown(
                          key: ValueKey(isAgentTab),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 103.h,
                                width: 100.w,
                                child: Image.asset('assets/icons/app_logo.png'),
                              ),
                              SizedBox(height: 10.h),
                              Column(
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
                            ],
                          ),
                        )
                      else
                        FadeInDown(
                          child: Row(
                            children: [
                              SizedBox(
                                height: 72.h,
                                width: 97.w,
                                child: Image.asset('assets/icons/app_logo.png'),
                              ),
                              SizedBox(width: 10.w),
                              Column(
                                children: [
                                  Text(
                                    'مرحبًا بك في تطبيق "بارت موتور"',
                                    style: StylesManager.getBoldStyle(
                                      color: ColorManager.white,
                                      fontSize: FontSize.s16,
                                    ),
                                  ),
                                  Text(
                                    'وجهتك الأولى لصيانة السيارات، الإنقاذ، وقطع ',
                                    style: StylesManager.getBoldStyle(
                                      color: Colors.white.withOpacity(.9),
                                      fontSize: FontSize.s10,
                                    ),
                                  ),
                                  Text(
                                    'الغيار انضم الآن وابدأ رحلتك معنا',
                                    style: StylesManager.getBoldStyle(
                                      color: Colors.white.withOpacity(.9),
                                      fontSize: FontSize.s10,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Align(
                    child: AnimatedSize(
                      duration: const Duration(milliseconds: 900),
                      curve: Curves.easeInOut,
                      child: Container(
                        width: 382.w,
                        decoration: BoxDecoration(
                          color: ColorManager.white,
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 12.w),
                        child: Column(
                          children: [
                            SizedBox(
                              width: 360.w,
                              height: 65.h,
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 12.h),
                                child: AnimatedToggleSwitch<int>.size(
                                  textDirection: TextDirection.rtl,
                                  current: selectedIndex,
                                  values: const [0, 1],
                                  iconOpacity: 1.0,
                                  indicatorSize: Size(180.w, 50.h),
                                  iconBuilder: (value) {
                                    final isSelected = selectedIndex == value;
                                    return Center(
                                      child: Text(
                                        value == 0 ? 'حساب فرد' : 'حساب وكيل',
                                        style: StylesManager.getBoldStyle(
                                          color:
                                              isSelected
                                                  ? ColorManager.white
                                                  : ColorManager.primary,
                                          fontSize: FontSize.s14,
                                        ),
                                      ),
                                    );
                                  },
                                  borderWidth: 0.0,
                                  iconAnimationType: AnimationType.onHover,
                                  style: ToggleStyle(
                                    backgroundColor: ColorManager.backGroundRed,
                                    borderRadius: BorderRadius.circular(15.r),
                                    indicatorColor: ColorManager.primary,
                                  ),
                                  onChanged: (i) {
                                    setState(() {
                                      selectedIndex = i;
                                      isAgentTab = i == 1;
                                    });
                                  },
                                ),
                              ),
                            ),
                            if (isAgentTab) ...[
                              FadeInDown(
                                child: DefaultTextFormField(
                                  hintText: 'الاسم التجاري',
                                  isPassword: false,
                                  controller: agentNameController,
                                ),
                              ),
                              SizedBox(height: 10.h),
                              FadeInDown(child: CustomDropdown()),
                              SizedBox(height: 10.h),
                            ],
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
                            if (isAgentTab) ...[
                              SizedBox(height: 10.h),
                              FadeInDown(child: ClickableIdUpload()),
                            ],
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                        GestureDetector(
                                          onTap: () {},
                                          child: Text(
                                            'سياسة الخصوصية',
                                            style: StylesManager.getBoldStyle(
                                              color:
                                                  ColorManager.textButtonColor,
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
                                              color:
                                                  ColorManager.textButtonColor,
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
                              padding: EdgeInsets.symmetric(
                                vertical: 6.h,
                                horizontal: 20.w,
                              ),
                              child: Divider(),
                            ),
                            Row(
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
                            SizedBox(height: 10.h),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

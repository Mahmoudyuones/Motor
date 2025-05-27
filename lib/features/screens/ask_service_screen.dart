import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motor/core/resources/color_manager.dart';
import 'package:motor/core/resources/font_manager.dart';
import 'package:motor/core/resources/styles_manager.dart';
import 'package:motor/core/widgets/custom_dropdown.dart';
import 'package:motor/core/widgets/default_elevated_button.dart';
import 'package:motor/core/widgets/default_text_form_field.dart';
import 'package:motor/core/widgets/phone_input_field.dart';

class AskServiceScreen extends StatefulWidget {
  static const String routeName = '/askServiceScreen';
  const AskServiceScreen({super.key});

  @override
  State<AskServiceScreen> createState() => _AskServiceScreenState();
}

class _AskServiceScreenState extends State<AskServiceScreen> {
  int selectedIndex = 0;
  TextEditingController addressController = TextEditingController();
  TextEditingController problemController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('assets/images/map.png'),
            fit: BoxFit.fill,
          ),
        ),

        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.sizeOf(context).height,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    SizedBox(height: 55.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () => Navigator.of(context).pop(),
                            child: Container(
                              padding: EdgeInsets.all(15.h),
                              decoration: BoxDecoration(
                                color: ColorManager.white,
                                borderRadius: BorderRadius.circular(9.r),
                              ),
                              child: Icon(
                                Icons.arrow_back_ios_new,
                                size: 20.sp,
                                color: ColorManager.black,
                              ),
                            ),
                          ),
                          SizedBox(width: 15.w),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                print('select where you are');
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 15.h),

                                decoration: BoxDecoration(
                                  color: ColorManager.white,
                                  borderRadius: BorderRadius.circular(9.r),
                                ),

                                child: Center(
                                  child: Text(
                                    'حدد موقعك عل الخريطة',
                                    style: StylesManager.getSemiBoldStyle(
                                      color: ColorManager.black,
                                      fontSize: FontSize.s16,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            print(' //gps icon taped');
                          },
                          child: Container(
                            width: 40.w,
                            height: 40.h,
                            padding: EdgeInsets.all(8.h),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.r),
                              color: ColorManager.primary,
                            ),
                            child: Image.asset('assets/icons/gps.png'),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Container(
                          decoration: BoxDecoration(
                            color: ColorManager.white,
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 12.w,
                            vertical: 10.h,
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Image.asset('assets/images/routing.png'),
                                  SizedBox(width: 5.w),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'طلب خدمة الصيانة اوالإنقاذ على الطريق',
                                        style: StylesManager.getSemiBoldStyle(
                                          color: ColorManager.primary,
                                          fontSize: FontSize.s16,
                                        ),
                                      ),
                                      Text(
                                        'سيتم التواصل معك بعد ادخال البيانات',
                                        style: StylesManager.getSemiBoldStyle(
                                          color: ColorManager.grey,
                                          fontSize: FontSize.s14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 25.w),
                                child: Divider(height: 15.h, thickness: .5),
                              ),
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
                                          value == 0
                                              ? 'خدمة الصيانة'
                                              : 'خدمة الانقاذ',
                                          style: StylesManager.getBoldStyle(
                                            color:
                                                isSelected
                                                    ? ColorManager.white
                                                    : ColorManager.primary,
                                            fontSize: FontSize.s12,
                                          ),
                                        ),
                                      );
                                    },
                                    borderWidth: 0.0,
                                    iconAnimationType: AnimationType.onHover,
                                    style: ToggleStyle(
                                      backgroundColor:
                                          ColorManager.backGroundRed,
                                      borderRadius: BorderRadius.circular(12.r),
                                      indicatorColor: ColorManager.primary,
                                    ),
                                    onChanged: (i) {
                                      setState(() {
                                        selectedIndex = i;
                                      });
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(height: 10.h),
                              CustomDropdown(
                                hintText: 'نوع المركبة',
                                items: ['نوع 1', 'نوع 2', 'نوع 3'],
                              ),
                              SizedBox(height: 10.h),
                              DefaultTextFormField(
                                labelText: 'وصف العنوان',
                                hintText: 'اكتب التفاصيل هنا...',
                                isPassword: false,
                                controller: problemController,
                                keyboardType: TextInputType.multiline,
                                maxLines: 5,
                                minLines: 3,
                                veticalContentPadding: 20.h,
                              ),

                              SizedBox(height: 10.h),
                              PhoneInputField(controller: phoneController),
                              DefaultTextFormField(
                                labelText: 'وصف المشكلة',
                                hintText: 'اكتب التفاصيل هنا...',
                                isPassword: false,
                                controller: problemController,
                                keyboardType: TextInputType.multiline,
                                maxLines: 5,
                                minLines: 3,
                                veticalContentPadding: 20.h,
                              ),
                              SizedBox(height: 20.h),
                              DefaultElevatedButton(
                                onPressed: () {},
                                text: 'طلب الخدمة',
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20.h),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

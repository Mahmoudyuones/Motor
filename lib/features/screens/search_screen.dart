import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motor/core/resources/color_manager.dart';
import 'package:motor/core/resources/font_manager.dart';
import 'package:motor/core/resources/styles_manager.dart';
import 'package:motor/core/widgets/default_text_form_field.dart';
import 'package:motor/core/widgets/suggestion_item.dart';
import 'package:motor/features/screens/search_and_filter_results_screen.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = '/search';

  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  List<String> suggestions = List.generate(50, (index) => 'أقتراح $index');
  List<String> filteredSuggestions = [];
  @override
  void initState() {
    super.initState();
    filteredSuggestions = suggestions;
  }

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
        child: FadeInUpBig(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () => Navigator.of(context).pop(),
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: ColorManager.backGroundRed,
                            borderRadius: BorderRadius.circular(9.r),
                          ),
                          child: Icon(Icons.close, size: 30, color: Colors.red),
                        ),
                      ),
                      SizedBox(
                        width: 338.w,
                        height: 46.h,
                        child: DefaultTextFormField(
                          onChanged: (p0) {
                            setState(() {
                              filteredSuggestions =
                                  suggestions
                                      .where(
                                        (element) => element.contains(
                                          searchController.text,
                                        ),
                                      )
                                      .toList();
                            });
                          },
                          isSearch: true,
                          prefixIcon: InkWell(
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: ColorManager.white,
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                              child: Image.asset(
                                'assets/icons/Search Icon.png',
                                width: 24.w,
                                height: 24.h,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),

                          hintText: 'ما الذي تبحث عنه',
                          isPassword: false,
                          controller: searchController,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: ColorManager.white,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Column(
                          children: [
                            SizedBox(height: 20.h),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                'المقترحات',
                                style: StylesManager.getBoldStyle(
                                  color: ColorManager.black,
                                  fontSize: FontSize.s18,
                                ),
                              ),
                            ),
                            SizedBox(height: 20.h),
                            Expanded(
                              child:
                                  filteredSuggestions.isEmpty
                                      ? Center(
                                        child: Text(
                                          'لا يوجد اقتراحات',
                                          style: StylesManager.getSemiBoldStyle(
                                            color: ColorManager.grey,
                                            fontSize: FontSize.s16,
                                          ),
                                        ),
                                      )
                                      : ListView.separated(
                                        separatorBuilder:
                                            (context, index) =>
                                                SizedBox(height: 10.h),
                                        itemCount: filteredSuggestions.length,
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) {
                                          return InkWell(
                                            onTap: () {
                                              Navigator.of(context).pushNamed(
                                                SearchAndFilterResultsScreen
                                                    .routeName,
                                              );
                                            },
                                            child: SuggestionItem(
                                              title:
                                                  '${filteredSuggestions[index]} ',
                                            ),
                                          );
                                        },
                                      ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

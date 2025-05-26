import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:motor/core/models/product_model.dart';
import 'package:motor/core/resources/color_manager.dart';
import 'package:motor/core/resources/font_manager.dart';
import 'package:motor/core/resources/styles_manager.dart';
import 'package:motor/core/widgets/basket_item.dart';
import 'package:motor/core/widgets/default_elevated_button.dart';
import 'package:motor/features/screens/payment_screen.dart';

class BasketTap extends StatefulWidget {
  const BasketTap({super.key});

  @override
  State<BasketTap> createState() => _BasketTapState();
}

class _BasketTapState extends State<BasketTap> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  List<int> productQuantities = [];
  int productsNumber = 0;
  double totalPrice = 500000;
  List<ProductModel> products = [
    ProductModel(
      productName: 'x',
      description: 'Ferrari 6.0-liter F14 Ferrari 6.0-liter F14',
      tag: 'tag',
      category: 'category',
      views: 300,
      sellerName: 'sellerName',
      isFavorite: false,
      imagesPaths: ['assets/images/engine_image.png'],
      oldPrice: 25000,
      newPrice: 22000,
    ),
    ProductModel(
      productName: 'xx',
      description: 'Ferrari 6.0-liter F14 Ferrari 6.0-liter F14',
      tag: 'tag',
      category: 'category',
      views: 300,
      sellerName: 'sellerName',
      isFavorite: false,
      imagesPaths: ['assets/images/engine_image.png'],
      oldPrice: 25000,
      newPrice: 22000,
    ),
    ProductModel(
      productName: 'xxxx',
      description: 'Ferrari 6.0-liter F14 Ferrari 6.0-liter F14',
      tag: 'tag',
      category: 'category',
      views: 300,
      sellerName: 'sellerName',
      isFavorite: false,
      imagesPaths: ['assets/images/engine_image.png'],
      oldPrice: 25000,
      newPrice: 22000,
    ),
  ];

  @override
  void initState() {
    super.initState();
    productQuantities = List.generate(products.length, (_) => 1);
    productsNumber = productQuantities.fold(0, (sum, item) => sum + item);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 140.h,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/home_app_bar_image.png'),
              fit: BoxFit.fill,
            ),
          ),
        ),
        PositionedDirectional(
          top: 60.h,
          start: 0.h,
          end: 0,

          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'السلة',
                      style: StylesManager.getBoldStyle(
                        color: ColorManager.white,
                        fontSize: FontSize.s18,
                      ),
                    ),
                    Text(
                      '${products.length} عناصر',
                      style: StylesManager.getRegularStyle(
                        color: ColorManager.white,
                        fontSize: FontSize.s17,
                      ),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    deleteAll();
                  },
                  child: Container(
                    width: 42.w,
                    height: 42.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.r),
                      color: ColorManager.white,
                    ),
                    child: Image.asset('assets/icons/trash.png'),
                  ),
                ),
              ],
            ),
          ),
        ),
        Column(
          children: [
            SizedBox(height: 130.h),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: AnimatedList(
                  key: _listKey,
                  initialItemCount: products.length,
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index, animation) {
                    final product = products[index];
                    final quantity = productQuantities[index];

                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.h),
                      child: SizeTransition(
                        sizeFactor: animation,
                        child: BasketItem(
                          key: ValueKey(product),
                          productModel: product,
                          productCounter: quantity,
                          onRemoveTap: () => removeItem(index),
                          onPlusTap: () {
                            setState(() {
                              productQuantities[index]++;
                              productsNumber++;
                            });
                          },
                          onMinusTap: () {
                            if (productQuantities[index] > 1) {
                              setState(() {
                                productQuantities[index]--;
                                productsNumber--;
                              });
                            } else {
                              removeItem(index);
                            }
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Container(
              height: 70.h,
              decoration: BoxDecoration(
                color: ColorManager.white,
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(12.r),
                  right: Radius.circular(12.r),
                ),
                boxShadow: [
                  BoxShadow(
                    color: ColorManager.grey.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 8,
                    offset: Offset(0, -4),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 10.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              textAlign: TextAlign.right,
                              'الاجمالي',
                              style: StylesManager.getBoldStyle(
                                color: ColorManager.grey,
                                fontSize: FontSize.s16,
                              ),
                            ),
                            Text(
                              '${totalPrice.toStringAsFixed(0)} ر.ي',
                              style: StylesManager.getBoldStyle(
                                color: Colors.red,
                                fontSize: FontSize.s18,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    DefaultElevatedButton(
                      width: 250.w,
                      onPressed: () {
                        Navigator.of(
                          context,
                        ).pushNamed(PaymentScreen.routeName);
                      },
                      text: 'متابعة',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  void removeItem(int index) {
    final removedItem = products[index];
    final removedQty = productQuantities[index];

    products.removeAt(index);
    productQuantities.removeAt(index);
    productsNumber -= removedQty;

    _listKey.currentState!.removeItem(index, (context, animation) {
      return SizeTransition(
        sizeFactor: animation,
        child: BasketItem(
          productModel: removedItem,
          productCounter: removedQty,
          onRemoveTap: () {},
          onPlusTap: () {},
          onMinusTap: () {},
        ),
      );
    }, duration: const Duration(milliseconds: 300));

    setState(() {});
  }

  void deleteAll() {
    print('delete all');
  }
}

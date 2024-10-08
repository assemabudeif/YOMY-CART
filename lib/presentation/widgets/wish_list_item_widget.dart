import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '/presentation/resources/colors_manager.dart';
import '/presentation/resources/font_manager.dart';
import '/presentation/resources/strings_manager.dart';
import '/presentation/resources/values_manager.dart';
import '/presentation/widgets/default_button_widget.dart';

class WishListItemWidget extends StatelessWidget {
  final bool inCart;
  final String name;
  final String price;
  final String image;
  final double rate;

  const WishListItemWidget({
    Key? key,
    required this.inCart,
    required this.name,
    required this.price,
    required this.image,
    required this.rate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        /// TODO

        // Navigator.pushNamed(context, Routes.product);
      },
      child: SizedBox(
        width: AppSize.s163,
        child: Card(
          elevation: AppSize.s10,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(AppSize.s15),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(9.0),
            child: Column(
              children: [
                //product image
                Image.asset(
                  image,
                  height: 82,
                  width: 143,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),

                    //product name
                    Text(
                      name,
                      style: const TextStyle(
                        color: ColorManager.primary,
                        fontSize: AppSize.s12,
                        fontWeight: FontWeightManager.bold,
                        fontFamily: FontConstants.fontFamily,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),

                    //price
                    Text(
                      'Price : $price',
                      style: const TextStyle(
                        color: ColorManager.greyDark,
                        fontSize: AppSize.s10,
                        fontWeight: FontWeightManager.bold,
                        fontFamily: FontConstants.fontFamily,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),

                    //rate
                    RatingBar.builder(
                      unratedColor: ColorManager.greyDark,
                      initialRating: rate,
                      minRating: 1,
                      itemSize: AppSize.s20,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: EdgeInsets.zero,
                      itemBuilder: (context, _) => const Icon(
                        Icons.star_rounded,
                        color: ColorManager.accent,
                      ),
                      onRatingUpdate: (rating) {},
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),

                    //cart
                    Row(
                      children: [
                        // cart

                        inCart
                            //in cart
                            ? Expanded(
                                child: Row(
                                  children: [
                                    Container(
                                      height: AppSize.s32,
                                      width: AppSize.s32,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(AppSize.s10),
                                        color: ColorManager.grey4,
                                      ),
                                      child: Center(
                                        child: IconButton(
                                          onPressed: () {},
                                          icon: const Text(
                                            '-',
                                            style: TextStyle(
                                              color: ColorManager.white,
                                              fontSize: AppSize.s22,
                                            ),
                                          ),
                                          padding: EdgeInsets.zero,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Center(
                                        child: Text(
                                          '1 Kg',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .copyWith(
                                                color: ColorManager.primary,
                                                fontSize: AppSize.s16,
                                                fontFamily:
                                                    FontConstants.fontFamily,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: AppSize.s32,
                                      width: AppSize.s32,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(AppSize.s10),
                                        color: ColorManager.primaryLight,
                                      ),
                                      child: Center(
                                        child: IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                            Icons.add,
                                            color: ColorManager.white,
                                            size: AppSize.s22,
                                          ),
                                          padding: EdgeInsets.zero,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            //add to cart
                            : Expanded(
                                child: DefaultButtonWidget(
                                  onPressed: () {},
                                  radius: AppSize.s15,
                                  color: ColorManager.primaryLight,
                                  child: Text(
                                    StringsManager.addToCart,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                          color: ColorManager.white,
                                          fontWeight: FontWeightManager.medium,
                                          fontSize: FontSizeManager.s14,
                                        ),
                                  ),
                                ),
                              ),

                        SizedBox(
                          width: MediaQuery.of(context).size.height * 0.01,
                        ),
                        //favorite icon
                        Container(
                          height: AppSize.s32,
                          width: AppSize.s32,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(AppSize.s10),
                            color: ColorManager.primaryLight,
                          ),
                          child: Center(
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.delete_outline_rounded,
                                color: ColorManager.white,
                                size: AppSize.s22,
                              ),
                              padding: EdgeInsets.zero,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'dart:developer';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:currency_converter/app/extensions.dart';
import 'package:currency_converter/app/resources/managers/color_manager.dart';
import 'package:currency_converter/app/resources/managers/strings_manager.dart';
import 'package:currency_converter/presentation/currency/provider/currency_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../app/resources/managers/assets_manager.dart';
import '../../../app/resources/utils/utils.dart';

class CurrencyScreen extends StatelessWidget {
  const CurrencyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CurrencyProvider currencyProvider =
        Provider.of<CurrencyProvider>(context);

    return WillPopScope(
      onWillPop: () async {
        // return false; // Stay on page
        // return true; // Pop page

        final bool? shouldPop = await Utils.showLeavingAppDialog(context);
        return shouldPop ?? false;
      },
      child: GestureDetector(
        onTap: () {
          // Click outside to disappear keyboard
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          appBar: AppBar(
            elevation: 0.5,
            backgroundColor: ColorManager.primaryGreen,
            systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: ColorManager.primaryGreen,
              statusBarIconBrightness: Brightness.light,
            ),
            title: const Text(
              AppStrings.currencyConverter,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            centerTitle: true,
          ),
          body: ConditionalBuilder(
            condition: currencyProvider.getCurrencyData != null,
            builder: (context){
              return Container(
                // width: 100.w,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 2.h),
                      Image(
                        width: 20.w,
                        image: const AssetImage(ImageAssets.logo),
                      ),
                      SizedBox(height: 4.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 30.w,
                            child: const Text(
                              AppStrings.from,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 50.w,
                            height: 60,
                            child: InputDecorator(
                              decoration:
                              const InputDecoration(border: OutlineInputBorder()),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  // Initial Value
                                  value: currencyProvider.baseCurrency,
                                  // Down Arrow Icon
                                  icon: const Icon(Icons.keyboard_arrow_down),
                                  // Array list of items
                                  items: currencyProvider.currencyAbbreviations
                                      .map((String items) {
                                    return DropdownMenuItem(
                                      value: items,
                                      child: Text(items),
                                    );
                                  }).toList(),
                                  // After selecting the desired option,it will
                                  // change button value to selected value
                                  onChanged: (String? newValue)async {
                                    currencyProvider.setBaseCurrency(newValue!);
                                    await currencyProvider.fetchCurrencyData(newValue);
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 2.h),
                      // Input
                      TextFormField(
                        controller: currencyProvider.baseCurrencyController,
                        keyboardType: TextInputType.number,
                        decoration:   InputDecoration(
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 2,
                            ),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 2,
                            ),
                          ),
                          hintText: AppStrings.baseCurrencyValue,
                          hintStyle: TextStyle(
                            color: Colors.grey[400],
                          ),
                        ),
                        onChanged: (String value) {
                           currencyProvider.convertCurrency(value, currencyProvider.targetCurrency);

                        },
                      ),
                      SizedBox(height: 6.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 30.w,
                            child: const Text(
                              AppStrings.to,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 50.w,
                            height: 60,
                            child: InputDecorator(
                              decoration:
                              const InputDecoration(border: OutlineInputBorder()),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton(
                                  // Initial Value
                                  value: currencyProvider.targetCurrency,
                                  // Down Arrow Icon
                                  icon: const Icon(Icons.keyboard_arrow_down),
                                  // Array list of items
                                  items: currencyProvider.currencyAbbreviations
                                      .map((String items) {
                                    return DropdownMenuItem(
                                      value: items,
                                      child: Text(items),
                                    );
                                  }).toList(),
                                  // After selecting the desired option,it will
                                  // change button value to selected value
                                  onChanged: (String? newValue) {
                                    currencyProvider.setTargetCurrency(newValue!);
                                      currencyProvider.convertCurrency(currencyProvider.baseCurrencyController.text, currencyProvider.targetCurrency);

                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 2.h),
                      // Output
                      TextFormField(
                        enabled: false,
                        controller: currencyProvider.targetCurrencyController,
                        keyboardType: TextInputType.number,
                        decoration:   InputDecoration(
                          border: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey,
                              width: 2,
                            ),
                          ),
                          hintText: AppStrings.targetCurrencyValue,
                          hintStyle: TextStyle(
                            color: Colors.grey[400],
                          ),
                        ),


                        onChanged: (value) {
                          log(value);
                        },
                      ),
                      SizedBox(height: 2.h),
                    ],
                  ),
                ),
              );
            },
            fallback: (context)=> const Center(
              child: CircularProgressIndicator(
                color: ColorManager.primaryGreen,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

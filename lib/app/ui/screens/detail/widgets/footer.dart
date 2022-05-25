import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:g59_find_home/app/core/theme/app_theme.dart';
import 'package:g59_find_home/app/data/models/response/response_house_model.dart';
import 'package:g59_find_home/app/ui/screens/detail/detail_controller.dart';
import 'package:g59_find_home/app/ui/widgets/btn_primary.dart';
import 'package:g59_find_home/app/ui/widgets/input_text.dart';
import 'package:get/get.dart';

class Footer extends StatefulWidget {
  @override
  FooterState createState() => FooterState();

  Footer({
    required this.house,
  });
  final ResponseHouseModel house;
}

class FooterState extends State<Footer> {
  final _dateController = TextEditingController();
  final _priceController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _dateController.dispose();
    _priceController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: 80.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.r),
            topRight: Radius.circular(30.r),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "\$${widget.house.price} USD",
              style: Theme.of(context).textTheme.headline6!.copyWith(
                  color: AppTheme.blueDark, fontWeight: FontWeight.w600),
            ),
            GestureDetector(
              onTap: () => _settingModalBottomSheet(context),
              child: Container(
                width: 170.w,
                height: 45.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppTheme.cyan,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Text(
                  "Reserved Now!",
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.w400),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _settingModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      //isDismissible: false,
      //enableDrag: false,
      builder: (_) => GetBuilder<DetailController>(
        builder: (_) => Container(
          height: 400.h,
          padding: EdgeInsets.only(
            left: 20.w,
            right: 20.w,
            top: 30.h,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r),
              topRight: Radius.circular(20.r),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Reserved",
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      color: AppTheme.blueDark,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              SizedBox(height: 30.h),
              InputText(
                iconPrefix: Icons.date_range,
                iconColor: AppTheme.light,
                border: InputBorder.none,
                keyboardType: TextInputType.datetime,
                labelText: "Date",
                filled: false,
                enabledBorderColor: Colors.black26,
                focusedBorderColor: AppTheme.cyan,
                fontSize: 14.0,
                fontColor: Colors.black45,
                onChanged: _.onChangeDate,
              ),
              SizedBox(height: 20.h),
              InputText(
                initialValue: "\$ ${_.houseModel.price}",
                iconPrefix: Icons.monetization_on,
                iconColor: AppTheme.light,
                border: InputBorder.none,
                keyboardType: TextInputType.number,
                labelText: "Price",
                filled: false,
                enabledBorderColor: Colors.black26,
                focusedBorderColor: AppTheme.cyan,
                readOnly: true,
                fontSize: 14.0,
                fontColor: Colors.black45,
              ),
              SizedBox(height: 50.h),
              BtnPrimary(
                text: "Save",
                onPressed: _.save
              ),
            ],
          ),
        ),
      ),
    );
  }
}

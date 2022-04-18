import 'package:flutter/material.dart';
import 'dart:core';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:inventory_controller/common/constants.dart';
import 'package:inventory_controller/common/date_formater.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:inventory_controller/components/leadingButton/leading_button.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class CustomAppBar extends StatefulWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;
  double? elevation;

  final Function() notifySearch;
  final Function(DateTime) setFormDate, setToDate;
  final Function(DateTime fromDate, DateTime toDate) onSearch;
  final bool? rangeSearchLoading;
  final DateTime? fromDate, toDate;

  CustomAppBar(
      {Key? key,
      required this.notifySearch,
      required this.setToDate,
      required this.setFormDate,
      this.rangeSearchLoading,
      this.fromDate,
      this.elevation = 0, 
      this.toDate,
      required this.onSearch})
      : preferredSize = Size.fromHeight(50.0),
        super(key: key);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  var now = DateTime.now();
  @override
  Widget build(BuildContext context) {
    void flushErrorMsg(String msg) => Flushbar(
          barBlur: 10,
          isDismissible: true,
          margin: EdgeInsets.all(8),
          borderRadius: BorderRadius.circular(8),
          backgroundColor: Colors.red,
          flushbarPosition: FlushbarPosition.TOP,
          message: msg,
          // duration: Duration(seconds: 3),
        )..show(context);
    return AppBar(
      elevation: widget.elevation,
      titleSpacing: 0.0,
      shadowColor: lightGreyColor,
      title: Row(
        children: [
          Container(
            child: LeadingButton(
              color: Colors.transparent,
              icon: Icons.arrow_back_rounded,
              iconColor: darkColor,
              size: 37,
              onPressed: () {},
            ),
          ),
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: widget.rangeSearchLoading!
                      ? null
                      : () async {
                          var datePicked =
                              await DatePicker.showSimpleDatePicker(
                            context,
                            initialDate: now,
                            lastDate: now,
                            titleText: 'Select start date',
                            dateFormat: "yyyy-MMMM-dd",
                            locale: DateTimePickerLocale.en_us,
                            looping: false,
                          );
                          if (datePicked != null) {
                            DateTime time = datePicked.subtract(Duration(
                                hours: datePicked.hour,
                                minutes: datePicked.minute,
                                seconds: datePicked.second,
                                milliseconds: datePicked.millisecond,
                                microseconds: datePicked.microsecond));
                            return widget.setFormDate(time);
                          }
                        },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 7.0, vertical: 10.0),
                    child: Column(children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(right: 7.0),
                            child: Text(
                              "From",
                              style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            widget.fromDate == null
                                ? 'not defined'
                                : Utils.dateToString(widget.fromDate!),
                            style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFFD9D9D9)),
                            textAlign: TextAlign.right,
                          ),
                        ],
                      ),
                    ]),
                  ),
                ),
                Expanded(
                  child: new Container(
                      margin: const EdgeInsets.only(left: 10.0, right: 20.0),
                      child: Divider(
                        color: Color(0xFFD9D9D9),
                        height: 36,
                      )),
                ),
                InkWell(
                  onTap: widget.rangeSearchLoading!
                      ? null
                      : () async {
                          var datePicked =
                              await DatePicker.showSimpleDatePicker(
                            context,
                            initialDate: now,
                            lastDate: now,
                            titleText: 'Select end date',
                            dateFormat: "yyyy-MMMM-dd",
                            locale: DateTimePickerLocale.en_us,
                            looping: false,
                          );

                          if (datePicked != null)
                            return widget.setToDate(datePicked);
                        },
                  child: Container(
                    child: Column(children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(right: 7.0),
                            child: Text(
                              "To",
                              style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black),
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            widget.toDate == null
                                ? 'not defined'
                                : Utils.dateToString(widget.toDate!),
                            style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFFD9D9D9)),
                            textAlign: TextAlign.right,
                          ),
                        ],
                      ),
                    ]),
                  ),
                ),
              ],
            ),
          ),
          RawMaterialButton(
            onPressed: () {
              if (widget.rangeSearchLoading!)
                return null;
              else if (widget.fromDate == null)
                return flushErrorMsg('Please provide "from" date');
              else if (widget.fromDate!.isAfter(widget.toDate!)) {
                print(widget.fromDate);
                return flushErrorMsg(
                    '"From" date can not be earlier than "To"date');
              } else if (widget.toDate!.isBefore(widget.fromDate!))
                return flushErrorMsg(
                    '"To" date can not be older than "from" date');
              else
                return widget.onSearch(widget.fromDate!, widget.toDate!);
            },
            elevation: 0.0,
            fillColor: primaryColor,
            child: widget.rangeSearchLoading!
                ? SizedBox(
                    child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: new AlwaysStoppedAnimation<Color>(
                            primaryLightColor)),
                    height: 20.0,
                    width: 20.0,
                  )
                : Icon(
                    Icons.arrow_forward,
                    size: 20.0,
                    color: primaryLightColor,
                  ),
            padding: EdgeInsets.all(10.0),
            shape: CircleBorder(),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
    );
  }
}

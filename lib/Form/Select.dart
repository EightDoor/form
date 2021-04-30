import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pickers/time_picker/model/date_mode.dart';
import 'package:flutter_pickers/time_picker/model/pduration.dart';
import 'package:zkform/Form/Time.dart';
import 'package:zkform/Tapped.dart';
import 'package:zkform/models/Form/input.dart';
import 'package:zkform/tool/show_picker_utils.dart';

import 'Input.dart';

/// 选择
class FormSelectCom extends StatefulWidget {
  final FormCallBackItem onCallBack;
  final FormInputModel data;
  final String type;
  FormSelectCom(
      {required Key key,
      required this.onCallBack,
      required this.data,
      required this.type})
      : super(key: key);
  @override
  _FormSelectComState createState() => _FormSelectComState();
}

class _FormSelectComState extends State<FormSelectCom> {
  String selectLabel = '';
  @override
  void initState() {
    super.initState();
  }

  @override
  void didUpdateWidget(covariant FormSelectCom oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.data.value != null && selectLabel.isEmpty) {
      setState(() {
        selectLabel = widget.data.value ?? "";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //   border: Border(
      //     bottom:
      //         BorderSide(color: Theme.of(context).dividerColor, width: 1.sp),
      //   ),
      // ),
      padding: EdgeInsets.only(bottom: 15),
      margin: EdgeInsets.only(top: 15),
      child: Tapped(
        onTap: () {
          switch (widget.type) {
            case "select":
              ShowPickerUtils.showSingPicker(
                context: context,
                sourceList: widget.data.list ?? [],
                selectLabel: selectLabel,
                callChange: (val) {
                  setState(() {
                    selectLabel = val;
                  });
                },
                callResult: (val) {
                  widget.onCallBack(val);
                },
              );
              break;
            case "time":
              PDuration defaultValue = PDuration.now();
              DateMode defaultMode =
                  (widget.data.mode != null ? widget.data.mode : DateMode.YMD)!;
              if (widget.data.value != null) {
                final String time = widget.data.value ?? "";
                DateTime? dateTime = DateUtil.getDateTime(time);
                if (dateTime != null) {
                  defaultValue = PDuration.parse(dateTime);
                }
              }

              showFormTimePicker(
                  context: context,
                  selectDate: defaultValue,
                  mode: defaultMode,
                  callBackItem: (val) {
                    widget.onCallBack(val);
                    setState(() {
                      selectLabel = val;
                    });
                  });
              break;
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text((selectLabel.isNotEmpty
                ? selectLabel
                : widget.data.placeHolder != null
                    ? widget.data.placeHolder
                    : "")!),
            Icon(Icons.expand_more),
          ],
        ),
      ),
    );
  }
}

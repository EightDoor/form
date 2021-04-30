import 'package:flutter/cupertino.dart';
import 'package:flutter_pickers/pickers.dart';
import 'package:flutter_pickers/style/picker_style.dart';
import 'package:flutter_pickers/time_picker/model/date_mode.dart';
import 'package:flutter_pickers/time_picker/model/pduration.dart';
import 'package:flutter_pickers/time_picker/model/suffix.dart';
import 'package:zkform/tool/index.dart';

import 'Input.dart';

/// 时间选择
void showFormTimePicker({
  required BuildContext context,
  DateMode mode = DateMode.YMD,
  Suffix? suffix,
  PDuration? selectDate,
  PDuration? minDate,
  PDuration? maxDate,
  required FormCallBackItem callBackItem,
  FormCallBackItem? callBackChange,
}) {
  // selectDate: PDuration(hour: 18, minute: 36, second: 36),
  // minDate: PDuration(hour: 12, minute: 38, second: 3),
  // maxDate: PDuration(hour: 12, minute: 40, second: 36),
  Pickers.showDatePicker(
    context,
    mode: mode,
    pickerStyle: PickerStyle(
      commitButton: Padding(
        padding: EdgeInsets.only(right: 15),
        child: Text("确定"),
      ),
    ),
    suffix: suffix,
    selectDate: selectDate,
    minDate: minDate,
    onChanged: (p) {
      if (callBackChange != null) {
        callBackChange(Utils.formatModel(p, mode)!);
      }
    },
    maxDate: maxDate,
    onConfirm: (p) {
      Utils.log().d(
        '当前选择的日期: ' + Utils.formatModel(p, mode).toString(),
      );
      callBackItem(Utils.formatModel(p, mode)!);
    },
  );
}

import 'package:flutter/cupertino.dart';
import 'package:flutter_pickers/pickers.dart';
import 'package:flutter_pickers/style/picker_style.dart';
import 'package:zkform/Form/Input.dart';

import 'index.dart';

/// 选择框
class ShowPickerUtils {
  // 单个数据选择
  static void showSingPicker(
      {required BuildContext context,
      required List<Map<String, dynamic>> sourceList,
      String? selectLabel,
      required FormCallBackItem callResult,
      FormCallBackItem? callChange}) {
    selectLabel = selectLabel ?? "请选择";
    List<String> _list = [];
    sourceList.forEach((e) {
      _list.add(e['label']);
    });
    Pickers.showSinglePicker(
      context,
      pickerStyle: PickerStyle(
        commitButton: Padding(
          padding: EdgeInsets.only(right: 15),
          child: Text("确定"),
        ),
      ),
      data: _list,
      selectData: selectLabel,
      onConfirm: (p) {
        String result = ShowPickerUtils.formatValue(p, sourceList);
        Utils.log().d('当前选择的: ' + result);
        callResult(result);
      },
      onChanged: (p) {
        if (callChange != null) {
          callChange(p);
        }
      },
    );
  }

  static String formatValue(String label, list) {
    var result = list.firstWhere((e) => e["label"] == label);
    if (result.isNotEmpty) {
      Utils.log().d('当前选择的: select -> ' + result.toString());
      return result['value'];
    }
    return "选择框数据没有找到";
  }
}

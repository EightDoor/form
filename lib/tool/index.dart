import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_pickers/time_picker/model/date_mode.dart';
import 'package:flutter_pickers/time_picker/model/pduration.dart';
import 'package:logger/logger.dart';

var selectData = {
  DateMode.YMDHMS: '',
  DateMode.YMDHM: '',
  DateMode.YMDH: '',
  DateMode.YMD: '',
  DateMode.YM: '',
  DateMode.Y: '',
  DateMode.MDHMS: '',
  DateMode.HMS: '',
  DateMode.MD: '',
  DateMode.S: '',
};

class Utils {
  /// 隐藏键盘
  static void hideKeyBoard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  /// 弹出toast框
  static void showToast({
    required String status,
    EasyLoadingToastPosition? position,
  }) {
    EasyLoading.showToast(
      status,
      toastPosition: position ?? EasyLoadingToastPosition.center,
    );
  }

  /// 日志打印logger
  static Logger log() {
    var logger = Logger();
    return logger;
  }

  // 格式化选择时间
  static String? formatModel(PDuration p, DateMode modeS) {
    switch (modeS) {
      case DateMode.YMDHMS:
        selectData[modeS] =
            '${p.year}-${p.month}-${p.day} ${p.hour}:${p.minute}:${p.second}';
        break;
      case DateMode.YMDHM:
        selectData[modeS] =
            '${p.year}-${p.month}-${p.day} ${p.hour}:${p.minute}';
        break;
      case DateMode.YMDH:
        selectData[modeS] = '${p.year}-${p.month}-${p.day} ${p.hour}';
        break;
      case DateMode.YMD:
        selectData[modeS] = '${p.year}-${p.month}-${p.day}';
        break;
      case DateMode.YM:
        selectData[modeS] = '${p.year}-${p.month}';
        break;
      case DateMode.Y:
        selectData[modeS] = '${p.year}-${p.month}';
        break;
      case DateMode.MDHMS:
        selectData[modeS] =
            '${p.month}-${p.day} ${p.hour}:${p.minute}:${p.second}';
        break;
      case DateMode.HMS:
        selectData[modeS] = '${p.hour}:${p.minute}:${p.second}';
        break;
      case DateMode.MD:
        selectData[modeS] = '${p.month}-${p.day}';
        break;
      case DateMode.S:
        selectData[modeS] = '${p.second}';
        break;
    }
    return selectData[modeS];
  }
}

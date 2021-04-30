import 'package:flutter/cupertino.dart';
import 'package:flutter_pickers/time_picker/model/date_mode.dart';

class FormInputModel {
  // 标识name
  final String name;
  // 占位符
  final String? placeHolder;
  // 前缀
  final Widget? prefix;
  // 宽度
  final double? prefixWidth;
  // 样式排版
  final MainAxisAlignment? mainAxisAlignment;
  // 正则表达式 验证
  final String? required;
  // 验证失败消息提示
  final String? requiredMsg;
  // 值 添加为默认值
  final String? value;

  // 标题 select
  final String? title;
  // 列表项 select
  final List<Map<String, dynamic>>? list;

  // mode 时间格式
  final DateMode? mode;

  // 自定义组件
  final Widget? component;

  FormInputModel(
    this.placeHolder,
    this.prefix,
    this.mainAxisAlignment,
    this.prefixWidth,
    this.name,
    this.required,
    this.requiredMsg,
    this.value,
    this.title,
    this.list,
    this.mode,
    this.component,
  );
  FormInputModel.formJson(Map<String, dynamic> json)
      : placeHolder = json['placeHolder'],
        prefix = json["prefix"],
        mainAxisAlignment = json["mainAxisAlignment"],
        prefixWidth = json['prefixWidth'],
        name = json["name"],
        required = json["required"],
        requiredMsg = json["requiredMsg"],
        value = json["value"],
        title = json['title'],
        list = json['list'],
        mode = json["model"],
        component = json["component"];

  Map<String, dynamic> toJson() => {
        'placeHolder': placeHolder,
        'prefix': prefix,
        "mainAxisAlignment": mainAxisAlignment,
        "prefixWidth": prefixWidth,
        "name": name,
        "required": required,
        "requiredMsg": requiredMsg,
        "value": value,
        "title": title,
        "list": list,
        "mode": mode,
        "component": component,
      };
}

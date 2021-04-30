import 'package:flutter/material.dart';
import 'package:zkform/models/Form/input.dart';

/// 输入
typedef FormCallBackItem = Function(String val);

class FormInput extends StatefulWidget {
  final FormInputModel formInputModel;
  final FormCallBackItem onCallBack;
  FormInput(
    Key key,
    this.onCallBack,
    this.formInputModel,
  ) : super(key: key);
  @override
  _FormInputState createState() => _FormInputState();
}

class _FormInputState extends State<FormInput> {
  final TextEditingController _controller = new TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  void didUpdateWidget(covariant FormInput oldWidget) {
    super.didUpdateWidget(oldWidget);
    // 存在更新值， 直接更新
    if (widget.formInputModel.value != null &&
        widget.formInputModel.value!.isNotEmpty) {
      final String value = widget.formInputModel.value ?? "";
      // Utils.log()
      //     .i( '更新的name: ' + widget.formInputModel.name + ',更新的值: ' + value);
      Future.delayed(Duration(milliseconds: 10), () {
        _controller.value = TextEditingValue(text: value);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      onSaved: (val) {
        widget.onCallBack(val ?? "");
      },
      validator: (val) {
        if (widget.formInputModel.required != null) {
          // 必填项
          if (widget.formInputModel.required == '0') {
            if (val!.isEmpty) {
              return widget.formInputModel.requiredMsg ?? "请输入";
            } else {
              return null;
            }
          } else {
            // TODO 正则表达式
          }
        }
      },
      decoration: InputDecoration(
        hintText: widget.formInputModel.placeHolder ?? "请输入内容",
        // errorText: "错误的",
      ),
    );
  }
}

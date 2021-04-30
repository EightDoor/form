import 'package:flutter/material.dart';
import 'package:zkform/Form/FormField.dart';
import 'package:zkform/models/Form/form.dart';
import 'package:zkform/models/Form/input.dart';
import 'package:zkform/tool/index.dart';

import '../Tapped.dart';

/// 表单
typedef onCallBackType = Function(List<Map<String, dynamic>> list);
final formKey = GlobalKey<FormState>();
typedef FormCallBackItem = Function(String val);

class FormCom extends StatefulWidget {
  final List<Map<String, dynamic>> formSelfModelList;
  final onCallBackType onCallBack;
  final Widget submit;
  FormCom(
    this.formSelfModelList, {
    required this.onCallBack,
    required this.submit,
  });
  @override
  _FormComState createState() => _FormComState();
}

class _FormComState extends State<FormCom> {
  List<Map<String, dynamic>> returnList = [];
  late List<FormSelfModel> _formSelfModel;

  @override
  void initState() {
    super.initState();
    _getList();
  }

  _getList() {
    _formSelfModel = widget.formSelfModelList
        .map(
          (e) => FormSelfModel.formJson(e),
        )
        .toList();
  }

  @override
  void didUpdateWidget(covariant FormCom oldWidget) {
    super.didUpdateWidget(oldWidget);
    Utils.log().i("表单更新视图");
    // 父级更新视图
    _getList();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Column(
        children: [
          Form(
            key: formKey,
            autovalidate: true,
            child: Column(
              children: [..._generateItem()],
            ),
          ),
          Tapped(
            onTap: () async {
              Utils.hideKeyBoard(context);
              final status = formKey.currentState!.validate();
              if (status) {
                formKey.currentState!.save();
                widget.onCallBack(returnList);
              } else {
                Utils.showToast(status: "请检查填写项");
              }
              // Utils.log().i(message);
            },
            child: widget.submit,
          ),
        ],
      ),
    );
  }

  List<Widget> _generateItem() {
    return _formSelfModel
        .map(
          (e) => _genChild(e, (val) {
            unifiedReturn(e.properties, val);
          }),
        )
        .toList();
  }

  void unifiedReturn(Map<String, dynamic> item, String val) {
    // 查询值是否存在，存在更新值,不存在添加值
    int index = returnList.indexWhere((e) => e["name"] == item["name"]);
    if (index != -1) {
      // Utils.log().i("存在值-> 替换位置: " + index.toString() + "值为->" + val);
      final result = returnList;
      result[index] = {"name": item["name"], "value": val};
      setState(() {
        returnList = result;
      });
    } else {
      setState(() {
        returnList.add({"name": item["name"], "value": val});
      });
    }
  }

  // 根据不同类型显示对应的组件
  Widget _genChild(FormSelfModel m, FormCallBackItem call) {
    return FormFieldCom(FormInputModel.formJson(m.properties), m, (val) {
      call(val);
    });
  }
}

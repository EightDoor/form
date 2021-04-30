import 'package:flutter/material.dart';
import 'package:zkform/form.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'form Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Map<String, dynamic>> list = [
    {
      "type": "input",
      "properties": {
        "placeHolder": "默认值",
        "prefix": TextCom("输入框"),
        "name": "title",
        "required": "0",
        "requiredMsg": "哈哈哈",
      }
    },
    {
      "type": "input",
      "properties": {
        "placeHolder": "666",
        "prefix": Icon(Icons.ac_unit),
        "name": "title",
      }
    },
    {
      "type": "select",
      "properties": {
        "placeHolder": "请选择",
        "prefix": TextCom("下拉选择框"),
        "name": "xuanze",
        "list": [
          {
            "value": "2",
            "label": "测试",
          },
          {
            "value": "1",
            "label": "测试1",
          },
        ]
      }
    },
    {
      "type": "time",
      "properties": {
        "placeHolder": "请选择时间",
        "prefix": TextCom("时间选择"),
        "name": "timeTest",
      }
    },
    {
      "type": "custom",
      "properties": {
        "component": Text("我的"),
        "name": "custom",
      },
    },
    {
      "type": "radio",
      "properties": {
        "prefix": TextCom("单选"),
        "name": "selectRadio",
        "list": [
          {
            "value": "2",
            "label": "测试",
            "width": 100.0,
          },
          {
            "value": "1",
            "label": "测试1",
          },
        ]
      }
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("demo"),
      ),
      body: Padding(
        padding: EdgeInsets.all(
          10,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              FormCom(
                list,
                onCallBack: (val) {
                  Utils.log().i('form值 ${val.toList()}');
                },
                submit: Text("保存"),
              ),
              RaisedButton(
                onPressed: () {
                  setState(
                    () {
                      list.add(
                        {
                          "type": "input",
                          "properties": {
                            "placeHolder": "1111",
                            "prefix": Text("55555"),
                            "name": "666"
                          }
                        },
                      );
                    },
                  );
                },
                child: Text("点击增加"),
              ),
              RaisedButton(
                onPressed: () {},
                child: Text("清空表单"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

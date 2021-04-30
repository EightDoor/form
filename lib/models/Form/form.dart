/// 表单model
class FormSelfModel {
  final String type;
  final Map<String, dynamic> properties;
  FormSelfModel(this.type, this.properties);
  FormSelfModel.formJson(Map<String, dynamic> json)
      : type = json["type"],
        properties = json["properties"];

  Map<String, dynamic> toJson() => {
        "type": type,
        "properties": properties,
      };
}

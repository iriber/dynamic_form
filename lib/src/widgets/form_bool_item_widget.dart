import 'package:dynamic_form/src/model/form_bool_item.dart';
import 'package:dynamic_form/src/model/form_text_item.dart';
import 'package:dynamic_form/src/widgets/form_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum FieldLabelPosition { inside, left, top}

class FormBoolItemWidget extends FormItemWidget {

  FormBoolItem formItem;

  FormBoolItemWidget({super.key,
    required this.formItem}){

  }

  @override
  State<FormBoolItemWidget> createState() => _FormBoolItemWidgetState();
}

class _FormBoolItemWidgetState extends State<FormBoolItemWidget> {

  String? error;

  bool value=false;

  @override
  void initState(){
    super.initState();

    value = widget.formItem.initialValue??false;
  }

  @override
  Widget build(BuildContext context) {

    widget.formItem.onError = ((messages){
      setState(() {
        String msg = "";
        messages.forEach((element) {
          msg += " ${element}";
        });

        error = msg;
      });
    });
    widget.formItem.addOnChangeListener ((value){
      setState(() {
        error = "";
      });
    });

    return InkWell(
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Checkbox(
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              value: this.value,
              onChanged: (bool? newValue) {
                setState(() {
                  value = newValue??false ;
                  widget.formItem.setValue(value);
                });

              },
            ),//activeColor: Colors.lightGreenAccent),
            Text(widget.formItem.label, style: widget.formItem.formItemStyle?.labelStyle),
          ],
        ),
      ),
    );
  }

}
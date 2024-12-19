

import 'package:dynamic_form/src/model/form_item.dart';
import 'package:dynamic_form/src/model/form_text_item.dart';
import 'package:dynamic_form/src/widgets/form_text_item_widget.dart';
import 'package:flutter/cupertino.dart';

class FormIntItem extends FormTextItem{

  FormIntItem(
      { super.formItemStyle,required super.label, super.validators, super.initialValue, super.inputType=TextInputType.number});


  int? parseInt() {
    try{
      return int.parse(value);
    }catch(error){
    }
  }
}

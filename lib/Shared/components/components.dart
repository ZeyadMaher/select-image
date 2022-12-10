import 'package:defect_detection/Shared/components/constants.dart';
import 'package:flutter/material.dart';

Widget textForm({
  bool secure = false,
  required Function validationFun,
  required TextEditingController controller,
  String? labelText,
  String? hintText,
  Function? onChange,
  IconButton? prefixIcon,
  IconButton? suffixIcon,
  TextInputType? keyboardType,
}) =>
    TextFormField(
      controller: controller,
      validator: (value) => validationFun(value),
      keyboardType: keyboardType,
      onChanged: (value) => onChange,
      obscureText: secure,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          labelText: labelText,
          hintText: hintText,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon),
    );

Widget searchForm({
  required TextEditingController controller,
  required String labelText,
  Function? onChange,
  IconButton? suffixIcon,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: TextInputType.text,
      onChanged: (value) => onChange,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
          labelText: labelText,
          suffixIcon: suffixIcon),
    );



enum ToastState { success, error, warning }

Color toastColor(ToastState state) {
  Color color;
  switch (state) {
    case (ToastState.success):
      color = Colors.green;
      break;
    case (ToastState.error):
      color = Colors.red;
      break;
    case (ToastState.warning):
      color = Colors.amber;
      break;
  }
  return color;
}

Text DefaultText({
  String text="",
  Color color=Colors.black,
  String  font="ReemKufi",
  double ? font_size

}){

  return Text(
    text,
    style:TextStyle(
    color: color,
    fontFamily: font,
    fontSize: font_size,


  ));
}

Widget DefaultButton({
  context,
  required double height,
  required double width,
  required double radius,
  required Color color,
  required String text,
  required Color font_color,
  required double font_size,
  String ? font=" ",
  required VoidCallback  onPressed,
  





}){
return  Container(
   width: getAPPWidth(context, width),
  height:getAppheight(context, height) ,
child: MaterialButton(
   splashColor: Color(0xff353535),
    //database insert add tawsya logic
    onPressed: onPressed,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius)
                          
        ),
                            
        color: color,
          child:Center(
            child: DefaultText(
                text: text,color:font_color,font:font ?? "" ,font_size: font_size
                  ),
                  )),
             );
}






Widget DefaultTextForm({
  bool secure = false,
  required Function validationFun,
  required TextEditingController controller,
  required String labelText,
  required double fontsize,

  Function? onChange,
  Icon? prefixIcon,
  IconButton? suffixIcon,
  TextInputType? keyboardType,
}) =>
    TextFormField(

      textAlignVertical: TextAlignVertical.bottom,

      controller: controller,
      validator: (value) => validationFun(value),
      keyboardType: keyboardType,
      onChanged: (value) => onChange,
      obscureText: secure,
      decoration: InputDecoration(
        alignLabelWithHint: true,
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color(0x33000000),
              )
          ),

          labelText: labelText,
          labelStyle: TextStyle(
            fontSize:fontsize,
            color: Color(0x66000000),

          ),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon),
    );



Widget DefaultTextFormWithIcons({
  bool secure = false,
  required Function validationFun,
  required TextEditingController controller,
  required String labelText,
  required double fontsize,

  Function? onChange,
  Icon? prefixIcon,
  IconButton? suffixIcon,
  TextInputType? keyboardType,
}) =>
    TextFormField(



      controller: controller,
      validator: (value) => validationFun(value),
      keyboardType: keyboardType,
      onChanged: (value) => onChange,
      obscureText: secure,
      decoration: InputDecoration(

          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color(0x33000000),
              )
          ),

          labelText: labelText,
          labelStyle: TextStyle(
            fontSize:fontsize,
            color: Color(0x66000000),

          ),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon),
    );

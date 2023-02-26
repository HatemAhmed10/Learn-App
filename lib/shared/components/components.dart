import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:eldaheeh/shared/styles/assets_manager.dart';
import 'package:eldaheeh/shared/styles/font_manager.dart';

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

void navigateAndFinish(
  context,
  widget,
) =>
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
      (route) {
        return false;
      },
    );

void showToast({
  required String text,
  required ToastStates state,
}) =>
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: chooseToastColor(state),
      textColor: Colors.white,
      fontSize: 16.0,
    );

// enum
enum ToastStates { SUCCESS, ERROR, WARNING }

Color chooseToastColor(ToastStates state) {
  Color color;

  switch (state) {
    case ToastStates.SUCCESS:
      color = Color.fromARGB(255, 80, 90, 80);
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = Colors.amber;
      break;
  }

  return color;
}

//-----------------------------------------------------------
Widget defaultButton2(
        {required Function function,
        required Widget widget,
        Color? colorButton,
        double? Height,
        Color? colorText,
        Function? onLongPressFunction,
        Color? splashColor,
        double? elevation}) =>
    MaterialButton(
      onPressed: (() {
        function();
      }),
      child: widget,
      color: colorButton,
      height: Height,
      textColor: colorText,
      onLongPress: () {
        onLongPressFunction!();
      },
      splashColor: splashColor,
      // disabledColor: Colors.black,
      // disabledTextColor: Colors.white,
      elevation: elevation,
    );

Widget defaultButton({
  double width = double.infinity,
  Color background = Colors.blue,
  bool isUpperCase = true,
  double radius = 3.0,
  required Function function,
  required String text,
}) =>
    Container(
      width: width,
      height: 40.0,
      child: MaterialButton(
        onPressed: () {
          function();
        },
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          radius,
        ),
        color: background,
      ),
    );

Widget defaultTextButton({
  required Function function,
  required String text,
}) =>
    TextButton(
      onPressed: () {
        function();
      },
      child: Text(
        text.toUpperCase(),
      ),
    );

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  required Function validate,
  required String label,
  required IconData prefix,
  Function? onSubmit,
  Function? onChange,
  Function? onTap,
  bool isPassword = false,
  IconData? suffix,
  Function? suffixPressed,
  bool isClickable = true,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      enabled: isClickable,
      onFieldSubmitted: (s) {
        onSubmit!(s);
      },
      onChanged: (s) {
        onChange!(s);
      },
      onTap: () {
        onTap!();
      },
      validator: (s) {
        validate(s);
        return null;
      },
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: suffix != null
            ? IconButton(
                onPressed: () {
                  suffixPressed!();
                },
                icon: Icon(
                  suffix,
                ),
              )
            : null,
        border: const OutlineInputBorder(),
      ),
    );

Widget myDivider({required Color color, required double height}) => Padding(
      padding: const EdgeInsetsDirectional.only(
        start: 20.0,
      ),
      child: Container(
        width: double.infinity,
        height: height,
        color: color,
      ),
    );

Widget defaultSizedBox({double? Height, double? Width}) => SizedBox(
      height: Height,
      width: Width,
    );

// Make Text View
Widget defaultText({
  // String is show
  required String text,
  // color of this String
  Color? textColor,
  // Font Size of this String
  double? textFontSize,
  // Font Weight is this String
  FontWeight? textFontWeight,
  // the Space between the letter
  double? textletterSpacing,
  // the Space between the word
  double? textwordSpacing,
  // make line up or down the word
  TextDecoration? textDecoration,
  // color of this Decoration
  Color? textDecorationColor,
  // Color of backgroundColor to this text
  Color? textbackgroundColor,
}) =>
    Padding(
      padding: const EdgeInsetsDirectional.only(
        start: 20.0,
      ),
      child: Text(text,
          style: TextStyle(
            color: textColor,
            fontSize: textFontSize,
            fontWeight: textFontWeight,
            letterSpacing: textletterSpacing,
            wordSpacing: textwordSpacing,
            decoration: textDecoration,
            decorationColor: textDecorationColor,
            backgroundColor: textbackgroundColor,
          )),
    );

// to make Container
// 1- to make Box Shadow To make Shadow
BoxShadow defaultBoxShadow({
  // the color of shadow
  required Color colorBoxShadow,
  // the Blur of the Shadow
  required double blurRadiusBoxShadow,
  // Dimensions of Shadow
  required Offset offsetBoxShadow,
  // The space of Shadow
  required double spreadRadiusBoxShadow,
}) =>
    BoxShadow(
      color: colorBoxShadow,
      blurRadius: blurRadiusBoxShadow,
      offset: offsetBoxShadow,
      spreadRadius: spreadRadiusBoxShadow,
    );
// 2-To make Box Decoration
BoxDecoration defaultBoxDecoration({
  // the color of the Box but if not can write this color with color of Container Select one
  Color? colorBoxDecoration,
  // to make border
  Border? borderBoxDecoration,
  // to make Radius Border
  BorderRadius? borderRadiusBoxDecoration,
  // to add image in Background
  DecorationImage? decorationImageBoxDecoration,
  // to make BoxShadow in Up
  required BoxShadow boxShadow,
}) =>
    BoxDecoration(
      color: colorBoxDecoration,
      border: borderBoxDecoration,
      borderRadius: borderRadiusBoxDecoration,
      image: decorationImageBoxDecoration,
      boxShadow: [boxShadow],
    );

// 3- To make Sample Container
Widget defaultContainer({
  // the color of Container and not write with Color of BoxDecoration
  Color? colorContainer,
  // Width of Container
  double? widthContainer,
  // The Height of Container
  double? heightContainer,
  // To make Margin
  EdgeInsets? marginContainer,
  // To make Alignment
  Alignment? alignmentContainer,
  // to make boxDecoration in Up
  BoxDecoration? boxDecoration,
  // and add Widget
  Widget? Widget,
  // TO add Padding To Container
  EdgeInsets? padding,
}) =>
    Container(
      color: colorContainer,
      width: widthContainer, // or 12.3
      height: heightContainer,
      margin: marginContainer,
      alignment: alignmentContainer,
      decoration: boxDecoration,
      padding: padding,
      child: Widget,
    );
//-------------------------------------------------
//____________________________________________________

Widget buildTaskItem(Map model, context) => Dismissible(
      key: Key(model['id'].toString()),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 40.0,
              child: Text(
                '${model['time']}',
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${model['title']}',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${model['date']}',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            IconButton(
              onPressed: () {
                // AppCubit.get(context).updateData(
                //   status: 'done',
                //   id: model['id'],
                // );
              },
              icon: Icon(
                Icons.check_box,
                color: Colors.green,
              ),
            ),
            IconButton(
              onPressed: () {
                // AppCubit.get(context).updateData(
                //   status: 'archive',
                //   id: model['id'],
                // );
              },
              icon: Icon(
                Icons.archive,
                color: Colors.black45,
              ),
            ),
          ],
        ),
      ),
      onDismissed: (direction) {
        // AppCubit.get(context).deleteData(id: model['id'],);
      },
    );

Widget tasksBuilder({
  required List<Map> tasks,
}) =>
    ConditionalBuilder(
      condition: tasks.length > 0,
      builder: (context) => ListView.separated(
        itemBuilder: (context, index) {
          return buildTaskItem(tasks[index], context);
        },
        separatorBuilder: (context, index) => Padding(
          padding: const EdgeInsetsDirectional.only(
            start: 20.0,
          ),
          child: Container(
            width: double.infinity,
            height: 1.0,
            color: Colors.grey[300],
          ),
        ),
        itemCount: tasks.length,
      ),
      fallback: (context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.menu,
              size: 100.0,
              color: Colors.grey,
            ),
            Text(
              'No Tasks Yet, Please Add Some Tasks',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );

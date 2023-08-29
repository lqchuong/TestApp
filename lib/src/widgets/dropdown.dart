import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:acecook/src/themes/light_color.dart';
import 'package:acecook/src/widgets/text_field.dart';

class Dropdownlist extends StatefulWidget {
  final ValueChanged<String>? selectedValue;
  final ValueChanged<String>? onChanged;
  final List<DropdownMenuItem<String>>? items;
  final TextEditingController? textController;
  final String hintText;
  final Icon icon;
  bool enable;
  Dropdownlist(
      {Key? key,
      this.selectedValue,
      this.onChanged,
      this.items,
      required this.hintText,
      this.textController,
      this.icon = const Icon(
        Icons.arrow_drop_down,
        color: Colors.black45,
        size: 30,
      ),
      this.enable = true})
      : super(key: key);

  @override
  State<Dropdownlist> createState() => _DropdownlistState();
}

class _DropdownlistState extends State<Dropdownlist> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      borderRadius: BorderRadius.circular(10),
      color: Colors.white,
      elevation: 5.0,
      shadowColor: LightColor.backgroundColor,
      child: widget.enable == true
          ? DropdownButtonFormField2(
              decoration: InputDecoration(
                //Add isDense true and zero Padding.
                //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
                isDense: true,
                // contentPadding: EdgeInsets.zero,
                contentPadding: EdgeInsets.all(-8),

                filled: true,
                fillColor:
                    widget.enable ? Colors.white : LightColor.disableColor,
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 1, color: LightColor.primaryBackgroundTextField),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 1, color: LightColor.primaryBackgroundTextField),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 1, color: LightColor.primaryBackgroundTextField),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 1, color: LightColor.primaryBackgroundTextField),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 1, color: LightColor.primaryBackgroundTextField),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
              ),
              isExpanded: true,
              hint: widget.textController!.text.isNotEmpty
                  ? Text(
                      widget.textController!.text,
                      style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: LightColor.primaryText.withOpacity(0.6)),
                    )
                  : Text(
                      widget.hintText,
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: LightColor.primaryText.withOpacity(0.6)),
                    ),

              icon: widget.icon,
              // iconSize: 30,
              buttonHeight: 58,
              buttonPadding: const EdgeInsets.only(left: 0, right: 15),
              // dropdownDecoration: BoxDecoration(
              //   borderRadius: BorderRadius.circular(15),
              // ),
              items: widget.items,

              onChanged: (value) {
                print(value.toString());
                widget.onChanged?.call(value.toString());
                widget.textController?.text = value.toString();
                //Do something when changing the item if you want.
              },
              onSaved: (value) {
                widget.selectedValue!(value.toString());
                widget.textController?.text = value.toString();
              },
            )
          : AppTextField(
              enable: widget.enable,
              controller: widget.textController,
            ),
    );
  }
}

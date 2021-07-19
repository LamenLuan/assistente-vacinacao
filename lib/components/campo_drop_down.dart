import 'package:flutter/material.dart';

class CampoDropDown extends StatefulWidget {
  final String hint;
  final String? value;
  final void Function(String? value)? onChanged;
  final List<DropdownMenuItem<String>> list;
  final double marginBottom;

  CampoDropDown({
    Key? key,
    required this.hint,
    this.value,
    this.onChanged,
    required this.list,
    this.marginBottom = 0
  }) : super(key: key);

  @override
  _CampoDropDownState createState() => _CampoDropDownState();
}

class _CampoDropDownState extends State<CampoDropDown> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: widget.marginBottom),
      child: DropdownButtonFormField(
        isExpanded: true,
        hint: Text(widget.hint),
        value: widget.value,
        onChanged: widget.onChanged,
        items: widget.list,
        validator: (value) => value == null ? 'Campo obrigatório' : null,
        style: TextStyle(
          fontSize: 20,
          color: Colors.black87
        ),
      ),
    );
  }
}
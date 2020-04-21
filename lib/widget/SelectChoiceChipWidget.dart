import 'package:flutter/material.dart';

class SelectChoiceChip extends StatefulWidget {
  final String text;
  final EdgeInsetsGeometry padding;
  final double fontSize;
  final Color textColor;
  final Color boxColor;
  final Color textSelectColor;
  final Color boxSelectColor;
  final BorderRadiusGeometry borderRadius;
  final BoxBorder border;
  final BoxBorder selectBorder;
  final ValueChanged<bool> onSelected;
  final bool selected;

  const SelectChoiceChip(
      {@required this.text,
      this.padding =
          const EdgeInsets.only(left: 16, top: 6, right: 16, bottom: 6),
      this.fontSize = 15,
      this.textColor = const Color(0xFFE0E0E0),
      this.boxColor = Colors.white,
      this.borderRadius = const BorderRadius.all(Radius.circular(20)),
      this.border = const Border.fromBorderSide(BorderSide(
          color: const Color(0xFFE0E0E0), width: 1, style: BorderStyle.solid)),
      this.selectBorder = const Border.fromBorderSide(BorderSide(
          color: Colors.lightBlueAccent, width: 1, style: BorderStyle.solid)),
      this.onSelected,
      this.selected,
      this.textSelectColor = Colors.lightBlueAccent,
      this.boxSelectColor = Colors.white});

  @override
  State<StatefulWidget> createState() {
    return _SelectChoiceChipState();
  }
}

class _SelectChoiceChipState extends State<SelectChoiceChip> {
  @override
  Widget build(BuildContext context) {
    bool _select = widget.selected;

    return GestureDetector(
      onTap: () {
        widget.onSelected(!_select);
      },
      child: Container(
          padding: widget.padding,
          child: new Text(
            widget.text,
            style: new TextStyle(
                fontSize: widget.fontSize,
                color: _select ? widget.textSelectColor : widget.textColor),
          ),
          decoration: new BoxDecoration(
              color: _select ? widget.boxSelectColor : widget.boxColor,
              borderRadius: widget.borderRadius,
              border: _select ? widget.selectBorder : widget.border)),
    );
  }
}

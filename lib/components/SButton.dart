import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:smartlink_owner_flutter/utilities/theme_colors.dart';

class SButton extends StatefulWidget {
  final String text;
  const SButton({
    Key? key,
    required this.text,
  }) : super(key: key);


  @override
  State<SButton> createState() => _SButtonState();
}

class _SButtonState extends State<SButton> {
  
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        primary: ThemeColors.primary,
        padding: const EdgeInsets.all(22),
        minimumSize: const Size.fromHeight(50)
      ),
      child: Text(widget.text),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextfield extends StatefulWidget {
  const CustomTextfield({super.key});

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  @override
  Widget build(BuildContext context) {
    var selectedItem;
    List item = ["Food", "Transport", "Education"];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        height: 50,
        width: 318,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border:
          Border.all(color: Color.fromRGBO(221, 221, 221, 1)),
        ),
        child: DropdownButton<String>(
          hint: Text(
            "Name",
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color.fromRGBO(102, 102, 102, 1),
            ),
          ),
          isExpanded:  true,
          value: selectedItem,
          underline: SizedBox(),
          icon: Icon(Icons.arrow_drop_down),
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color.fromRGBO(102, 102, 102, 1),
          ),
          onChanged: (value) {
            setState(() {
              selectedItem = value!;
            });
          },
          items: item
              .map((e) => DropdownMenuItem<String>(
            value: e,
            child: Text(e),
          ))
              .toList(),
        ),
      ),
    );
  }
}

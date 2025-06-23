import 'package:flutter/material.dart';Add commentMore actions
import 'package:google_fonts/google_fonts.dart';

class CustomTextfield extends StatefulWidget {
  final Function(String)? onChanged;
  final String? initialValue;

  const CustomTextfield({super.key, this.onChanged, this.initialValue});

  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  String? selectedItem;
  final List<String> items = ["Food", "Transport", "Education"];

  @override
  void initState() {
    super.initState();
    selectedItem = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        height: 50,
        width: 318,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: const Color.fromRGBO(221, 221, 221, 1)),
        ),
        child: DropdownButton<String>(
          hint: Text(
            "Category",
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: const Color.fromRGBO(102, 102, 102, 1),
            ),
          ),
          isExpanded: true,
          value: selectedItem,
          underline: const SizedBox(),
          icon: const Icon(Icons.arrow_drop_down),
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: const Color.fromRGBO(102, 102, 102, 1),
          ),
          onChanged: (value) {
            setState(() {
              selectedItem = value!;
            });
            if (widget.onChanged != null) {
              widget.onChanged!(value!);
            }
          },
          items: items
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

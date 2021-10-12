import 'dart:ffi';

import 'package:flutter/material.dart';

class FormSelector extends StatefulWidget {
  const FormSelector(this.selctedCategoryFn);

  final Function(String category) selctedCategoryFn;

  @override
  _FormSelectorState createState() => _FormSelectorState();
}

class _FormSelectorState extends State<FormSelector> {
  String dropdownValue = '';

  void selectedCategory(newValue) {
    // print(" 1: " + newValue);
    widget.selctedCategoryFn(
      newValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return FormField(
      builder: (FormFieldState state) {
        return InputDecorator(
          decoration: const InputDecoration(
            icon: Icon(
              Icons.widgets,
              color: Colors.white,
              size: 35.0,
            ),
            labelText: "Select Category",
            labelStyle: TextStyle(
              color: Colors.white,
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
          ),
          isEmpty: dropdownValue == null,
          child: DropdownButtonHideUnderline(
            child: Theme(
              data: Theme.of(context).copyWith(
                canvasColor: Colors.blue.shade200,
              ),
              child: DropdownButton(
                value: dropdownValue,
                isDense: true,
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                    selectedCategory(newValue);
                  });
                },
                style: const TextStyle(
                  color: Colors.white,
                ),
                items: <String>[
                  '',
                  'Electronics',
                  'Vehicles',
                  'Properties',
                  'Education',
                  'Business&Service'
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        );
      },
    );
    // DropdownButton<String>(
    //   value: dropdownValue,
    //   icon: const Icon(Icons.arrow_downward),
    //   iconSize: 24,
    //   elevation: 16,
    //   style: const TextStyle(color: Colors.deepPurple),
    //   underline: Container(
    //     height: 2,
    //     color: Colors.deepPurpleAccent,
    //   ),
    //   onChanged: (String? newValue) {
    //     setState(() {
    //       dropdownValue = newValue!;
    //     });
    //   },
    //   items: <String>['One', 'Two', 'Free', 'Four']
    //       .map<DropdownMenuItem<String>>((String value) {
    //     return DropdownMenuItem<String>(
    //       value: value,
    //       child: Text(value),
    //     );
    //   }).toList(),
    // );
  }
}

//  child: TextFormField(
//     decoration: const InputDecoration(
//       icon: Icon(
//         Icons.widgets,
//         color: Colors.white,
//         size: 35.0,
//       ),
//       hintText: "Select Category",
//       hintStyle: TextStyle(
//         color: Colors.white,
//       ),
//       labelText: "Category",
//       labelStyle: TextStyle(
//         color: Colors.white,
//       ),
//       enabledBorder: UnderlineInputBorder(
//         borderSide:
//             BorderSide(color: Colors.white),
//       ),
//       focusedBorder: UnderlineInputBorder(
//         borderSide:
//             BorderSide(color: Colors.white),
//       ),
//       border: UnderlineInputBorder(
//         borderSide:
//             BorderSide(color: Colors.white),
//       ),
//     ),
//     validator: (value) {
//       if (value!.isEmpty) {
//         return 'Category cannot be empty';
//       }
//       return null;
//     },
//     style: const TextStyle(
//       color: Colors.white,
//     ),
//     onSaved: (value) {
//       _postAdData = Advertisement(
//         id: '',
//         title: _postAdData.title,
//         desccription: _postAdData.desccription,
//         price: _postAdData.price,
//         category: value.toString(),
//         location: _postAdData.location,
//       );
//     },
//   ),
// ),
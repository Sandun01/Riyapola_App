import 'package:flutter/material.dart';

class CategoryButton extends StatelessWidget {
  final String category;
  final IconData iconData;

  const CategoryButton(this.category, this.iconData);

  void _onclickFunction() {
    print(this.category);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 20.0,
        right: 20.0,
      ),
      margin: const EdgeInsets.only(
        top: 10.0,
        bottom: 10.0,
      ),
      height: 60.0,
      width: double.infinity,
      child: ElevatedButton.icon(
        icon: Icon(
          iconData,
          size: 30.0,
        ),
        label: Text(category),
        style: ButtonStyle(
          backgroundColor: MaterialStateColor.resolveWith(
              (states) => Theme.of(context).colorScheme.primary),
          textStyle: MaterialStateProperty.resolveWith(
            (states) => const TextStyle(
              fontSize: 20.0,
            ),
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
          ),
        ),
        onPressed: _onclickFunction,
      ),
    );
  }
}

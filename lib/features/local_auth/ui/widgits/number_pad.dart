import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NumberPad extends StatelessWidget {
  final Function(String) onNumberTapped;

  const NumberPad({Key? key, required this.onNumberTapped}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 12,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 1.5,
      ),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        if (index == 9) {
          return SizedBox(); // Empty space for grid alignment
        } else if (index == 10) {
          return NumberButton(label: "Del", onTap: () => onNumberTapped("Del"));
        } else if (index == 11) {
          return NumberButton(label: "0", onTap: () => onNumberTapped("0"));
        } else {
          return NumberButton(label: "${index + 1}", onTap: () => onNumberTapped("${index + 1}"));
        }
      },
    );
  }
}

// Individual Number Button Widget
class NumberButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const NumberButton({Key? key, required this.label, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.all(8.0),
        child: Center(
          child: Text(
            label,
            style: TextStyle(fontSize: 30, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
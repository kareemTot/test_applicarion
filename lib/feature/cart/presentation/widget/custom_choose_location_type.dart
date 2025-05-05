import 'package:flutter/material.dart';

class CustomChooseLocationType extends StatefulWidget {
  const CustomChooseLocationType({super.key});

  @override
  State<CustomChooseLocationType> createState() =>
      _CustomChooseLocationTypeState();
}

class _CustomChooseLocationTypeState extends State<CustomChooseLocationType> {
  final types = ['Home', 'Work', 'Other'];
  String _addressType = 'Home';
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: types.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final type = types[index];
          return ChoiceChip(
            label: Text(type[index]),
            selected: _addressType == type,
            onSelected: (selected) {
              setState(() {
                _addressType = type;
              });
            },
          );
        },
      ),
    );
  }
}

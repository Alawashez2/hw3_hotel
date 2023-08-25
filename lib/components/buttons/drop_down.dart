import 'package:flutter/material.dart';

class DropdownDemo extends StatefulWidget {
  const DropdownDemo({Key? key}) : super(key: key);
  @override
  State<DropdownDemo> createState() => _DropdownDemoState();
}
class _DropdownDemoState extends State<DropdownDemo> {
  String dropdownValue = 'name A-Z';
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      items: <String>['name A-Z', 'name Z-A', 'price highest', 'price lowest']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: const TextStyle(fontSize: 18),
          ),
        );
      }).toList(),
      onChanged: (String? newValue) {
        
          dropdownValue = newValue!;
          if(dropdownValue =="name A-Z"){

          }else if(dropdownValue =="name Z-A"){

          }else if(dropdownValue =="price highest"){

          }else{

          }
    
      },
    );
  }
}
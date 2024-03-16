import 'package:flight_booking/view/colors.dart';
import 'package:flutter/material.dart';

class DropMenu extends StatefulWidget {
  const DropMenu({
    Key? key,
    required this.helperText,
    this.width = 165,
    required this.label,
    required this.iconData,
    // this.onTap,
  }) : super(key: key);
  final IconData iconData;
  final String helperText;
  final String label;

  final double? width;

  @override
  State<DropMenu> createState() => _DropMenuState();
}

class _DropMenuState extends State<DropMenu> {
  String _selectedValue = 'DXB Dubai';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: TextStyle(
            color: Colors.white.withOpacity(0.9),
            fontSize: 13,
            fontStyle: FontStyle.italic,
          ),
        ),
        Container(
          height: 43,
          width: widget.width,
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: _selectedValue,
              icon: const Icon(Icons.keyboard_arrow_down_sharp,
                  color: Colors.white),
              iconSize: 24,
              elevation: 16,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedValue = newValue!;
                });
              },
              dropdownColor: AppColor.blue,
              items: <String>[
                'DXB Dubai',
                'JFK New York',
                'Option 3',
                'Option 4'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}

class DropMenu2 extends StatefulWidget {
  const DropMenu2({
    Key? key,
    this.width = 165,
    required this.label,
    required this.iconData,
    required this.items,
    this.color = Colors.white,
    // this.onTap,
  }) : super(key: key);
  final IconData iconData;
  final String label;
  final List<String> items;
  final double? width;
  final Color? color;

  @override
  State<DropMenu2> createState() => _DropMenu2State();
}

class _DropMenu2State extends State<DropMenu2> {
  String _selectedValue = 'Round Trip';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: TextStyle(
            color: widget.color,
            fontSize: 13,
            fontStyle: FontStyle.italic,
          ),
        ),
        Container(
          height: 43,
          width: widget.width,
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            border: Border.all(color: widget.color!),
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: _selectedValue,
              icon: Icon(Icons.keyboard_arrow_down_sharp, color: widget.color),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(
                color: widget.color,
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedValue = newValue!;
                });
              },
              dropdownColor: AppColor.blue,
              items: widget.items.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}

class DropMenu3 extends StatefulWidget {
  const DropMenu3({
    Key? key,
    this.width = 165,
    required this.label,
    required this.iconData,

    // this.onTap,
  }) : super(key: key);
  final IconData iconData;
  final String label;
  final double? width;

  @override
  State<DropMenu3> createState() => _DropMenu3State();
}

class _DropMenu3State extends State<DropMenu3> {
  String _selectedValue = '1 Adult';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 13,
            fontStyle: FontStyle.italic,
          ),
        ),
        Container(
          height: 43,
          width: double.infinity,
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[500]!, width: 0.9),
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Row(
            children: [
              const Icon(
                Icons.person,
                color: Colors.grey, // Set the color for the person icon
              ),
              Expanded(
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _selectedValue,
                    icon: const Icon(
                      Icons.keyboard_arrow_down_sharp,
                      color: Colors.grey,
                    ),
                    iconSize: 24,
                    elevation: 16,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedValue = newValue!;
                      });
                    },
                    dropdownColor: AppColor.blue,
                    items: ["1 Adult", "2 Adults"]
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class DatePicker extends StatelessWidget {
  const DatePicker({
    Key? key,
    required this.helperText,
    this.width = 165,
    required this.label,
    this.suffixIcon,
    required this.iconData,
    required this.onTap,
    // this.onTap,
  }) : super(key: key);
  final IconData iconData;
  final String helperText;
  final String label;
  final Icon? suffixIcon;
  final double? width;
  final VoidCallback onTap;
  // final Function? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.grey[500],
            fontSize: 13,
            fontStyle: FontStyle.italic,
          ),
        ),
        SizedBox(
          width: width,
          height: 42,
          child: TextFormField(
            onTap: () {
              onTap();
            },
            readOnly: true,
            cursorColor: AppColor.blue,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              fillColor: Colors.transparent,
              helperStyle: TextStyle(color: Colors.grey[500]),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: Colors.grey[500]!,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: Colors.grey[500]!,
                ),
              ),
              filled: true,
              isDense: true,
              prefixIcon: IconButton(
                onPressed: () {},
                icon: Icon(
                  iconData,
                  color: Colors.grey[400],
                  size: 22,
                ),
              ),
              suffixIcon: suffixIcon,
              hintText: helperText,
              hintStyle: TextStyle(
                color: Colors.grey[500],
                fontWeight: FontWeight.w400,
                overflow: TextOverflow.ellipsis,
                fontSize: 13,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class UserSearchTextField extends StatelessWidget {
  const UserSearchTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Введите имя',
        prefixIcon: Icon(Icons.search),
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFFEFF1F5),
          ),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFFEFF1F5),
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFFEFF1F5),
          ),
        ),
      ),
      // controller: _searchController,
    );
  }
}

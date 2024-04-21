import 'package:flutter/material.dart';

class SearchListTile extends StatelessWidget {
  const SearchListTile({super.key, required this.title, this.onTap});
  final String title;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
      title: Text(title),
    );
  }
}

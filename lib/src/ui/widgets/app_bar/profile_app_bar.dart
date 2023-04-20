import 'package:flutter/material.dart';

class ProfileAppBar extends StatefulWidget implements PreferredSizeWidget {
  ProfileAppBar({
    super.key,
    this.title,
    this.height = 60,
  }) : preferredSize = Size.fromHeight(height);

  @override
  final Size preferredSize;
  final String? title;
  final double height;

  @override
  State<ProfileAppBar> createState() => _ProfileAppBarState();
}

class _ProfileAppBarState extends State<ProfileAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(widget.title ?? ''),
    );
  }
}

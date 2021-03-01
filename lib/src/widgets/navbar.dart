import 'package:flutter/material.dart';
import 'package:hitchhike/src/constants/colors.dart';

class Navbar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final bool searchBar;
  final bool backButton;
  final bool transparent;
  final bool rightOptions;
  final List<String> tags;
  final Function getCurrentPage;
  final TextEditingController searchController;
  final Function searchOnChanged;
  final bool isOnSearch;
  final bool noShadow;
  final Color bgColor;
  final bool searchAutofocus;

  final double _prefferedHeight = 180.0;

  Navbar(
      {this.title = "Home",
      this.tags,
      this.transparent = false,
      this.rightOptions = true,
      this.getCurrentPage,
      this.searchController,
      this.isOnSearch = false,
      this.searchOnChanged,
      this.searchAutofocus = false,
      this.backButton = false,
      this.noShadow = false,
      this.bgColor = Colors.white,
      this.searchBar = false});

  @override
  _NavbarState createState() => _NavbarState();

  @override
  Size get preferredSize => Size.fromHeight(_prefferedHeight);
}

class _NavbarState extends State<Navbar> {
  String activeTag;

  void initState() {
    if (widget.tags != null && widget.tags.length != 0) {
      activeTag = widget.tags[0];
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bool tagsExist =
        widget.tags == null ? false : (widget.tags.length == 0 ? false : true);

    return Container(
      height: widget.searchBar
          ? (tagsExist ? 262.0 : 210.0)
          : ((tagsExist ? 200.0 : 150.0)),
      decoration: BoxDecoration(
        color: !widget.transparent ? widget.bgColor : Colors.transparent,
        boxShadow: [
          BoxShadow(
            color: !widget.transparent && !widget.noShadow
                ? AppColors.initial
                : Colors.transparent,
            spreadRadius: -10,
            blurRadius: 12,
            offset: Offset(0, 5),
          )
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          !widget.backButton
                              ? Icons.menu
                              : Icons.arrow_back_ios,
                          color: !widget.transparent
                              ? (widget.bgColor == Colors.white
                                  ? AppColors.initial
                                  : Colors.white)
                              : Colors.white,
                          size: 24.0,
                        ),
                        onPressed: () {
                          if (!widget.backButton)
                            Scaffold.of(context).openDrawer();
                          else
                            Navigator.pop(context);
                        },
                      ),
                      Text(widget.title,
                          style: TextStyle(
                              color: !widget.transparent
                                  ? (widget.bgColor == Colors.white
                                      ? AppColors.initial
                                      : Colors.white)
                                  : Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 18.0)),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

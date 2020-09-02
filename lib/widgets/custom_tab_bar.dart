import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  final List<IconData> icons;
  final int selectedIndex;
  final Function(int) onTap;

  const CustomTabBar({
    Key key,
    @required this.icons,
    @required this.selectedIndex,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorPadding: EdgeInsets.zero,
      indicatorSize: TabBarIndicatorSize.label,
      indicator: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey[600], width: 3.0,),
        ),
      ),
      tabs: icons
          .asMap()
          .map(
            (i, e) => MapEntry(
          i,
          Tab(
            icon: Icon(
              e,
              color:Colors.grey[400],
              size: 30.0,
            ),
          ),
        ),
      )
          .values
          .toList(),
      onTap: onTap,
    );
  }
}

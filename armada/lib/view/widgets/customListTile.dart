import 'package:armada/provider/drower_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomListTile extends StatefulWidget {
  final String title;
  final IconData icon;
  final int isSelected;
  final int ind;

  CustomListTile({
    super.key,
    required this.title,
    required this.icon,
    required this.ind,
    required this.isSelected,
  });

  @override
  State<CustomListTile> createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  @override
  Widget build(BuildContext context) {
    return Consumer<DrawerNotifire>(
      builder: (context, value, child) => InkWell(
        onTap: () {
          switch (widget.ind) {
            case 0:
              value.setCurrentDrawer(0);
              Navigator.pushNamed(context, '/Profile');
              break;
            case 1:
              value.setCurrentDrawer(1);
              Navigator.pushNamed(context, '/Farm');
              break;
            case 2:
              value.setCurrentDrawer(2);
              Navigator.pushNamed(context, '/login');
              break;
          }
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 12.0, right: 12, top: 0),
          child: Container(
            padding: EdgeInsets.all(15),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      style: BorderStyle.solid,
                      width: 1,
                      color: Theme.of(context).primaryColor)),
              color: (value.getCurrentDrawer == widget.isSelected)
                  ? Theme.of(context).primaryColor
                  : Colors.transparent,
            ),
            child: Row(
              children: [
                Icon(widget.icon,
                    color: value.getCurrentDrawer == widget.isSelected
                        ? Colors.white
                        : Theme.of(context).primaryColor),
                SizedBox(width: 5),
                Text(
                  widget.title,
                  style: TextStyle(
                    color: (value.getCurrentDrawer == widget.isSelected)
                        ? Colors.white
                        : Theme.of(context).primaryColor,
                    fontSize: 20,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/tab_desktop/menu.dart';
import '../../utils/app_colors.dart';
import '../../utils/ui_helper.dart';
import 'home_view.dart';


class MenuView extends StatelessWidget {
  const MenuView({Key? key, this.expandFlex = 2, this.isTab = false})
      : super(key: key);

  final int expandFlex;
  final bool isTab;

  @override
  Widget build(BuildContext context) {
    final menus = Menu.getMenus();

    return Expanded(
      flex: expandFlex,
      child: Container(
        color: Colors.white,
        alignment: Alignment.center,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 70,
                decoration: BoxDecoration(
                color: cuistoOrange,borderRadius: const BorderRadius.all(Radius.circular(20))
                ),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child:  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipOval(
                        child: Image.asset(
                          'assets/image/user.jpg',
                          height: 50.0,
                          width: 50.0,
                          fit: BoxFit.fill,
                        ),
                      ),

                      SizedBox(width: 20,),
                      Text(
                        'Cuisto App',
                        style: Theme.of(context)
                            .textTheme
                            .headline4!
                            .copyWith(fontSize: 16.0,color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ListView(
              shrinkWrap: true,
              children: List.generate(
                menus.length,
                (index) => _MenuItem(
                  menu: menus[index],
                  isTab: isTab,
                  onTap: menus[index].onTap,
                ),
              ),
            ),
            const Spacer(),
             /* isTab ? IconButton(
                    icon: const Icon(Icons.exit_to_app),
                    iconSize: 20.0,
                    onPressed: () {},
                  ) : Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: FractionallySizedBox(
                      widthFactor: 0.5,
                      child: SizedBox(
                        height: 52.0,
                        child: OutlinedButton.icon(
                          icon: const Icon(Icons.exit_to_app),
                          label: const Text('Déconnexion'),
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            textStyle: const TextStyle(fontSize: 15),
                            onPrimary: cuistoOrange,
                            side: BorderSide(width: 2.0, color: cuistoOrange!),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )*/
          ],
        ),
      ),
    );
  }
}

class _MenuItem extends StatefulWidget {
  const _MenuItem({Key? key, required this.menu, this.isTab = false, this.onTap = ''})
      : super(key: key);

  final Menu menu;
  final bool isTab;
  final String onTap;

  @override
  __MenuItemState createState() => __MenuItemState();
}

class __MenuItemState extends State<_MenuItem> {
  bool isHovered = false;
  bool get isTab => widget.isTab;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin:
          isTab ? EdgeInsets.zero : const EdgeInsets.symmetric(vertical: 5.0),
      padding:
          EdgeInsets.symmetric(vertical: 2.0, horizontal: isTab ? 0.0 : 10.0),
      child: InkWell(
        onTap: () {
          print(widget.menu.title);
        },
        onHover: (value) {
          if (!isTab) {
            setState(() {
              isHovered = value;
            });
          }
        },
        child: Container(
          decoration: isHovered
              ? BoxDecoration(
                  color: Colors.deepOrange[100],
                  borderRadius: BorderRadius.circular(30.0),
                )
              : null,
          padding: isTab
              ? const EdgeInsets.symmetric(vertical: 10.0)
              : const EdgeInsets.only(
                  left: 15.0, top: 10.0, right: 25.0, bottom: 10.0),
          child: isTab
              ? IconButton(
                  icon: Icon(widget.menu.icon,
                      color: isHovered ? cuistoOrange : Colors.black),
                  iconSize: 30.0,
                  onPressed: () {},
                )
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(widget.menu.icon,
                        color: isHovered ? cuistoOrange : Colors.black,
                        size: 25.0),
                    UIHelper.horizontalSpaceMedium(),
                    Text(
                      widget.menu.title,
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                            color: isHovered ? cuistoOrange : Colors.black,fontSize: 16
                          ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

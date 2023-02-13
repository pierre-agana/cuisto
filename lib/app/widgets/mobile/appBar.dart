import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';
import '../../utils/ui_helper.dart';
import 'drawer/custom_drawer.dart';


class AppBarview extends StatefulWidget {
  final String text;
  const AppBarview({Key? key , required this.text}) : super(key: key);

  @override
  State<AppBarview> createState() => _AppBarviewState();
}

class _AppBarviewState extends State<AppBarview> {

  final List<String> items = [
    'Table 1',
    'Table 2',
    'Table 3',
    'Table 4',
    'Table 5',
    'Table 6',
    'Table 7',
    'Table 8',
  ];
  String? selectedValue;
  final TextEditingController textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
          color: cuistoOrange,
          border: Border.all(
            color: Colors.deepOrange,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(20))
      ),
      margin: const EdgeInsets.symmetric(horizontal: 2.0),
      padding: const EdgeInsets.all(8),
      height: 80.0,
      child: Row(
        children: <Widget>[
          const CircleAvatar(
            radius: 27,
            child: CircleAvatar(
              radius: 25,
              foregroundImage: AssetImage('assets/icons/logo-red.png',),
            ),
          ),
          UIHelper.horizontalSpaceExtraSmall(),
          Text(
            widget.text,
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(fontSize: 16.0,color: Colors.white),
          ),

          const Spacer(),
          Container(
            padding: const EdgeInsets.all(5.0),
            child: TextButton.icon(
                icon:Icon(Icons.add_alert,color: cuistoOrange, size: 17,),
                onPressed: (){
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(7.0))),
                          contentPadding: const EdgeInsets.only(top: 10.0),
                          content: Container(
                            width: 300.0,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget> [
                                const Center(
                                  child: Text(
                                    "Appeler un serveur",
                                    style: TextStyle(fontSize: 24.0 ,),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5.0,
                                ),
                                const Divider(
                                  color: Colors.grey,
                                  height: 4.0,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: DropdownButton2(
                                    isExpanded: true,
                                    hint: Text(
                                      'Selectionner votre table',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Theme.of(context).hintColor,
                                      ),
                                    ),
                                    items: items
                                        .map((item) => DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(
                                        item,
                                        style: const TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ))
                                        .toList(),
                                    value: selectedValue,
                                    onChanged: (value) {
                                      setState(() {
                                        selectedValue = value as String;
                                      });
                                    },
                                    buttonHeight: 40,
                                    buttonWidth: 200,
                                    itemHeight: 40,
                                    dropdownMaxHeight: 200,
                                    searchController: textEditingController,
                                    searchInnerWidget: Padding(
                                      padding: const EdgeInsets.only(
                                        top: 8,
                                        bottom: 4,
                                        right: 8,
                                        left: 8,
                                      ),
                                      child: TextFormField(
                                        controller: textEditingController,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          contentPadding: const EdgeInsets.symmetric(
                                            horizontal: 40,
                                            vertical: 8,
                                          ),
                                          hintText: 'Recherche...',
                                          hintStyle: const TextStyle(fontSize: 15),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                        ),
                                      ),
                                    ),
                                    searchMatchFn: (item, searchValue) {
                                      return (item.value.toString().contains(searchValue));
                                    },
                                    onMenuStateChange: (isOpen) {
                                      if (!isOpen) {
                                        textEditingController.clear();
                                      }
                                    },
                                  ),


                                ),
                                InkWell(
                                  onTap: (){
                                    print(selectedValue);
                                    Navigator.of(context).pop();
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.only(
                                        top: 20.0, bottom: 20.0),
                                    decoration: BoxDecoration(
                                      color: cuistoOrange,
                                      borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(7.0),
                                          bottomRight: Radius.circular(
                                              7.0)),
                                    ),
                                    child: const Text(
                                      "Appeler",
                                      style: TextStyle(color: Colors.white),
                                      textAlign: TextAlign.center,
                                    ),

                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                  );
                },
                label: Text('Appeler un serveur',style: TextStyle (
                    color: cuistoOrange,
                    fontSize: 12,
                    fontWeight: FontWeight.w200
                )),
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                )
            ),
          ),
        ],
      ),
    );
  }
}


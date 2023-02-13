import 'package:flutter/material.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/ui_helper.dart';
import '../../../widgets/responsive.dart';

class SwiggySafetyBannerView extends StatelessWidget {
  const SwiggySafetyBannerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isTabletDesktop = Responsive.isTabletDesktop(context);
    final cardWidth =
        MediaQuery.of(context).size.width / (isTabletDesktop ? 3.8 : 1.2);

    return Container(
      margin: const EdgeInsets.all(15.0),
      child: Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.arrow_downward,
                color: cuistoOrange,
              ),
              UIHelper.horizontalSpaceExtraSmall(),
              Flexible(
                child: Text(
                  "Cuisto les mesures sanitaire et sécurité pour garantir la une bonne alimentation ",
                  style: Theme.of(context).textTheme.subtitle2!.copyWith(
                        color: cuistoOrange,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w700,
                      ),
                ),
              ),
              UIHelper.horizontalSpaceExtraSmall(),
              Icon(
                Icons.arrow_downward,
                color: cuistoOrange,
              ),
            ],
          ),
          UIHelper.verticalSpaceMedium(),
          LimitedBox(
            maxHeight: 220.0,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (context, index) => Container(
                margin: const EdgeInsets.only(right: 10.0),
                //padding: const EdgeInsets.all(10.0),
                width: cardWidth,
                decoration: BoxDecoration(
                  color: Colors.orange[100],
                  border: Border.all(color: cuistoOrange!, width: 2.0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Image.network("https://thumbs.dreamstime.com/z/affiche-r%C3%A9aliste-de-publicit%C3%A9-d-aliments-pour-b%C3%A9b%C3%A9-l-publicitaire-la-premi%C3%A8re-alimentation-avec-des-tranches-cuvette-pot-212649687.jpg",
                fit: BoxFit.fill,),
              ),
            ),
          )
        ],
      ),
    );
  }
}

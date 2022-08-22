import 'package:flutter/cupertino.dart';
import 'package:vezeeta_clone/presentation/view/managers/textStyleManager.dart';

import '../../reuseable_widgets/userAppointmentCard.dart';

class ActivitiesPage extends StatelessWidget {
  const ActivitiesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(

        children: [
          Text("My Activity",style: TextStyling.titleStyleText,),

          UserAppointmentCardWidget()
        ],
      ),
    );
  }
}

import 'package:flutter_course/modules/api_call_in_widget/case1/widget_api_call_screen.dart';
import 'package:flutter_course/modules/api_call_in_widget/case2/widget_api_call_case2_screen.dart';
import 'package:flutter_course/modules/home/home_screen.dart';

import '../modules/api_call_in_controller/case3/widget_api_call_case3_screen.dart';
import '../modules/api_call_in_controller/case4/widget_api_call_case4_screen.dart';
import '../modules/api_call_in_controller/case5/widget_api_call_case5_screen.dart';
import '../modules/api_call_in_repo/case6/widget_api_call_case6_screen.dart';
import 'app_screens.dart';

/// @Created by akash on 15-09-2025.
/// Know more about author at https://akash.cloudemy.in

final appRoutes = {
  AppScreens.home: (context) => HomeScreen(),
  AppScreens.widgetAPICall: (context) {
    return WidgetApiCallScreen();
  },
  AppScreens.widgetAPICallCase2: (context) {
    return WidgetApiCallCase2Screen();
  },
  AppScreens.widgetAPICallCase3: (context) {
    return WidgetApiCallCase3Screen();
  },
  AppScreens.widgetAPICallCase4: (context) {
    return WidgetApiCallCase4Screen();
  },
  AppScreens.widgetAPICallCase5: (context) {
    return WidgetApiCallCase5Screen();
  },
 AppScreens.widgetAPICallCase6: (context) {
    return WidgetApiCallCase6Screen();
  },
};

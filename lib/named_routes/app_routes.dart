
import 'app_screens.dart';
import 'named_home_screen.dart';
import 'named_second_screen.dart';

final appRoutes = {
  AppScreens.home: (context) => NamedHomeScreen(),
  AppScreens.secondScreen: (context) => NamedSecondScreen(),
};
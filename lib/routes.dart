
import 'package:flareline_crm/pages/auth/sign_in/sign_in_page.dart';
import 'package:flareline_crm/pages/auth/sign_up/sign_up_page.dart';
import 'package:flareline_crm/pages/contacts/contacts_page.dart';
import 'package:flareline_crm/pages/home/crm_home_page.dart';
import 'package:flutter/material.dart';

typedef PathWidgetBuilder = Widget Function(BuildContext, String?);

final List<Map<String, Object>> MAIN_PAGES = [
  {'routerPath': '/', 'widget': CrmHomePage()},
  {'routerPath': '/signIn', 'widget': SignInPage()},
  {'routerPath': '/signUp', 'widget': SignUpPage()},
  {'routerPath': '/contacts', 'widget': ContactsPage()},
];

class RouteConfiguration {
  static final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>(debugLabel: 'Rex');

  static BuildContext? get navigatorContext =>
      navigatorKey.currentState?.context;

  static Route<dynamic>? onGenerateRoute(
    RouteSettings settings,
  ) {
    String path = settings.name!;

    dynamic map =
        MAIN_PAGES.firstWhere((element) => element['routerPath'] == path);

    if (map == null) {
      return null;
    }
    Widget targetPage = map['widget'];

    builder(context, match) {
      return targetPage;
    }

    return NoAnimationMaterialPageRoute<void>(
      builder: (context) => builder(context, null),
      settings: settings,
    );
  }
}

class NoAnimationMaterialPageRoute<T> extends MaterialPageRoute<T> {
  NoAnimationMaterialPageRoute({
    required super.builder,
    super.settings,
  });

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return child;
  }
}

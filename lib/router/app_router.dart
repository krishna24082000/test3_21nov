import 'package:auto_route/auto_route.dart';
import 'package:test3_21nov/router/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: DashBoardRoute.page, initial: true, path: '/'),
        AutoRoute(
          page: AddProductRoute.page,
        ),
      ];
}

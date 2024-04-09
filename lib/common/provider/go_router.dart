import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:login_authentication/user/provider/auth_provider.dart';

final routerProvider = Provider<GoRouter>((ref) {

  // watch - 값이 변경될때마다 다시
  // read - 한번만 읽고 값이 변경돼도 다시 빌드하지 않음
  final provider = ref.read(authProvider);

  return GoRouter(
    routes: provider.routes,
    initialLocation: '/splash',
    refreshListenable: provider,
    redirect: (_, state) {
      return provider.redirectLogic(state);
    },
  );
});

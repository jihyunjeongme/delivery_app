import 'package:dio/dio.dart' hide Headers;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_authentication/common/const/data.dart';
import 'package:login_authentication/common/dio/dio.dart';
import 'package:login_authentication/user/model/basket_item_model.dart';
import 'package:login_authentication/user/model/patch_basket_body.dart';
import 'package:login_authentication/user/model/user_model.dart';
import 'package:retrofit/http.dart';

part 'user_me_repository.g.dart';

final userMeRepositoryProvider = Provider<UserMeRepository>((ref) {
  final dio = ref.watch(dioProvider);

  return UserMeRepository(dio, baseUrl: 'http://$ip/user/me');
});

// http://$ip/user/me
@RestApi()
abstract class UserMeRepository {
  factory UserMeRepository(Dio dio, {String baseUrl}) = _UserMeRepository;

  @GET('/')
  @Headers({
    'accessToken': 'true',
  })
  Future<UserModel> getMe();

  @GET('/basket')
  @Headers({
    'accessToken': 'ture',
  })
  Future<List<BasketItemModel>> getBasket();

  @PATCH('/basket')
  @Headers({
    'accessToken': 'ture',
  })
  Future<List<BasketItemModel>> patchBasket({
    @Body() required PatchBasketBody body,
  });
}

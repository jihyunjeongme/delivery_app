import 'package:dio/dio.dart' hide Headers;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_authentication/common/const/data.dart';
import 'package:login_authentication/common/dio/dio.dart';
import 'package:login_authentication/common/model/cursor_pagination_model.dart';
import 'package:login_authentication/common/model/pagination_params.dart';
import 'package:login_authentication/common/repository/base_pagination_repository.dart';
import 'package:login_authentication/product/model/product_model.dart';
import 'package:retrofit/retrofit.dart';

part 'product_repository.g.dart';

final productRepositoryProvider = Provider <
    ProductRepository>(
      (ref) {
        final dio = ref.watch(dioProvider);

        return ProductRepository(dio, baseUrl: 'http://$ip/product');
      },
    );

// http://$ip/product
@RestApi()
abstract class ProductRepository<T> implements IBasePaginationRepository<ProductModel> {
  factory ProductRepository(Dio dio, {String baseUrl}) = _ProductRepository;

  @GET('/')
  @Headers({'accessToken': 'true'})
  Future<CursorPagination<ProductModel>> paginate({
    @Queries() PaginationParams? paginationParams = const PaginationParams(),
  });
}

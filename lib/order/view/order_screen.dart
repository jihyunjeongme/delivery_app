import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_authentication/common/component/pagination_list_view.dart';
import 'package:login_authentication/order/component/order_card.dart';
import 'package:login_authentication/order/model/order_model.dart';
import 'package:login_authentication/order/provider/order_provider.dart';

class OrderScreen extends ConsumerWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PaginationListView<OrderModel>(
      provider: orderProvider,
      itemBuilder: <OrderModel> (_, index, model) {
        return OrderCard.fromModel(model: model);
        
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:login_authentication/common/component/pagination_list_view.dart';
import 'package:login_authentication/restaurant/component/restaurant_card.dart';
import 'package:login_authentication/restaurant/provider/restaurant_provider.dart';
import 'package:login_authentication/restaurant/view/restaurant_detail_screen.dart';

class RestaurantScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PaginationListView(
      provider: restaurantProvider,
      itemBuilder: <RestaurantModel>(_, index, model) {
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => RestaurantDetailScreen(
                  id: model.id,
                ),
              ),
            );
          },
          child: RestaurantCard.fromModel(
            model: model,
          ),
        );
      },
    );
  }
}

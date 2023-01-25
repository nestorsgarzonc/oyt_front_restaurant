import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oyt_front_core/external/api_handler.dart';
import 'package:oyt_front_core/logger/logger.dart';
import 'package:oyt_front_restaurant/models/restaurant_creation_model.dart';
import 'package:oyt_front_restaurant/models/restaurant_model.dart';

final restaurantDataSourceProvider = Provider<RestaurantDataSource>((ref) {
  return RestaurantDataSourceImpl.fromRead(ref);
});

abstract class RestaurantDataSource {
  Future<RestaurantModel> getMenuByRestaurant();
  Future<RestaurantModel> getMenuByTable(String tableId);
  Future<void> createRestaurant(RestaurantCreationModel restaurant);
  Future<void> updateRestaurant(RestaurantCreationModel restaurant);
}

class RestaurantDataSourceImpl implements RestaurantDataSource {
  RestaurantDataSourceImpl(this.apiHandler);

  factory RestaurantDataSourceImpl.fromRead(Ref ref) {
    return RestaurantDataSourceImpl(ref.read(apiHandlerProvider));
  }

  final ApiHandler apiHandler;

  @override
  Future<RestaurantModel> getMenuByRestaurant() async {
    try {
      final res = await apiHandler.get('/menu/get-menu');
      return RestaurantModel.fromMap(res.responseMap!);
    } catch (e, s) {
      Logger.logError(e.toString(), s);
      rethrow;
    }
  }

  @override
  Future<RestaurantModel> getMenuByTable(String tableId) async {
    try {
      final res = await apiHandler.get('/menu/$tableId');
      return RestaurantModel.fromMap(res.responseMap!);
    } catch (e, s) {
      Logger.logError(e.toString(), s);
      rethrow;
    }
  }

  @override
  Future<void> createRestaurant(RestaurantCreationModel restaurant) async {
    try {
      await apiHandler.post('/restaurant', restaurant.toMap());
    } catch (e, s) {
      Logger.logError(e.toString(), s);
      rethrow;
    }
  }

  @override
  Future<void> updateRestaurant(RestaurantCreationModel restaurant) async {
    try {
      await apiHandler.put('/restaurant', restaurant.toMap());
    } catch (e, s) {
      Logger.logError(e.toString(), s);
      rethrow;
    }
  }
}

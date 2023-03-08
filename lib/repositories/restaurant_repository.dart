import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oyt_front_core/failure/failure.dart';
import 'package:oyt_front_restaurant/data_sources/restaurant_data_source.dart';
import 'package:oyt_front_restaurant/models/restaurant_creation_model.dart';
import 'package:oyt_front_restaurant/models/restaurant_model.dart';

final restaurantRepositoryProvider = Provider<RestaurantRepository>((ref) {
  return RestaurantRepositoryImpl.fromRead(ref);
});

abstract class RestaurantRepository {
  Future<Either<Failure, RestaurantModel>> getMenuByRestaurant();
  Future<Either<Failure, RestaurantModel>> getMenuByTable(String tableId);
  Future<Failure?> createRestaurant(RestaurantCreationModel restaurant);
  Future<Failure?> updateRestaurant(RestaurantCreationModel restaurant);
  Future<Failure?> updateRestaurantImage(Uint8List image);
  Future<Failure?> updateRestaurantLogo(Uint8List logo);
}

class RestaurantRepositoryImpl implements RestaurantRepository {
  RestaurantRepositoryImpl({required this.dataSource});

  factory RestaurantRepositoryImpl.fromRead(Ref ref) {
    return RestaurantRepositoryImpl(dataSource: ref.read(restaurantDataSourceProvider));
  }

  final RestaurantDataSource dataSource;

  @override
  Future<Either<Failure, RestaurantModel>> getMenuByRestaurant() async {
    try {
      final restaurant = await dataSource.getMenuByRestaurant();
      return Right(restaurant);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, RestaurantModel>> getMenuByTable(String tableId) async {
    try {
      final restaurant = await dataSource.getMenuByTable(tableId);
      return Right(restaurant);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  @override
  Future<Failure?> createRestaurant(RestaurantCreationModel restaurant) async {
    try {
      await dataSource.createRestaurant(restaurant);
      return null;
    } catch (e) {
      return Failure(e.toString());
    }
  }

  @override
  Future<Failure?> updateRestaurant(RestaurantCreationModel restaurant) async {
    try {
      await dataSource.updateRestaurant(restaurant);
      return null;
    } catch (e) {
      return Failure(e.toString());
    }
  }

  @override
  Future<Failure?> updateRestaurantImage(Uint8List image) async {
    try {
      await dataSource.updateRestaurantImage(image);
      return null;
    } catch (e) {
      return Failure(e.toString());
    }
  }

  @override
  Future<Failure?> updateRestaurantLogo(Uint8List logo) async {
    try {
      await dataSource.updateRestaurantLogo(logo);
      return null;
    } catch (e) {
      return Failure(e.toString());
    }
  }
}

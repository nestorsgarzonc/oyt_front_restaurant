import 'package:equatable/equatable.dart';

class BaseRestaurantEntity extends Equatable {
  const BaseRestaurantEntity({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.isAvailable,
    required this.restaurantId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory BaseRestaurantEntity.fromMap(Map<String, dynamic> map) {
    return BaseRestaurantEntity(
      id: map['_id'] as String,
      firstName: map['user']['firstName'] as String,
      lastName: map['user']['lastName'] as String,
      email: map['user']['email'] as String,
      isAvailable: map['isAvailable'] as bool,
      restaurantId: map['restaurant'] as String,
      createdAt: DateTime.parse(map['createdAt']),
      updatedAt: DateTime.parse(map['updatedAt']),
    );
  }

  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final bool isAvailable;
  final String restaurantId;
  final DateTime createdAt;
  final DateTime updatedAt;

  @override
  List<Object?> get props {
    return [id, firstName, lastName, email, isAvailable, restaurantId, createdAt, updatedAt];
  }

  BaseRestaurantEntity copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    bool? isAvailable,
    String? restaurantId,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return BaseRestaurantEntity(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      isAvailable: isAvailable ?? this.isAvailable,
      restaurantId: restaurantId ?? this.restaurantId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'isAvailable': isAvailable,
      'restaurantId': restaurantId,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'updatedAt': updatedAt.millisecondsSinceEpoch,
    };
  }
}

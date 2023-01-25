import 'dart:convert';
import 'dart:ui';
import 'package:equatable/equatable.dart';
import 'package:oyt_front_core/enums/payments_enum.dart';
import 'package:oyt_front_core/enums/weekdays_enum.dart';
import 'package:oyt_front_core/extensions/color_extension.dart';

class RestaurantModel extends Equatable {
  factory RestaurantModel.fromJson(String source) =>
      RestaurantModel.fromMap(json.decode(source) as Map<String, dynamic>);

  factory RestaurantModel.fromMap(Map<String, dynamic> rawMap) {
    final Map map = rawMap['restaurant'];
    return RestaurantModel(
      id: map['_id'] as String,
      name: map['name'] as String,
      phone: map['phone'] as int,
      email: map['email'] as String,
      address: map['address'] as String,
      description: map['description'] as String,
      imageUrl: map['image'] != null ? map['image'] as String : null,
      logoUrl: map['logo'] != null ? map['logo'] as String : null,
      tableName: map['name'] as String,
      categories: List<Menu>.from(map['menu']?.map((x) => Menu.fromMap(x))),
      paymentMethods:
          (map['paymentMethods'] as List).map((e) => PaymentMethod.fromString(e)).toList(),
      weekDays: (map['weekDays'] as List)
          .map<Weekday>((x) => Weekday.fromMap(x as Map<String, dynamic>))
          .toList(),
      primaryColor: map['primaryColor'] != null ? (map['primaryColor'] as String).toColor : null,
      secondaryColor:
          map['secondaryColor'] != null ? (map['secondaryColor'] as String).toColor : null,
      facebook: map['facebook'] != null ? map['facebook'] as String : null,
      instagram: map['instagram'] != null ? map['instagram'] as String : null,
    );
  }

  const RestaurantModel({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.address,
    required this.description,
    required this.imageUrl,
    required this.logoUrl,
    required this.tableName,
    required this.categories,
    required this.paymentMethods,
    required this.weekDays,
    this.primaryColor,
    this.secondaryColor,
    this.facebook,
    this.instagram,
  });

  final String id;
  final String name;
  final int phone;
  final String email;
  final String address;
  final String description;
  final String? imageUrl;
  final String? logoUrl;
  final String tableName;
  final List<Menu> categories;
  final List<PaymentMethod> paymentMethods;
  final List<Weekday> weekDays;
  final Color? primaryColor;
  final Color? secondaryColor;
  final String? facebook;
  final String? instagram;

  @override
  List<Object?> get props {
    return [
      id,
      name,
      phone,
      email,
      address,
      description,
      imageUrl,
      logoUrl,
      tableName,
      categories,
      paymentMethods,
      weekDays,
      primaryColor,
      secondaryColor,
      facebook,
      instagram,
    ];
  }

  RestaurantModel copyWith({
    String? id,
    String? name,
    int? phone,
    String? email,
    String? address,
    String? description,
    String? imageUrl,
    String? logoUrl,
    String? tableName,
    List<Menu>? categories,
    List<PaymentMethod>? paymentMethods,
    List<Weekday>? weekDays,
    Color? primaryColor,
    Color? secondaryColor,
    String? facebook,
    String? instagram,
  }) {
    return RestaurantModel(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      address: address ?? this.address,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      logoUrl: logoUrl ?? this.logoUrl,
      tableName: tableName ?? this.tableName,
      categories: categories ?? this.categories,
      paymentMethods: paymentMethods ?? this.paymentMethods,
      weekDays: weekDays ?? this.weekDays,
      primaryColor: primaryColor ?? this.primaryColor,
      secondaryColor: secondaryColor ?? this.secondaryColor,
      facebook: facebook ?? this.facebook,
      instagram: instagram ?? this.instagram,
    );
  }
}

class Menu extends Equatable {
  factory Menu.fromJson(String source) => Menu.fromMap(json.decode(source));

  factory Menu.fromMap(Map<String, dynamic> map) {
    return Menu(
      id: map['_id'] ?? '',
      name: map['name'] ?? '',
      imgUrl: map['img'] ?? '',
      description: map['description'] ?? '',
      menuItems: List<MenuItem>.from(map['menuItems']?.map((x) => MenuItem.fromMap(x))),
      isAvaliable: map['isAvaliable'] ?? false,
    );
  }
  const Menu({
    required this.id,
    required this.name,
    required this.imgUrl,
    required this.description,
    required this.menuItems,
    required this.isAvaliable,
  });

  final String id;
  final String name;
  final String imgUrl;
  final String description;
  final List<MenuItem> menuItems;
  final bool isAvaliable;

  @override
  List<Object?> get props => [id, name, imgUrl, description, menuItems, isAvaliable];

  Menu copyWith({
    String? id,
    String? name,
    String? imgUrl,
    String? description,
    List<MenuItem>? menuItems,
    bool? isAvaliable,
  }) {
    return Menu(
      id: id ?? this.id,
      name: name ?? this.name,
      imgUrl: imgUrl ?? this.imgUrl,
      description: description ?? this.description,
      menuItems: menuItems ?? this.menuItems,
      isAvaliable: isAvaliable ?? this.isAvaliable,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'name': name,
      'img': imgUrl,
      'description': description,
      'menuItems': menuItems.map((x) => x.toMap()).toList(),
      'isAvaliable': isAvaliable,
    };
  }

  String toJson() => json.encode(toMap());
}

class MenuItem extends Equatable {
  factory MenuItem.fromJson(String source) => MenuItem.fromMap(json.decode(source));

  factory MenuItem.fromMap(Map<String, dynamic> map) {
    return MenuItem(
      id: map['_id'] ?? '',
      name: map['name'] ?? '',
      price: map['price']?.toInt() ?? 0,
      imgUrl: map['img'] ?? '',
      isAvaliable: map['isAvaliable'] ?? false,
      description: map['description'] ?? '',
    );
  }
  const MenuItem({
    required this.description,
    required this.id,
    required this.name,
    required this.price,
    required this.imgUrl,
    required this.isAvaliable,
  });

  final String id;
  final String name;
  final int price;
  final String imgUrl;
  final bool isAvaliable;
  final String description;

  @override
  List<Object?> get props => [id, name, price, imgUrl, isAvaliable];

  MenuItem copyWith({
    String? id,
    String? name,
    int? price,
    String? imgUrl,
    bool? isAvaliable,
    String? description,
  }) {
    return MenuItem(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      imgUrl: imgUrl ?? this.imgUrl,
      isAvaliable: isAvaliable ?? this.isAvaliable,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'name': name,
      'price': price,
      'img': imgUrl,
      'isAvaliable': isAvaliable,
    };
  }

  String toJson() => json.encode(toMap());
}

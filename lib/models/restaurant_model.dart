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
          (map['paymentMethods'] as List).map((e) => PaymentMethod.fromString(e['description'])).toList(),
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
      isAvailable: map['isAvailable'] ?? false,
    );
  }
  const Menu({
    required this.id,
    required this.name,
    required this.imgUrl,
    required this.description,
    required this.menuItems,
    required this.isAvailable,
  });

  final String id;
  final String name;
  final String imgUrl;
  final String description;
  final List<MenuItem> menuItems;
  final bool isAvailable;

  @override
  List<Object?> get props => [id, name, imgUrl, description, menuItems, isAvailable];

  Menu copyWith({
    String? id,
    String? name,
    String? imgUrl,
    String? description,
    List<MenuItem>? menuItems,
    bool? isAvailable,
  }) {
    return Menu(
      id: id ?? this.id,
      name: name ?? this.name,
      imgUrl: imgUrl ?? this.imgUrl,
      description: description ?? this.description,
      menuItems: menuItems ?? this.menuItems,
      isAvailable: isAvailable ?? this.isAvailable,
    );
  }

  Menu copyWithForUpdate({
    String? id,
    String? name,
    String? img,
    String? description,
    List<MenuItem>? menuItems,
    bool? isAvailable,
  }) {
    return Menu(
      id: id ?? this.id,
      name: name ?? this.name,
      imgUrl: img ?? '',
      description: description ?? this.description,
      menuItems: menuItems ?? this.menuItems,
      isAvailable: isAvailable ?? this.isAvailable,
    );
  }

  Map<String, dynamic> toMapCRUD() {
    return {
      'name': name,
      if (imgUrl.isNotEmpty) 'img': imgUrl,
      'description': description,
      'isAvailable': isAvailable,
    };
  }

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'name': name,
      'img': imgUrl,
      'description': description,
      'menuItems': menuItems.map((x) => x.toMap()).toList(),
      'isAvailable': isAvailable,
    };
  }
}

class MenuItem extends Equatable {
  factory MenuItem.fromJson(String source) => MenuItem.fromMap(json.decode(source));

  factory MenuItem.fromMap(Map<String, dynamic> map) {
    return MenuItem(
      id: map['_id'] ?? '',
      name: map['name'] ?? '',
      price: map['price']?.toInt() ?? 0,
      imgUrl: map['img'] ?? '',
      isAvailable: map['isAvailable'] ?? false,
      description: map['description'] ?? '',
    );
  }
  const MenuItem({
    required this.description,
    required this.id,
    required this.name,
    required this.price,
    required this.imgUrl,
    required this.isAvailable,
  });

  final String id;
  final String name;
  final int price;
  final String imgUrl;
  final bool isAvailable;
  final String description;

  @override
  List<Object?> get props => [id, name, price, imgUrl, isAvailable];

  MenuItem copyWith({
    String? id,
    String? name,
    int? price,
    String? imgUrl,
    bool? isAvailable,
    String? description,
  }) {
    return MenuItem(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      imgUrl: imgUrl ?? this.imgUrl,
      isAvailable: isAvailable ?? this.isAvailable,
      description: description ?? this.description,
    );
  }

  MenuItem copyWithForUpdate({
    String? name,
    int? price,
    String? img,
    bool? isAvailable,
    String? description,
  }) {
    return MenuItem(
      id: id,
      name: name ?? this.name,
      price: price ?? this.price,
      imgUrl: img ?? '',
      isAvailable: isAvailable ?? this.isAvailable,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'name': name,
      'price': price,
      'img': imgUrl,
      'isAvailable': isAvailable,
      'description': description,
    };
  }

  Map<String, dynamic> toMapCRUD() {
    return {
      'name': name,
      'description': description,
      'price': price,
      if (imgUrl.isNotEmpty) 'img': imgUrl,
      'isAvailable': isAvailable,
    };
  }
}

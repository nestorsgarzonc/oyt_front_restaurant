import 'dart:ui';
import 'package:equatable/equatable.dart';
import 'package:oyt_front_core/enums/payments_enum.dart';
import 'package:oyt_front_core/enums/weekdays_enum.dart';
import 'package:oyt_front_core/extensions/color_extension.dart';

class RestaurantCreationModel extends Equatable {
  const RestaurantCreationModel({
    this.address,
    this.description,
    this.email,
    this.facebook,
    this.imageBase64,
    this.instagram,
    this.logoBase64,
    this.name,
    this.paymentMethods,
    this.phone,
    this.primaryColor,
    this.secondaryColor,
    this.weekDays,
  });

  final String? address;
  final String? description;
  final String? email;
  final String? name;
  final String? phone;
  final Color? primaryColor;
  final Color? secondaryColor;
  final String? logoBase64;
  final String? imageBase64;
  final List<Weekday>? weekDays;
  final String? facebook;
  final String? instagram;
  final List<PaymentMethod>? paymentMethods;

  @override
  List<Object?> get props {
    return [
      address,
      description,
      email,
      name,
      phone,
      primaryColor,
      secondaryColor,
      logoBase64,
      imageBase64,
      weekDays,
      facebook,
      instagram,
      paymentMethods,
    ];
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'address': address,
      'description': description,
      'email': email,
      'name': name,
      'phone': phone,
      'primaryColor': primaryColor?.toRgbString,
      'secondaryColor': secondaryColor?.toRgbString,
      'logo': logoBase64,
      'image': imageBase64,
      'weekDays': weekDays?.map((x) => x.toMap()).toList(),
      'facebook': facebook,
      'instagram': instagram,
      'paymentMethods': paymentMethods?.map((x) => x.paymentValue).toList(),
    };
  }
}

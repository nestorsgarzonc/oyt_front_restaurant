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
      if (address?.isNotEmpty ?? false) 'address': address,
      if (description?.isNotEmpty ?? false) 'description': description,
      if (email?.isNotEmpty ?? false) 'email': email,
      if (name?.isNotEmpty ?? false) 'name': name,
      if (phone?.isNotEmpty ?? false) 'phone': phone,
      if (logoBase64?.isNotEmpty ?? false) 'logo': logoBase64,
      if (imageBase64?.isNotEmpty ?? false) 'image': imageBase64,
      if (facebook?.isNotEmpty ?? false) 'facebook': facebook,
      if (instagram?.isNotEmpty ?? false) 'instagram': instagram,
      if (weekDays != null) 'weekDays': weekDays?.map((x) => x.toMap()).toList(),
      if (primaryColor != null) 'primaryColor': primaryColor?.toRgbString,
      if (secondaryColor != null) 'secondaryColor': secondaryColor?.toRgbString,
      if (paymentMethods != null)
        'paymentMethods': paymentMethods?.map((x) => x.paymentValue).toList(),
    };
  }
}

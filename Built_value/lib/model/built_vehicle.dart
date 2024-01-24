library built_vehicle;

// import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
part 'built_vehicle.g.dart';

abstract class UserAddress implements Built<UserAddress, UserAddressBuilder> {
  //part of built_value used for creeating immutable class
  String get street;
  String get city;
  String get zipcode;

  UserAddress._();

  factory UserAddress([void Function(UserAddressBuilder) update]) =
      _$UserAddress; //creating instance

  static Serializer<UserAddress> get serializer => _$userAddressSerializer;
} // conversion of instance to and from a serialized format like json

abstract class UserDetail implements Built<UserDetail, UserDetailBuilder> {
  UserAddress get address;
  String get name;
  String get username;
  String get email;

  UserDetail._();

  factory UserDetail([void Function(UserDetailBuilder) update]) = _$UserDetail;

  static Serializer<UserDetail> get serializer => _$userDetailSerializer;
}

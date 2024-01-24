// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'built_vehicle.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<UserAddress> _$userAddressSerializer = new _$UserAddressSerializer();
Serializer<UserDetail> _$userDetailSerializer = new _$UserDetailSerializer();

class _$UserAddressSerializer implements StructuredSerializer<UserAddress> {
  @override
  final Iterable<Type> types = const [UserAddress, _$UserAddress];
  @override
  final String wireName = 'UserAddress';

  @override
  Iterable<Object?> serialize(Serializers serializers, UserAddress object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'street',
      serializers.serialize(object.street,
          specifiedType: const FullType(String)),
      'city',
      serializers.serialize(object.city, specifiedType: const FullType(String)),
      'zipcode',
      serializers.serialize(object.zipcode,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  UserAddress deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserAddressBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'street':
          result.street = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'city':
          result.city = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'zipcode':
          result.zipcode = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$UserDetailSerializer implements StructuredSerializer<UserDetail> {
  @override
  final Iterable<Type> types = const [UserDetail, _$UserDetail];
  @override
  final String wireName = 'UserDetail';

  @override
  Iterable<Object?> serialize(Serializers serializers, UserDetail object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'address',
      serializers.serialize(object.address,
          specifiedType: const FullType(UserAddress)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'username',
      serializers.serialize(object.username,
          specifiedType: const FullType(String)),
      'email',
      serializers.serialize(object.email,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  UserDetail deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UserDetailBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'address':
          result.address.replace(serializers.deserialize(value,
              specifiedType: const FullType(UserAddress))! as UserAddress);
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'username':
          result.username = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$UserAddress extends UserAddress {
  @override
  final String street;
  @override
  final String city;
  @override
  final String zipcode;

  factory _$UserAddress([void Function(UserAddressBuilder)? updates]) =>
      (new UserAddressBuilder()..update(updates))._build();

  _$UserAddress._(
      {required this.street, required this.city, required this.zipcode})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(street, r'UserAddress', 'street');
    BuiltValueNullFieldError.checkNotNull(city, r'UserAddress', 'city');
    BuiltValueNullFieldError.checkNotNull(zipcode, r'UserAddress', 'zipcode');
  }

  @override
  UserAddress rebuild(void Function(UserAddressBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserAddressBuilder toBuilder() => new UserAddressBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserAddress &&
        street == other.street &&
        city == other.city &&
        zipcode == other.zipcode;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, street.hashCode);
    _$hash = $jc(_$hash, city.hashCode);
    _$hash = $jc(_$hash, zipcode.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserAddress')
          ..add('street', street)
          ..add('city', city)
          ..add('zipcode', zipcode))
        .toString();
  }
}

class UserAddressBuilder implements Builder<UserAddress, UserAddressBuilder> {
  _$UserAddress? _$v;

  String? _street;
  String? get street => _$this._street;
  set street(String? street) => _$this._street = street;

  String? _city;
  String? get city => _$this._city;
  set city(String? city) => _$this._city = city;

  String? _zipcode;
  String? get zipcode => _$this._zipcode;
  set zipcode(String? zipcode) => _$this._zipcode = zipcode;

  UserAddressBuilder();

  UserAddressBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _street = $v.street;
      _city = $v.city;
      _zipcode = $v.zipcode;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserAddress other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserAddress;
  }

  @override
  void update(void Function(UserAddressBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserAddress build() => _build();

  _$UserAddress _build() {
    final _$result = _$v ??
        new _$UserAddress._(
            street: BuiltValueNullFieldError.checkNotNull(
                street, r'UserAddress', 'street'),
            city: BuiltValueNullFieldError.checkNotNull(
                city, r'UserAddress', 'city'),
            zipcode: BuiltValueNullFieldError.checkNotNull(
                zipcode, r'UserAddress', 'zipcode'));
    replace(_$result);
    return _$result;
  }
}

class _$UserDetail extends UserDetail {
  @override
  final UserAddress address;
  @override
  final String name;
  @override
  final String username;
  @override
  final String email;

  factory _$UserDetail([void Function(UserDetailBuilder)? updates]) =>
      (new UserDetailBuilder()..update(updates))._build();

  _$UserDetail._(
      {required this.address,
      required this.name,
      required this.username,
      required this.email})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(address, r'UserDetail', 'address');
    BuiltValueNullFieldError.checkNotNull(name, r'UserDetail', 'name');
    BuiltValueNullFieldError.checkNotNull(username, r'UserDetail', 'username');
    BuiltValueNullFieldError.checkNotNull(email, r'UserDetail', 'email');
  }

  @override
  UserDetail rebuild(void Function(UserDetailBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserDetailBuilder toBuilder() => new UserDetailBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserDetail &&
        address == other.address &&
        name == other.name &&
        username == other.username &&
        email == other.email;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, address.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, username.hashCode);
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserDetail')
          ..add('address', address)
          ..add('name', name)
          ..add('username', username)
          ..add('email', email))
        .toString();
  }
}

class UserDetailBuilder implements Builder<UserDetail, UserDetailBuilder> {
  _$UserDetail? _$v;

  UserAddressBuilder? _address;
  UserAddressBuilder get address =>
      _$this._address ??= new UserAddressBuilder();
  set address(UserAddressBuilder? address) => _$this._address = address;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _username;
  String? get username => _$this._username;
  set username(String? username) => _$this._username = username;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  UserDetailBuilder();

  UserDetailBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _address = $v.address.toBuilder();
      _name = $v.name;
      _username = $v.username;
      _email = $v.email;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserDetail other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$UserDetail;
  }

  @override
  void update(void Function(UserDetailBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserDetail build() => _build();

  _$UserDetail _build() {
    _$UserDetail _$result;
    try {
      _$result = _$v ??
          new _$UserDetail._(
              address: address.build(),
              name: BuiltValueNullFieldError.checkNotNull(
                  name, r'UserDetail', 'name'),
              username: BuiltValueNullFieldError.checkNotNull(
                  username, r'UserDetail', 'username'),
              email: BuiltValueNullFieldError.checkNotNull(
                  email, r'UserDetail', 'email'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'address';
        address.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'UserDetail', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

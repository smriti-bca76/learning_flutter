library serializers;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:myapp/model/built_vehicle.dart';

part 'serializers.g.dart';

@SerializersFor([
  UserAddress,
  UserDetail,
])
final Serializers serializers = (_$serializers.toBuilder()
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(UserDetail)]),
        () => ListBuilder<UserDetail>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(UserAddress)]),
        () => ListBuilder<UserAddress>(),
      )
      ..addPlugin(
        StandardJsonPlugin(),
      ))
    .build();

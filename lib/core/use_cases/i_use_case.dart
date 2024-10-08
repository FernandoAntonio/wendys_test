import 'package:freezed_annotation/freezed_annotation.dart';

part 'i_use_case.freezed.dart';

abstract interface class IUseCase<Type, Params> {
  Future<(Type, String?)> call(Params params);
}

@freezed
class NoParams {
  const factory NoParams() = _NoParams;
}

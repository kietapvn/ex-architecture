import 'package:freezed_annotation/freezed_annotation.dart';

part 'loading_status.freezed.dart';

@freezed
class LoadingStatus with _$LoadingStatus {
  const LoadingStatus._();

  const factory LoadingStatus.init({required bool isEmpty}) = _init;
  const factory LoadingStatus.error(String error) = _error;
  const factory LoadingStatus.data({required bool isLoading}) = _data;

  bool get isLoading => when(
        init: (_) => false,
        error: (_) => false,
        data: (isLoading) => isLoading,
      );
}

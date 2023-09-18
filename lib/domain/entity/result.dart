import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

@freezed
class Result<T> with _$Result<T> {
  const Result._();

  factory Result.success(T data) = Success<T>;

  factory Result.error(Exception? exception) = Error;

  bool get isSuccess => this is Success<T>;

  T get dataOrThrow {
    return when(
      success: (data) => data,
      error: (err) => throw err ?? Exception(),
    );
  }
}

import 'package:example_architecture/domain/entity/product.dart';
import 'package:example_architecture/presentation/base/page/loading_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_view_state.freezed.dart';

@freezed
class HomeViewState with _$HomeViewState {
  const factory HomeViewState({
    required LoadingStatus loadingStatus,
    List<Product>? products,
  }) = _HomeViewState;
}

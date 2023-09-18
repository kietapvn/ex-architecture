import 'dart:async';

import 'package:example_architecture/domain/usecase/products/fetch_products_use_case.dart';
import 'package:example_architecture/presentation/base/page/loading_status.dart';
import 'package:example_architecture/presentation/destinations/home/home_view_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final homeViewModelProvider =
    StateNotifierProvider.autoDispose<HomeViewModel, HomeViewState>(
  (ref) => GetIt.I.get(),
);

@Injectable()
class HomeViewModel extends StateNotifier<HomeViewState> {
  HomeViewModel(
    this.fetchProductsUseCase,
  ) : super(_initialState);

  static get _initialState => const HomeViewState(
        loadingStatus: LoadingStatus.data(isLoading: false),
      );

  final FetchProductsUseCase fetchProductsUseCase;

  Future<void> fetchProducts() async {
    state = state.copyWith(
      loadingStatus: const LoadingStatus.data(isLoading: true),
    );

    final result = await fetchProductsUseCase.call(FetchProductsParam());
    result.when(
      success: (data) {
        state = state.copyWith(
          loadingStatus: const LoadingStatus.data(isLoading: false),
          products: data,
        );
      },
      error: (error) => state = state.copyWith(
        loadingStatus: LoadingStatus.error(error.toString()),
      ),
    );
  }
}

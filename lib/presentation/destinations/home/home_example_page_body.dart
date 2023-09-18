import 'package:example_architecture/domain/entity/product.dart';
import 'package:example_architecture/navigation/home/home_navigator.dart';
import 'package:example_architecture/presentation/base/widget/network_extended_image.dart';
import 'package:example_architecture/presentation/common_widgets/loading_widget.dart';
import 'package:example_architecture/presentation/destinations/home/home_view_model.dart';
import 'package:example_architecture/presentation/destinations/home/home_view_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeExamplePageBody extends HookConsumerWidget {
  const HomeExamplePageBody({super.key});

  HomeNavigator get navigator => GetIt.I.get();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(homeViewModelProvider.notifier);
    final state = ref.watch(homeViewModelProvider);

    useEffect(
      () {
        Future.microtask(viewModel.fetchProducts);

        ref.listen<HomeViewState>(
          homeViewModelProvider,
          (previousState, newState) {
            if (previousState?.loadingStatus != newState.loadingStatus) {
              newState.loadingStatus.when(
                init: (_) {/*Do nothing*/},
                error: (error) => ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    key: const Key('error_snack_bar'),
                    content: Text(error),
                  ),
                ),
                data: (data) {/*Do nothing*/},
              );
            }
          },
        );

        return null;
      },
      const [],
    );

    return LoadingWidget(
      isLoading: state.loadingStatus.isLoading,
      child: ListView.builder(
        itemBuilder: (context, index) => _buildItem(
          context,
          state.products![index],
          onTap: () => _showDetail(
            context,
            state.products![index],
            viewModel,
          ),
        ),
        itemCount: state.products?.length ?? 0,
      ),
    );
  }

  Widget _buildItem(
    BuildContext context,
    Product product, {
    VoidCallback? onTap,
  }) {
    return ListTile(
      onTap: onTap,
      title: Text(
        product.title,
      ),
      subtitle: Text(
        '${product.price.toStringAsFixed(0)} \$',
      ),
      leading: product.thumbnail.isNotEmpty
          ? AspectRatio(
              aspectRatio: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: NetworkExtendedImage(
                  product.thumbnail,
                  fit: BoxFit.fill,
                ),
              ),
            )
          : null,
    );
  }

  void _showDetail(
    BuildContext context,
    Product product,
    HomeViewModel viewModel,
  ) {
    showModalBottomSheet(
      context: context,
      showDragHandle: true,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      builder: (context) {
        return Column(
          key: const Key('bottom_sheet_overview_item'),
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                if (product.thumbnail.isNotEmpty) const Gap(16),
                if (product.thumbnail.isNotEmpty)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: NetworkExtendedImage(
                      product.thumbnail,
                      fit: BoxFit.fill,
                      height: 80,
                      width: 80,
                    ),
                  ),
                Expanded(
                  child: ListTile(
                    title: Text(
                      product.title,
                    ),
                    subtitle: Text(
                      '${product.price.toStringAsFixed(0)} \$',
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                product.description,
              ),
            ),
            const Divider(),
            if (product.images.isNotEmpty)
              SizedBox(
                height: 160,
                child: ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: product.images.length,
                  itemBuilder: (context, index) => AspectRatio(
                    aspectRatio: 1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: NetworkExtendedImage(
                        product.images[index],
                        fit: BoxFit.fill,
                        height: 80,
                        width: 80,
                      ),
                    ),
                  ),
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 8),
                  scrollDirection: Axis.horizontal,
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  navigator.toDetailScreen(product.id, product).then(
                        (_) => viewModel.fetchProducts(),
                      );
                },
                child: const Text('View detail'),
              ),
            ),
            const SafeArea(child: SizedBox.shrink()),
          ],
        );
      },
    );
  }
}

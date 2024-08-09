import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../error/error.dart';
import '../themes/theme.dart';
import 'app_button.dart';
import 'app_loading.dart';

class AsyncBuilder<T> extends ConsumerStatefulWidget {
  const AsyncBuilder(
    this.value, {
    required this.onData,
    this.isSliver = false,
    this.height,
    this.loading,
    this.onError,
    this.initialData,
    super.key,
  });

  final ProviderListenable<AsyncValue<T>> value;
  final Widget Function(T data) onData;
  final T? initialData;
  final bool isSliver;
  final double? height;
  final Widget? loading;
  final Widget Function(Object error, StackTrace? stackTrace)? onError;

  @override
  ConsumerState<AsyncBuilder<T>> createState() => _AsyncBuilderState<T>();
}

class _AsyncBuilderState<T> extends ConsumerState<AsyncBuilder<T>> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(widget.value);
    print('AsyncBuilder: ${state}');
    return state.when(
      skipLoadingOnRefresh: false,
      data: widget.onData,
      loading: loading,
      error: error,
    );
  }

  Widget loading() {
    if (widget.initialData != null) {
      return widget.onData(widget.initialData as T);
    } else if (widget.loading != null) {
      return widget.loading!;
    } else if (widget.isSliver) {
      return SliverFillRemaining(
        child: Container(
          height: widget.height,
          alignment: Alignment.center,
          child: const AppLoading(),
        ),
      );
    } else {
      return Container(
        alignment: Alignment.center,
        height: widget.height,
        child: const AppLoading(),
      );
    }
  }

  Widget error(Object error, StackTrace? stackTrace) {
    ExceptionHandler.debug(error, stackTrace);
    if (widget.initialData != null) {
      return widget.onData(widget.initialData as T);
    }
    if (widget.onError != null) {
      return widget.onError!(error, stackTrace);
    }

    if (widget.isSliver) {
      return SliverToBoxAdapter(
        child: Container(
          height: widget.height,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(AppStyle.appPaddingVal),
          child: Text(
            ExceptionHandler.getErrorMsg(error),
            textAlign: TextAlign.center,
            style: AppTextStyle.body2.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      );
    }
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(AppStyle.appPaddingVal),
      height: widget.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            ExceptionHandler.getErrorMsg(error),
            textAlign: TextAlign.center,
            style: AppTextStyle.body2.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: AppStyle.appPaddingVal),
          AppButton(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            borderRadius: 20,
            isLoadable: false,
            onPressed: () => ref.refresh(widget.value as Refreshable),
            child: Text(
              'Retry',
              style: AppTextStyle.body2.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AsyncDataBuilder<T> extends ConsumerWidget {
  const AsyncDataBuilder(
    this.value, {
    required this.onData,
    this.altData,
    super.key,
  });

  final ProviderListenable<AsyncValue<T>> value;
  final Widget Function(T? data) onData;
  final T? altData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(value, (p,newValue) {
      debugPrint('AsyncDataBuilder: $newValue');
    });
    return onData(ref.watch(value).valueOrNull ?? altData);
  }
}

class FutureDataBuilder<T> extends ConsumerWidget {
  const FutureDataBuilder(
    this.value, {
    required this.onData,
    this.altData,
    super.key,
  });

  final ProviderListenable<Future<T>> value;
  final Widget Function(T? data) onData;
  final T? altData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder<T>(
      future: ref.watch(value),
      initialData: altData,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return onData(snapshot.data ?? altData);
        } else if (altData != null) {
          return onData(altData);
        }
        return const SizedBox();
      },
    );
  }
}

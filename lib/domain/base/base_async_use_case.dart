abstract class BaseAsyncUseCase<IN, OUT> {
  Future<OUT> call(IN param);
}

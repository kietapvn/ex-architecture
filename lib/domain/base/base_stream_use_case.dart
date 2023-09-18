abstract class BaseStreamUseCase<IN, OUT> {
  Stream<OUT> call(IN param);
}

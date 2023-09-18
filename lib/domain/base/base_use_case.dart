abstract class BaseUseCase<IN, OUT> {
  OUT call(IN param);
}

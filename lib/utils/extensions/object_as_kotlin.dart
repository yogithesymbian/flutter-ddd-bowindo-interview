// its looks like a '.let' in kotlin , awesome !, dart
extension ObjectExt<T> on T {
  R let<R>(R Function(T) x) => x(this);
}
// thanks for StackOverflow, @aw.yogi
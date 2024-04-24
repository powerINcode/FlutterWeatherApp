import 'package:core/data/data.dart';

Future<Data<T>> execute<T>(Future<T> future) async {
  return future
      .then((value) => Data.value(value: value))
      .onError((error, stackTrace) {
    return Data.error(error: error);
  });
}

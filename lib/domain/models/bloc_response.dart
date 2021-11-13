abstract class BlocResponse {
  String? extraMessage;
  BlocResponse({this.extraMessage});
}

class FromStorageBlockResponse<T> extends BlocResponse {
  T data;

  FromStorageBlockResponse(this.data, {String? extraMessage}) : super(extraMessage: extraMessage);
}

class FromNetworkBlocResponse<T> extends BlocResponse {
  T data;

  FromNetworkBlocResponse(this.data, {String? extraMessage}) : super(extraMessage: extraMessage);
}

class ErrorBlockResponse extends BlocResponse {
  ErrorBlockResponse(String extraMessage) : super(extraMessage: extraMessage);
}

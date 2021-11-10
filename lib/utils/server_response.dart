import 'package:equatable/equatable.dart';

class ServerResponse<L, ServerErrorResponse> implements Equatable {
  final L? _success;
  final ServerErrorResponse? _error;

  L? get success => _success;

  ServerErrorResponse? get error => _error;

  ServerResponse._internal(this._success, this._error);

  factory ServerResponse.success(L value) =>
      ServerResponse<L, ServerErrorResponse>._internal(value, null);

  factory ServerResponse.error(ServerErrorResponse value) =>
      ServerResponse<L, ServerErrorResponse>._internal(null, value);

  bool get isSuccess => success != null && error == null;

  bool get isError => error != null && success == null;

  @override
  List<Object?> get props => [_success, _error];

  @override
  bool? get stringify => true;
}

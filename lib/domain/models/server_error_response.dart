import 'package:equatable/equatable.dart';

class ServerErrorResponse implements Equatable {
  final int statusCode;
  final String error;

  ServerErrorResponse(this.statusCode, this.error);

  @override
  List<Object?> get props => [statusCode, error];

  @override
  bool? get stringify => true;
}

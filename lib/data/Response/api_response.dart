import 'package:task_manager/data/Response/status.dart';


class ApiResponse<T>{
  Status? status;
  T? data;
  String? message;

  ApiResponse([this.status,this.data,this.message]);

  ApiResponse.loading() : status = Status.LOADING;
  ApiResponse.completed(this.data) : status = Status.COMPELTED;
  ApiResponse.error(this.message) : status = Status.ERROR;

  @override
  String toString(){
    return 'Message: $message \n Status: $status \n Data: $data';
  }
}
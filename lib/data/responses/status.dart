

import 'api_responses.dart';

class ApiResponse<T>{


   T? data;
   String? message;
   Status? status;


  ApiResponse(this.status, this.data, this.message);

  ApiResponse.loading() : status = Status.LOADING;
  ApiResponse.completed(this.data) : status = Status.SUCCESS;
  ApiResponse.error(this.message) : status = Status.ERROR;


  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }

}
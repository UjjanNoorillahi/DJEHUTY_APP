
class AppExceptions implements Exception{

  final _message;
  final _prefix;


  AppExceptions([this._message, this._prefix]);

  @override
  String toString(){
    return '$_prefix$_message';
  }
}


class InternetException extends AppExceptions{

  InternetException([String? message]) : super(message, 'No internet');
}


class RequestTimeOut extends AppExceptions{

  RequestTimeOut([String? message]) : super(message, 'Request Time Out');
}

class InvalidUrlException extends AppExceptions{

  InvalidUrlException([String? message]) : super(message, 'Invalid Url');
}

class FatchDataException extends AppExceptions{

  FatchDataException([String? message]) : super(message, 'Error occured while Communication with Server');
}
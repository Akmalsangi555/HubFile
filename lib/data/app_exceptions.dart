
class AppExceptions implements Exception{
  final _message, _prefix;
  AppExceptions([this._message, this._prefix]);

  String toString(){
    return "$_message$_prefix";
  }

}

class InternetExceptions extends AppExceptions{
  InternetExceptions([String? message]) : super (message, "No Internet");
}

class RequestTimeOut extends AppExceptions{
  RequestTimeOut([String? message]) : super (message, "Request TimeOut");
}

class ServerException extends AppExceptions{
  ServerException([String? message]) : super (message, "Internal server error");
}

class InvalidUrlException extends AppExceptions{
  InvalidUrlException([String? message]) : super (message, "Invalid Url");
}

class FetchDataException extends AppExceptions{
  FetchDataException([String? message]) : super (message, "");
}
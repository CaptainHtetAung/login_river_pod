enum Status { SUCCESS, FAILURE }
enum ERROR_TYPE {NETWORK, SERVER_ERROR, INVALID_LOGIN_INFO}

class AppResult<T> {
  Status status;
  String message;
  T data;

  AppResult.success([this.data]) : status = Status.SUCCESS;

  AppResult.failure([this.message]) : status = Status.FAILURE;
}

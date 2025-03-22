import '../../view_model/enums/enums.dart';

class AppResponse<T> {
  T? data;
  StatusEnum status;

  AppResponse({this.data, this.status = StatusEnum.PENDING});

  AppResponse.pending() : status = StatusEnum.PENDING;
  AppResponse.complete(T bodyData)
      : data = bodyData,
        status = StatusEnum.SUCCESS;

  AppResponse.loading() : status = StatusEnum.LOADING;
  AppResponse.error() : status = StatusEnum.ERROR;
}

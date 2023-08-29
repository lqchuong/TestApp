import 'package:acecook/src/model/requests/product_info_request.dart';
import 'package:chopper/chopper.dart';
import 'package:acecook/src/model/requests/login_request.dart';

part 'auth_service.chopper.dart';

@ChopperApi(baseUrl: '')
abstract class AuthService extends ChopperService {
  @Post(
      path:
          '/oauth/token?grant_type=password&username={username}&password={password}')
  Future<Response> login(
      @Path('username') String username, @Path('password') String password);

  @Get(path: '/api/product/category?clientId={clientId}')
  Future<Response> getProductCategory(@Path('clientId') String clientId);

// http://192.168.20.27:8081/solution-base-web/api/priceOutDetail?companyCd=acv&productCd=-1&clientId=1280573
  @Get(
      path:
          '/api/priceOutDetail?companyCd={companyCd}&productCd={productCd}&clientId={clientId}')
  Future<Response> getpriceOutDetail(@Path('companyCd') String companyCd,
      @Path('productCd') int productCd, @Path('clientId') String clientId);

  // http://192.168.20.27:8081/solution-base-web/api/orders?companyCd=acv&clientId=1280573
  @Get(path: '/api/orders?companyCd={companyCd}&clientId={clientId}')
  Future<Response> getOrders(
      @Path('companyCd') String companyCd, @Path('clientId') String clientId);

  // http://192.168.20.27:8081/solution-base-web/api/orderedSKU?companyCd=acv&clientId=1280573
  @Get(path: '/api/orderedSKU?companyCd={companyCd}&clientId={clientId}')
  Future<Response> getorderedSKU(
      @Path('companyCd') String companyCd, @Path('clientId') String clientId);

  //http://192.168.20.27:8081/solution-base-web/api/product/findProductByCriteria?offset=0&number=1&size=1000000&clientId=1280573
  @Post(
      path:
          '/api/product/findProductByCriteria?offset={offset}&number={number}&size={size}&clientId={clientId}')
  Future<Response> getProducts(
      @Path('offset') int offset,
      @Path('number') int number,
      @Path('size') int size,
      @Path('clientId') String clientId,
      @Body() ProductInfoRequest request);

  // http://192.168.20.27:8081/solution-base-web/api/priceOutDetail?companyCd=acv&clientId=1408&productCd=CCB30
  @Get(
      path:
          '/api/priceOutDetail?companyCd={companyCd}&clientId={clientId}&productCd={productCd}')
  Future<Response> getPridceOfProduct(
    @Path('companyCd') String companyCd,
    @Path('clientId') int clientId,
    @Path('productCd') String productCd,
  );

  static AuthService create([ChopperClient? client]) => _$AuthService(client);
}

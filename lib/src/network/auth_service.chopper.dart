// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$AuthService extends AuthService {
  _$AuthService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = AuthService;

  @override
  Future<Response<dynamic>> login(
    String username,
    String password,
  ) {
    final Uri $url = Uri.parse(
        '/oauth/token?grant_type=password&username=${username}&password=${password}');
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getProductCategory(String clientId) {
    final Uri $url = Uri.parse('/api/product/category?clientId=${clientId}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getpriceOutDetail(
    String companyCd,
    int productCd,
    String clientId,
  ) {
    final Uri $url = Uri.parse(
        '/api/priceOutDetail?companyCd=${companyCd}&productCd=${productCd}&clientId=${clientId}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getOrders(
    String companyCd,
    String clientId,
  ) {
    final Uri $url =
        Uri.parse('/api/orders?companyCd=${companyCd}&clientId=${clientId}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getorderedSKU(
    String companyCd,
    String clientId,
  ) {
    final Uri $url = Uri.parse(
        '/api/orderedSKU?companyCd=${companyCd}&clientId=${clientId}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getProducts(
    int offset,
    int number,
    int size,
    String clientId,
    ProductInfoRequest request,
  ) {
    final Uri $url = Uri.parse(
        '/api/product/findProductByCriteria?offset=${offset}&number=${number}&size=${size}&clientId=${clientId}');
    final $body = request;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getPridceOfProduct(
    String companyCd,
    int clientId,
    String productCd,
  ) {
    final Uri $url = Uri.parse(
        '/api/priceOutDetail?companyCd=${companyCd}&clientId=${clientId}&productCd=${productCd}');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }
}

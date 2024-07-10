//
//  Generated code. Do not modify.
//  source: album.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'album.pb.dart' as $0;

export 'album.pb.dart';

@$pb.GrpcServiceName('AlbumService')
class AlbumServiceClient extends $grpc.Client {
  static final _$getAlbums = $grpc.ClientMethod<$0.AlbumRequest, $0.AlbumResponse>(
      '/AlbumService/getAlbums',
      ($0.AlbumRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.AlbumResponse.fromBuffer(value));
  static final _$getALbumsWithPhotos = $grpc.ClientMethod<$0.AlbumRequest, $0.AlbumResponse>(
      '/AlbumService/getALbumsWithPhotos',
      ($0.AlbumRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.AlbumResponse.fromBuffer(value));
  static final _$getPhotos = $grpc.ClientMethod<$0.AlbumRequest, $0.Photo>(
      '/AlbumService/getPhotos',
      ($0.AlbumRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Photo.fromBuffer(value));

  AlbumServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.AlbumResponse> getAlbums($0.AlbumRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getAlbums, request, options: options);
  }

  $grpc.ResponseFuture<$0.AlbumResponse> getALbumsWithPhotos($0.AlbumRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getALbumsWithPhotos, request, options: options);
  }

  $grpc.ResponseStream<$0.Photo> getPhotos($0.AlbumRequest request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$getPhotos, $async.Stream.fromIterable([request]), options: options);
  }
}

@$pb.GrpcServiceName('AlbumService')
abstract class AlbumServiceBase extends $grpc.Service {
  $core.String get $name => 'AlbumService';

  AlbumServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.AlbumRequest, $0.AlbumResponse>(
        'getAlbums',
        getAlbums_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.AlbumRequest.fromBuffer(value),
        ($0.AlbumResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.AlbumRequest, $0.AlbumResponse>(
        'getALbumsWithPhotos',
        getALbumsWithPhotos_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.AlbumRequest.fromBuffer(value),
        ($0.AlbumResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.AlbumRequest, $0.Photo>(
        'getPhotos',
        getPhotos_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.AlbumRequest.fromBuffer(value),
        ($0.Photo value) => value.writeToBuffer()));
  }

  $async.Future<$0.AlbumResponse> getAlbums_Pre($grpc.ServiceCall call, $async.Future<$0.AlbumRequest> request) async {
    return getAlbums(call, await request);
  }

  $async.Future<$0.AlbumResponse> getALbumsWithPhotos_Pre($grpc.ServiceCall call, $async.Future<$0.AlbumRequest> request) async {
    return getALbumsWithPhotos(call, await request);
  }

  $async.Stream<$0.Photo> getPhotos_Pre($grpc.ServiceCall call, $async.Future<$0.AlbumRequest> request) async* {
    yield* getPhotos(call, await request);
  }

  $async.Future<$0.AlbumResponse> getAlbums($grpc.ServiceCall call, $0.AlbumRequest request);
  $async.Future<$0.AlbumResponse> getALbumsWithPhotos($grpc.ServiceCall call, $0.AlbumRequest request);
  $async.Stream<$0.Photo> getPhotos($grpc.ServiceCall call, $0.AlbumRequest request);
}

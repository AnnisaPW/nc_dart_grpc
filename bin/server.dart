import 'package:grpc/src/server/call.dart';
import 'package:nc_dart_grpc/nc_dart_grpc.dart';

class AlbumService extends AlbumServiceBase {
  @override
  Future<AlbumResponse> getAlbums(ServiceCall call, AlbumRequest request) {
    // TODO: implement getAlbums
    throw UnimplementedError();
  }
}

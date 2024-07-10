import 'package:grpc/grpc.dart';
import 'package:nc_dart_grpc/nc_dart_grpc.dart';

class AlbumService extends AlbumServiceBase {
  @override
  Future<AlbumResponse> getAlbums(ServiceCall call, AlbumRequest request) async {
    final albumList = albums
        .map(
          (alb) => Album.fromJson(
            '{"1": ${alb['id']}, "2": "${alb['title']}"}',
          ),
        )
        .toList();
    return AlbumResponse()..albums.addAll(albumList);
  }
}

void main() async {
  final server = Server.create(
    services: [
      AlbumService(),
    ],
  );
  await server.serve(port: 5000);
  print('Server listening on port ${server.port}');
}

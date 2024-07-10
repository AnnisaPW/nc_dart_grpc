import 'package:grpc/grpc.dart';
import 'package:nc_dart_grpc/nc_dart_grpc.dart';

class AlbumService extends AlbumServiceBase {
  @override
  Future<AlbumResponse> getAlbums(ServiceCall call, AlbumRequest request) async {
    if (request.id > 0) {
      final album = albums
          .where(
            (element) => element['id'] == request.id,
          )
          .map(
            (e) => Album.fromJson(
              '{"1": ${e['id']}, "2": "${e['title']}"}',
            ),
          )
          .toList();
      return AlbumResponse()..albums.addAll(album);
    }
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

// helpers

List<Album> findAlbums(int id) {
  return albums
      .where(
        (element) => element['id'] == id,
      )
      .map(convertToAlbum)
      .toList();
}

Album convertToAlbum(Map albumMap) => Album.fromJson('{"1": ${albumMap['id']}, "2": "${albumMap['title']}"}');

void main() async {
  final server = Server.create(
    services: [
      AlbumService(),
    ],
  );
  await server.serve(port: 5000);
  print('Server listening on port ${server.port}');
}

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

  @override
  Future<AlbumResponse> getALbumsWithPhotos(ServiceCall call, AlbumRequest request) async {
    if (request.id > 0) {
      final album = findAlbums(request.id)[0];
      final albumPhotos = findPhotos(album.id);
      return AlbumResponse()..albums.add(album..photos.addAll(albumPhotos));
    }
    return AlbumResponse()
      ..albums.addAll(
        albums.map(
          (e) {
            final album = convertToAlbum(e);
            final albumPhotos = findPhotos(album.id);
            return album..photos.addAll(albumPhotos);
          },
        ),
      );
  }

  @override
  Stream<Photo> getPhotos(ServiceCall call, AlbumRequest request) async* {
    var photoList = photos;

    if (request.id > 0) {
      photoList = photos.where((element) => element['albumId'] == request.id).toList();
    }

    for (var photo in photoList) {
      yield Photo.fromJson('''{
        "1": ${photo['albumId']}, 
        "2": ${photo['id']}, 
        "3": "${photo['title']}", 
        "4": "${photo['url']}"
      }''');
    }
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

List<Photo> findPhotos(int id) {
  return photos.where((element) => element['albumId'] == id).map(convertToPhoto).toList();
}

Album convertToAlbum(Map albumMap) => Album.fromJson('{"1": ${albumMap['id']}, "2": "${albumMap['title']}"}');

Photo convertToPhoto(Map photo) => Photo.fromJson(
      '{"1": ${photo['albumId']}, "2": ${photo['id']}, "3": "${photo['title']}", "4": "${photo['url']}"}',
    );

void main() async {
  final server = Server.create(
    services: [
      AlbumService(),
    ],
  );
  await server.serve(port: 5000);
  print('Server listening on port ${server.port}');
}

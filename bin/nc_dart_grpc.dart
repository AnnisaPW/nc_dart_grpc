import 'package:nc_dart_grpc/nc_dart_grpc.dart';
import 'package:protobuf/protobuf.dart';

void main(List<String> arguments) {
  final album = Album(id: 1, title: 'Album title');
  print('--- new album ---');
  print(album);

  final album2 = Album.fromJson(
    '{"1": ${albums[0]['id']}, "2": "${albums[0]['title']}"}',
  );

  print('--- album 2 from json ---');

  print(album2);

  print('--- album deep copy ---');
  print(album2.deepCopy());

// ! Rebuilding only works on frozen messages. So, add this line below before call rebuild
  print('--- album freeze ---');
  print(album2.freeze());

  print('--- album rebuild ---');
  final albumRebuild = album2.rebuild(
    (album) {
      album.setField(2, 'album title updated');
    },
  );
  print(albumRebuild);
  print(album.writeToJson());
}

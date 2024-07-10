import 'package:grpc/grpc.dart';
import 'package:nc_dart_grpc/nc_dart_grpc.dart';

void main() async {
  final channel = ClientChannel(
    'localhost',
    port: 5000,
    options: ChannelOptions(credentials: ChannelCredentials.insecure()),
  );

  final stub = AlbumServiceClient(channel);

  // var response = await stub.getAlbums(AlbumRequest());
  // print('Response received: ${response.writeToJson()}');

  // response = await stub.getAlbums(AlbumRequest()..id = 1);
  // print('Response received: ${response.writeToJsonMap()}');

  var response2 = await stub.getALbumsWithPhotos(AlbumRequest()..id = 3);
  print('Got response! $response2');
  print('Got response! ${response2.albums[0]}');
  print('Got response! ${response2.albums[0].writeToJson()}');
  print('Got response! ${response2.albums[0].writeToJsonMap()}');

  await channel.shutdown();
}

<div align=center>
<a href="https://nostracode.com">
<img src="assets/images/nostra_logo.png">
</a>
</div>

<div align=center>
<p style="font-size: 26px; font-weight: bold;">NC Dart GRPC</p>
<p>Dart Project using GRPC</p>
</div>

---

## 📋 Table of Contents

- [Project Setup and Packages](#section_1)
- [Install Proto for Windows](#section_2)
- [Add Data and Protocol Buffers](#section_3)
- [Test The Data Class of the Generated File](#section_4)
- [Define and Generate Remote Procedural Call (RPC) Services](#section_5)
- [Create GRPC Server and Client for Service](#section_6)

## 🏷️ Project Setup and Packages <a name = "section_1"></a>

- Create project dart

  > dart create nc_dart_grpc

- Add dependencies

  ```yaml
  dependencies:
    path: ^1.8.0 # latest version
    protobuf: ^3.1.0 # latest version
    grpc: ^3.2.4 # latest version
  ```

- Install the relevant plugin for the platform we are targeting. In this case Dart. So, Run this command

  > dart pub global activate protoc_plugin

## 🏷️ Install Protoc for Windows <a name = "section_2"></a>

- <p align="justify">Download the specific release of protobuf for Windows. In my case the latest version was protoc-27.2. Remeber to download the asset for win32 or win64. </p> 
   <a href="https://github.com/protocolbuffers/protobuf/releases?source=post_page-----17493528e6a2--------------------------------">
   Click this link to download Releases Protocol Buffers/Protobuf
   </a>
  <br>
  <br>

- <p align="justify">Once the download from step above is done we can extract anywhere we’re comfortable and our system user has permission to read. In my case: C:\src\protoc-27.2-win64</p>
  <br>

- <p align="justify">Now we must add our extract file to our PATH in our system’s environment variables, including the subfolder “bin”. The complete path to add in my case is: “C:\src\protoc-27.2-win64\bin”. Follow these steps below</p>
  Open `Edit the system environment variables`
  <div >
  <img src="assets/images/open_env.png">
  </div>
  <br>

  Click Environment Variables Button on the right button corner
  <div >
  <img src="assets/images/click_env.png">
  </div>
  <br>

  Click Path then click Edit Button
  <div >
  <img src="assets/images/click_path.png">
  </div>
  <br>

  Click `New` Button then add path, in my case is: “C:\src\protoc-27.2-win64\bin”. After that, click `OK`.
  <div >
  <img src="assets/images/add_path.png">
  </div>
  <br>

- <p align="justify">After installing the protoc_plugin [step 1], it’ll add in our user’s folders a “protoc-gen-dart.bat” which we must copy and paste in the same bin folder we added to our path in the previous step. In my case the “protoc-gen-dart.bat” file is located in:

  `C:\Users\<YOUR_USER>\AppData\Local\Pub\Cache\bin`

  The final result must look like this: </p>
  <div>
   <img src="assets/images/final_result.png">
   </div>
   <br>

## 🏷️ Add Data and Protocol Buffers <a name = "section_3"></a>

- Add `src/db.dart` under lib source and this contains the data we're going to be working with. Here's an example

  ```dart
  final albums = [
    {'id': 1, 'title': 'album 1'},
    {'id': 2, 'title': 'album 2'},
    {'id': 3, 'title': 'album 3'},
    {'id': 4, 'title': 'album 4'},
    {'id': 5, 'title': 'album 5'},
  ];

  final photos = [
    {
      'albumId': 1,
      'id': 27,
      'title': 'photo 27',
      'url': 'https://via.placeholder.com/600/b245',
    },
    {
      'albumId': 2,
      'id': 28,
      'title': 'photo 28',
      'url': 'https://via.placeholder.com/600/b245',
    },
    {
      'albumId': 3,
      'id': 29,
      'title': 'photo 29',
      'url': 'https://via.placeholder.com/600/b245',
    },
    {
      'albumId': 4,
      'id': 30,
      'title': 'photo 30',
      'url': 'https://via.placeholder.com/600/b245',
    },
    {
      'albumId': 5,
      'id': 31,
      'title': 'photo 31',
      'url': 'https://via.placeholder.com/600/b245',
    },
  ];
  ```

- Define a structure that represents those data structures we're going to be working with so that brings us to `protos/album.proto`. This is an example of a file that uses protocol buffer syntax.

  ```proto
  syntax = "proto3";
  message Album {
    int32 id = 1;
    string title = 2;
  }

  message Photo {
    int32 albumId = 1;
    int32 id = 2;
    string title = 3;
    string url = 4;
  }
  ```

- Generate dart data classes using protoc compiler. The command we're gonna run is:
  > protoc --dart_out=grpc:lib/src/generated -Iprotos protos/album.proto

## 🏷️ Test The Data Class of the Generated File <a name = "section_4"></a>

- Export our database as well as our generated files in `lib/nc_dart_grpc.dart`
  ```dart
  export 'src/db.dart';
  export 'src/generated/album.pb.dart';
  export 'src/generated/album.pbenum.dart';
  export 'src/generated/album.pbjson.dart';
  ```
- In `bin/nc_dart_grpc.dart`, create an album and then specify the fields and print that out. Here's an example inside that file

  ```dart
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
  ```

- You can run those codes above using `F5` and see the result on Debug Console

## 🏷️ Define and Generate Remote Procedural Call (RPC) Services <a name = "section_5"></a>

- Define our PC Services in our Protocol Buffer File
  ```proto
  service AlbumService {
  rpc getAlbums(AlbumRequest) returns (AlbumResponse) {}
  }
  ```
- Create the messages for album request and album response. Album request will take in an id field and then album response will take in a list of albums and to represent a list in the protocol buffer language, we just need to specify the repeated keyword.

  ```proto
  message AlbumRequest{
  int32 id = 1;
  }

  message AlbumResponse {
    repeated Album albums = 1;
  }
  ```

- Run our compiler again which will generate the relevant service classes for us.
  > protoc --dart_out=grpc:lib/src/generated -Iprotos protos/album.proto

## 🏷️ Create GRPC Server and Client for Service <a name = "section_6"></a>

- Create a `server.dart` file in the bin folder
- In `server.dart`, import the gRPC library then create a class called AlbumService extends AlbumServiceBase which is from the generated file

  ```dart
  import 'package:grpc/src/server/call.dart';
  import 'package:nc_dart_grpc/nc_dart_grpc.dart';

  class AlbumService extends AlbumServiceBase  {
    @override
    Future<AlbumResponse> getAlbums(ServiceCall call, AlbumRequest request) {
      // TODO: implement getAlbums
      throw UnimplementedError();
    }

  }
  ```

- Add new export in `lib/nc_dart_grpc.dart`
  ```dart
  export 'package:nc_dart_grpc/src/generated/album.pbgrpc.dart';
  ```

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
- [Setup Protoc](#section_2)

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

- [reference 2](https://nostracode.com)
- [reference 3](https://nostracode.com)

## 🏷️ Setup Protoc <a name = "section_2"></a>

line break 1<br>
line break 2<br>
line break 3<br>
<br>
command

> flutter doctor

main.dart

```dart
void main() async {
  // todo: uncomment line below to init repo.mock files
  // await Mocks.instance.init();
  await inits();
  runApp(const App());
}
```

//
//  Generated code. Do not modify.
//  source: album.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use albumDescriptor instead')
const Album$json = {
  '1': 'Album',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    {'1': 'title', '3': 2, '4': 1, '5': 9, '10': 'title'},
  ],
};

/// Descriptor for `Album`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List albumDescriptor = $convert.base64Decode(
    'CgVBbGJ1bRIOCgJpZBgBIAEoBVICaWQSFAoFdGl0bGUYAiABKAlSBXRpdGxl');

@$core.Deprecated('Use photoDescriptor instead')
const Photo$json = {
  '1': 'Photo',
  '2': [
    {'1': 'albumId', '3': 1, '4': 1, '5': 5, '10': 'albumId'},
    {'1': 'id', '3': 2, '4': 1, '5': 5, '10': 'id'},
    {'1': 'title', '3': 3, '4': 1, '5': 9, '10': 'title'},
    {'1': 'url', '3': 4, '4': 1, '5': 9, '10': 'url'},
  ],
};

/// Descriptor for `Photo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List photoDescriptor = $convert.base64Decode(
    'CgVQaG90bxIYCgdhbGJ1bUlkGAEgASgFUgdhbGJ1bUlkEg4KAmlkGAIgASgFUgJpZBIUCgV0aX'
    'RsZRgDIAEoCVIFdGl0bGUSEAoDdXJsGAQgASgJUgN1cmw=');

@$core.Deprecated('Use albumRequestDescriptor instead')
const AlbumRequest$json = {
  '1': 'AlbumRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
  ],
};

/// Descriptor for `AlbumRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List albumRequestDescriptor = $convert.base64Decode(
    'CgxBbGJ1bVJlcXVlc3QSDgoCaWQYASABKAVSAmlk');

@$core.Deprecated('Use albumResponseDescriptor instead')
const AlbumResponse$json = {
  '1': 'AlbumResponse',
  '2': [
    {'1': 'albums', '3': 1, '4': 3, '5': 11, '6': '.Album', '10': 'albums'},
  ],
};

/// Descriptor for `AlbumResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List albumResponseDescriptor = $convert.base64Decode(
    'Cg1BbGJ1bVJlc3BvbnNlEh4KBmFsYnVtcxgBIAMoCzIGLkFsYnVtUgZhbGJ1bXM=');


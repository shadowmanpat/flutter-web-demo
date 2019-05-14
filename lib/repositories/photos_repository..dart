import 'package:built_collection/built_collection.dart';
import 'package:flutter_web/material.dart';
import 'package:flutter_web_demo/models/models.dart';
import 'package:flutter_web_demo/networking/photo_error.dart';
import 'package:flutter_web_demo/networking/photos_provider.dart';

class PhotoRepository {
  final PhotoProvider _photoProvider;

  PhotoRepository(
    this._photoProvider,
  ) : super();

  Future<BuiltList<Photo>> fetchPhotos({
    @required String page,
  }) async {
    try {
      final questionnaires = await _photoProvider.fetchPhotos(
        page: page,
      );
      return questionnaires;
    } on PhotoError catch (error) {
      throw ('Cannot fetch photos: \n${error.message}');
    }
  }

  Future<Photo> fetchQuestionnaire({
    @required String photoId,
    @required int width,
    @required int height,
  }) async {
    try {
      final questionnaire = _photoProvider.fetchPhoto(
        photoId: photoId,
        width: width,
        height: height,
      );
      return questionnaire;
    } on PhotoError catch (error) {
      throw ('Cannot fetch photo with id: \n${error.message}');
    }
  }
}
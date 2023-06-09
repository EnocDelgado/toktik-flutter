


import 'package:toktik/domain/datasource/video_post_datasource.dart';
import 'package:toktik/domain/entities/video_post.dart';

import '../../shared/data/local_video_posts.dart';
import '../models/local_video_model.dart';

class LocalVideoDatasource implements VideoPostDatasource {

  @override
  Future<List<VideoPost>> getFavorieVideosByUser(String userId) {

    throw UnimplementedError();
  }

  // Local videos implementations
  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) async {
    
    await Future.delayed( const Duration(seconds: 2) );

    final List<VideoPost> newVideos = videoPosts.map( 
      (video) => LocalVideoModel.fromJsonMap( video ).toVideoPost() 
    ).toList();

    return newVideos;
  }
} 
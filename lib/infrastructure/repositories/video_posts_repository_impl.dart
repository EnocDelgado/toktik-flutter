

import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/domain/repositories/video_posts_repository.dart';

import '../../domain/datasource/video_post_datasource.dart';

class VideoPostsRepositoryImpl implements VideoPostRepository {

  // data main origin
  final VideoPostDatasource videosDatasource;

  // Any video data post it's allow
  VideoPostsRepositoryImpl({
    required this.videosDatasource
  });

  @override
  Future<List<VideoPost>> getFavorieVideosByUser(String userId) {
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTrendingVideosByPage(int page) {
    return videosDatasource.getTrendingVideosByPage( page );
  }



}
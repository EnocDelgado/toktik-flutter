

import 'package:toktik/domain/entities/video_post.dart';


// Repository going to call datasource
abstract class VideoPostRepository {


  Future<List<VideoPost>> getFavorieVideosByUser( String userId );

  Future<List<VideoPost>> getTrendingVideosByPage( int page );
}
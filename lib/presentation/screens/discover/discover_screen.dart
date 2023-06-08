import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toktik/presentation/providers/discover_providers.dart';
import 'package:toktik/presentation/widgets/shared/video_scrollable_view.dart';

// Allow that
class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {

    // be pending of all changes
    final discoverProvider = context.watch<DiscoverProvider>();


    return Scaffold(
      body:  discoverProvider.initialLoading
        ? const Center(child:  CircularProgressIndicator( strokeWidth: 2 ) )
        : VideoScrollableView( videos: discoverProvider.videos),
      );
  }
}
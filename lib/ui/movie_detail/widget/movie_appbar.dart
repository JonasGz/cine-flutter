import 'package:cinebox/ui/core/themes/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieAppBar extends ConsumerStatefulWidget {
  const MovieAppBar({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MovieAppBarState();
}

class _MovieAppBarState extends ConsumerState<MovieAppBar> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.white,

      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.zero,
        title: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              bottom: 20,
              child: Text(
                'Detalhe',
                textAlign: TextAlign.center,
                style: AppTextStyles.semiBoldMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

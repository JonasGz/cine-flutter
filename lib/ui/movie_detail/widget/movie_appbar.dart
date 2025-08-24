import 'package:cinebox/ui/core/themes/colors.dart';
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
      expandedHeight: MediaQuery.sizeOf(context).height * 0.1,
      backgroundColor: Colors.white,

      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.zero,
        title: Stack(
          children: [
            Positioned(
              left: 4,
              bottom: 4,
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: AppColors.darkGrey,
                  size: 22,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 20,
              child: Text(
                'Detalhe',
                textAlign: TextAlign.center,
                style: AppTextStyles.regularSmall,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

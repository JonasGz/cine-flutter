import 'dart:async';

import 'package:cinebox/data/core/providers/movies_providers.dart';
import 'package:cinebox/ui/core/themes/resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MoviesAppBar extends ConsumerStatefulWidget {
  const MoviesAppBar({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MoviesAppBarState();
}

class _MoviesAppBarState extends ConsumerState<MoviesAppBar> {
  final TextEditingController _controller = TextEditingController();

  Timer? _debounce;
  void onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      ref.read(searchQueryProvider.notifier).state = query;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: MediaQuery.sizeOf(context).height * 0.25,
      foregroundColor: Colors.black,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.asset(
          R.BG_HOME,
          fit: BoxFit.cover,
        ),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: SizedBox(
            height: 42,
            child: TextFormField(
              controller: _controller,
              style: TextStyle(
                color: Colors.grey[600],
                fontWeight: FontWeight.w400,
                fontSize: 12,
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 0,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide.none,
                ),
                hintText: 'Procurar Item',
                hintStyle: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey[600],
                ),
                prefixIconConstraints: const BoxConstraints(
                  minWidth: 0,
                  minHeight: 0,
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Icon(
                    Icons.search,
                    color: Colors.grey[600],
                    size: 15,
                  ),
                ),
              ),
              onChanged: (value) {
                onSearchChanged(value);
              },
            ),
          ),
        ),
      ),
    );
  }
}

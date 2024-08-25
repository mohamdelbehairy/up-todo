import 'package:flutter/material.dart';
import 'package:up_todo/core/widgets/build_view.dart';
import '../widgets/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return const BuildView(child: SearchViewBody());
  }
}


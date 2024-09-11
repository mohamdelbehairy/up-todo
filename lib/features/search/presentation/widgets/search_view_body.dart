import 'package:flutter/material.dart';
import 'package:up_todo/core/utils/styles.dart';
import 'package:up_todo/core/widgets/custom_app_bar.dart';
import '../../../../core/models/app_bar_model.dart';
import '../../../../core/utils/function/show_clear_recent_search_dialog.dart';
import 'recent_and_no_recent_search.dart';
import 'search_view_text_field.dart';
import 'show_search_result.dart';

class SearchViewBody extends StatefulWidget {
  const SearchViewBody({super.key});

  @override
  State<SearchViewBody> createState() => _SearchViewBodyState();
}

class _SearchViewBodyState extends State<SearchViewBody> {
  late TextEditingController _controller;
  @override
  void initState() {
    _controller = TextEditingController();
    _controller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24),
          CustomAppBar(
              appBarModel: AppBarModel(
                  title: 'Notes',
                  onTap: () {
                    showAllClearRecentSearchDialog(context);
                  })),
          const SizedBox(height: 16),
          SearchViewTextField(controller: _controller),
          const SizedBox(height: 24),
          Text('Recent Searches', style: Styles.styleRegular17),
          const SizedBox(height: 16),
          const ShowSearchResult(),
          if (_controller.text.isEmpty) const RecentAndNoRecentSearch(),
        ],
      ),
    );
  }
}

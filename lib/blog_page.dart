import 'package:flutter/material.dart';
import 'package:widgets/reuse_widgets.dart';

class BlogPage extends StatefulWidget {
  const BlogPage({Key? key}) : super(key: key);

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleText(context, 'Blogs'),
        Center(child: ComingSoon(context),),
      ],
    );
  }
}

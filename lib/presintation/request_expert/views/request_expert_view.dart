import 'package:flutter/material.dart';

import '../widgets/app_bar_icons.dart';

class RequestExpertView extends StatelessWidget {
  const RequestExpertView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Request an expert"),
        leading: BackIcon(),
        // leadingWidth: 40,
      ),
      body: Column(),
    );
  }
}

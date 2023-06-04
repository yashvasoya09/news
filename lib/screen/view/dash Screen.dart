import 'package:flutter/material.dart';
import 'package:news/screen/provider/news%20provider.dart';
import 'package:provider/provider.dart';

class dashScreen extends StatefulWidget {
  const dashScreen({Key? key}) : super(key: key);

  @override
  State<dashScreen> createState() => _dashScreenState();
}

class _dashScreenState extends State<dashScreen> {
  void initState() {
    super.initState();
    Provider.of<newsProvider>(context, listen: false).loadnews();
  }

  newsProvider? providerT;
  newsProvider? providerF;
  @override
  Widget build(BuildContext context) {
    providerT = Provider.of<newsProvider>(context, listen: true);
    providerF = Provider.of<newsProvider>(context, listen: false);
    int? index = ModalRoute.of(context)!.settings.arguments as int?;
    return Column(
      children: [
        Container(
          height: 250,
            width: 250,
            child: Image.network('${providerT!.data!.articles![index!].urlToImage}'))
      ],
    );
  }
}

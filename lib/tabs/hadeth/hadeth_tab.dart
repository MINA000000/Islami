import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/tabs/hadeth/hadeth.dart';
import 'package:islami/tabs/hadeth/hadeth_content_screen.dart';
import 'package:islami/tabs/quran/surah_content_screen.dart';
import 'package:islami/widgets/load_indicator.dart';

class HadethTab extends StatefulWidget {
  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<Hadeth> ahadethResult = [];

  @override
  Widget build(BuildContext context) {
    if (ahadethResult.isEmpty) ahadethLoad();
    return SafeArea(
      child: Center(
        child: Column(
          children: [
            Image.asset('assets/images/hadith_header.png'),
            Expanded(
              child: (ahadethResult.isEmpty)
                  ? LoadIndicator()
                  : ListView.separated(
                      itemBuilder: (context, index) => GestureDetector(
                            onTap: () => Navigator.of(context).pushNamed(
                                HadethContentScreen.routeName,
                                arguments: Hadeth(
                                    content: ahadethResult[index].content,
                                    title: ahadethResult[index].title)),
                            child: Text(
                              ahadethResult[index].title,
                              style: Theme.of(context).textTheme.headlineSmall,
                              textAlign: TextAlign.center,
                            ),
                          ),
                      separatorBuilder: (context, index) => SizedBox(
                            height: 12,
                          ),
                      itemCount: ahadethResult.length),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> ahadethLoad() async {
    String ahadethFile =
        await rootBundle.loadString('assets/surah/ahadeth.txt');
    print(ahadethFile);
    List<String> ahadeth = ahadethFile.split('#');
    ahadethResult = ahadeth.map((e) {
      List<String> hadethAll = e.trim().split('\n');
      String title = hadethAll[0];
      hadethAll.removeAt(0);
      List<String> content = hadethAll;
      return Hadeth(content: content, title: title);
    }).toList();
    print(ahadethResult);
    setState(() {});
  }
}

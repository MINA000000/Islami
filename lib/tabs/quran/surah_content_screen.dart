import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/tabs/quran/quran_tab.dart';
import 'package:islami/tabs/setting/setting_provider.dart';
import 'package:islami/widgets/load_indicator.dart';
import 'package:provider/provider.dart';

class SurahContentScreen extends StatefulWidget {
  static const routeName = '/surah-content-screen';

  @override
  State<SurahContentScreen> createState() => _SurahContentScreenState();
}

class _SurahContentScreenState extends State<SurahContentScreen> {
  List<String> ayat = [];

  late SurahDetailed args;

  @override
  Widget build(BuildContext context) {
    SettingProvider settingProvider = Provider.of<SettingProvider>(context);
    args = ModalRoute.of(context)!.settings.arguments as SurahDetailed;
    if (ayat.isEmpty) {
      loadSurah();
    }
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/${settingProvider.backGroundImage}'), fit: BoxFit.fill),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text('إسلامي'),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Container(
          width: MediaQuery.of(context).size.width * .8,
          margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.height * .05,
              vertical: MediaQuery.of(context).size.width * .15),
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * .05),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Center(
                      child: Text(
                        'سورة ${args.surahName}',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ),
                  ),
                  Image(
                    image:
                        AssetImage('assets/images/iconawesome_play_circle.png'),
                  ),
                ],
              ),
              Divider(
                thickness: 1,
                color: AppTheme.PrimaryLight,
              ),
              Expanded(
                child: (ayat.isEmpty)
                    ? LoadIndicator()
                    : ListView.builder(
                        itemBuilder: (context, index) => Text(
                          ayat[index],
                          style: Theme.of(context).textTheme.titleLarge,
                          textAlign: TextAlign.center,
                        ),
                        itemCount: ayat.length,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void loadSurah() async {
    // await Future.delayed(Duration(milliseconds: 500));
    String surahContent =
        await rootBundle.loadString('assets/surah/${args.index + 1}.txt');
    ayat = surahContent.split('\r\n');
    // print(ayat);
    setState(() {});
  }
}

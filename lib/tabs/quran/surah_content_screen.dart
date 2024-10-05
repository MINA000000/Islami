import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/tabs/quran/quran_tab.dart';

class SurahContentScreen extends StatelessWidget {
  static const routeName = '/surah-content-screen';
  late SurahDetailed args;
  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context)!.settings.arguments as SurahDetailed;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/bg3.png'), fit: BoxFit.fill),
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
            color: Colors.white.withOpacity(.7),
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
            ],
          ),
        ),
      ),
    );
  }
}
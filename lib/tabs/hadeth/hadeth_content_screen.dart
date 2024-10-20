import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/tabs/hadeth/hadeth.dart';
import 'package:islami/tabs/setting/setting_provider.dart';
import 'package:provider/provider.dart';

class HadethContentScreen extends StatelessWidget {
  static const routeName = '/hadeth-screen';
  late Hadeth hadeth;
  @override
  Widget build(BuildContext context) {
    SettingProvider settingProvider = Provider.of<SettingProvider>(context);
    hadeth = ModalRoute.of(context)!.settings.arguments as Hadeth;
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
              Text(
                hadeth.title,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Divider(
                thickness: 1,
                color: AppTheme.PrimaryLight,
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) => Text(
                    hadeth.content[index],
                    style: Theme.of(context).textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  ),
                  itemCount: hadeth.content.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
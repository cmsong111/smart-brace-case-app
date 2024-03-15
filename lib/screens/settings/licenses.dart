import 'package:flutter/material.dart';

import '../../../../oss_licenses.dart';

class LicensesListPage extends StatelessWidget {
  const LicensesListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Licenses'),
      ),
      body: ListView.builder(
        itemCount: ossLicenses.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(ossLicenses[index].name),
            subtitle: Text(ossLicenses[index].version),
            onTap: () {
              showLicensePage(
                context: context,
                applicationName: ossLicenses[index].name,
                applicationVersion: ossLicenses[index].version,
                applicationIcon: const FlutterLogo(size: 100),
                applicationLegalese: ossLicenses[index].license,
              );
            },
          );
        },
      ),
    );
  }
}

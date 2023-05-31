import 'package:elison/apiServices/profile_tab_service.dart';
import 'package:elison/models/cms_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_html/flutter_html.dart';

import 'package:url_launcher/url_launcher.dart';

import '../Components/shimmer/PrivacyPolicyShimmer.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          "Privacy Policy",
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: ProfileTabService().customerCms(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<CmsModel> data = snapshot.data as List<CmsModel>;
              if (data.isNotEmpty) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: data
                        .map(
                          (e) => Html(
                            data: e.data[0].privacyPolicy!,
                            onLinkTap:
                                (url, context, attributes, element) async {
                              if (!await launchUrl(Uri.parse(url!))) {
                                throw 'Could not launch url';
                              }
                            },
                            shrinkWrap: true,
                          ),
                        )
                        .toList(),
                  ),
                );
              } else {
                return const Center(child: Text('No data Found'));
              }
            } else {
              return const Center(
                child: CoachPrivacyPolicyShimmer(),
              );
            }
          },
        ),
      ),
    );
  }
}

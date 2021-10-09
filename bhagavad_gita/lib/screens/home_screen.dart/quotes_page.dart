import 'dart:math';
import 'package:bhagavad_gita/Constant/app_colors.dart';
import 'package:bhagavad_gita/Constant/app_size_config.dart';
import 'package:bhagavad_gita/Constant/quotes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_share/flutter_share.dart';

class QuotesScreen extends StatefulWidget {
  @override
  _QuotesScreenState createState() => _QuotesScreenState();
}

class _QuotesScreenState extends State<QuotesScreen> {
  String quote = "";
  final PageController controller = PageController();
  @override
  void initState() {
    super.initState();
    getQuote();
  }

  getQuote() {
    final random = Random();
    var result = quotesList[random.nextInt(quotesList.length)];
    setState(() {
      quote = result;
    });
  }

  Future<void> share() async {
    await FlutterShare.share(
      title: quote,
      text: quote,
      linkUrl: "https://bhagavadgita.graphcdn.app/",
    );
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/image_gitaFrontQuotes.png"),
              fit: BoxFit.cover),
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      "assets/images/black full.png",
                    ),
                    fit: BoxFit.cover),
              ),
            ),
            Positioned(
              top: width / kDefaultPadding * 4,
              right: width / kDefaultPadding,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () async {
                    print('Shear Quote');
                    share();
                  },
                  child: Container(
                    child:
                        SvgPicture.asset("assets/icons/icon_shareQuotes.svg"),
                  ),
                ),
              ),
            ),
            Positioned(
              top: height / kPadding * 2.2,
              left: width / kPadding * 0.5,
              child: Container(
                child: SvgPicture.asset("assets/icons/icon_Quote.svg"),
              ),
            ),
            Positioned(
              top: height / kPadding * 2.8,
              left: width / kPadding * 0.5,
              child: Container(
                width: 340,
                child: Text(
                  quote,
                  textAlign: TextAlign.left,
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1!
                      .copyWith(color: whiteColor, fontWeight: FontWeight.w500,height: 1.7),
                ),
              ),
            ),
            Positioned(
              bottom: kDefaultPadding,
              left: kDefaultPadding,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    getQuote();
                  },
                  child: Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                      color: whiteColor,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: textLightGreyColor,
                          blurRadius: 10,
                        )
                      ],
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        "assets/icons/icon_slider_verse.svg",
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: kDefaultPadding,
              right: kDefaultPadding,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    getQuote();
                  },
                  child: Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                      color: whiteColor,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: textLightGreyColor,
                          blurRadius: 10,
                        )
                      ],
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        "assets/icons/Icon_slider_verseNext.svg",
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

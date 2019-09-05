/*
 * © 2019 The Johns Hopkins University Applied Physics Laboratory LLC.  All Rights Reserved.
 */

import 'package:flutter/material.dart';

import 'main.dart';
import 'locale/locales.dart';

class Notice extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NoticeState();
}

class _NoticeState extends State<Notice> {

  Widget _buildNotice(context) {
    return Column(
      children: <Widget>[
        Text(
          AppLocalizations.of(context).mainTitle,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(8.0, 24.0, 8.0, 8.0),
          child: Text(
            AppLocalizations.of(context).noticeText1,
            style: TextStyle(
              fontWeight: FontWeight.bold
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            AppLocalizations.of(context).noticeText2
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: RichText(
              text: TextSpan(
                style: TextStyle(
                  color: Colors.black,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: AppLocalizations.of(context).importantLabel + " ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold
                    )
                  ),
                  TextSpan(text: AppLocalizations.of(context).noticeText3),
                  TextSpan(
                    text: AppLocalizations.of(context).estimateWord,
                    style: TextStyle(
                      fontWeight: FontWeight.bold
                    )
                  ),
                  TextSpan(text: AppLocalizations.of(context).noticeText4)
                ]
              )
          )
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(AppLocalizations.of(context).noticeText5),
        ),
        RaisedButton(
          child: Text(
            AppLocalizations.of(context).confirmLabel
          ),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => Home()
              )
            );
          },
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            AppLocalizations.of(context).appTitle
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildNotice(context)
          ],
        )
      )
    );
  }
}
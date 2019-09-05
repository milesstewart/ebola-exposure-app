/*
 * © 2019 The Johns Hopkins University Applied Physics Laboratory LLC.  All Rights Reserved.
 */

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

import 'notice.dart';
import 'symptoms.dart';
import 'death.dart';

import 'package:ebola_calculator/locale/locales.dart';

void main() => runApp(EbolaExposureCalc());

class EbolaExposureCalc extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en'), // English
        const Locale('fr'), // French
      ],
      onGenerateTitle: (context) => AppLocalizations.of(context).appTitle,
      onGenerateRoute: (settings) {
        print(settings);
      },
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: Notice()
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context).appTitle
        )
      ),
      body: FormKeyboardActions(
        child: HomePage(),
      )
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final FocusNode _nodeText1 = FocusNode();
  final FocusNode _nodeText2 = FocusNode();

  int _minIncubationPeriod = 4;
  int _maxIncubationPeriod = 17;

  bool _editIncubation = false;

  TextEditingController _minIncubationPeriodController;
  TextEditingController _maxIncubationPeriodController;

  Widget _buildHeader(context) {
    return Container(
      margin: EdgeInsets.all(16.0),
      child: Text(
        AppLocalizations.of(context).mainTitle,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold
        )
      )
    );
  }

  Widget _buildCalculatorSelect(context) {
    ThemeData theme = Theme.of(context);

    return Column(
      children: <Widget>[
        Row(
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.only(right: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      AppLocalizations.of(context).calcSymptomsChoice,
                      style: theme.textTheme.body2
                    ),
                  ],
                )
              )
            ),
            Column(
              children: [
                RaisedButton(
                  child: Text(
                    AppLocalizations.of(context).openLabel
                  ),
                  onPressed: () {
                    _nodeText1.unfocus();
                    _nodeText2.unfocus();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SymptomsCalculator(
                          minIncubationPeriod: _minIncubationPeriod,
                          maxIncubationPeriod: _maxIncubationPeriod
                        )
                      )
                    );
                  }
                )
              ],
            )
          ],
        ),
        Padding(
            padding: EdgeInsets.all(8.0)
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.only(right: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      AppLocalizations.of(context).calcDeathChoice,
                      style: theme.textTheme.body2
                    ),
                  ],
                )
              )
            ),
            Column(
              children: [
                RaisedButton(
                  child: Text(
                    AppLocalizations.of(context).openLabel
                  ),
                  onPressed: () {
                    _nodeText1.unfocus();
                    _nodeText2.unfocus();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DeathCalculator(
                          minIncubationPeriod: _minIncubationPeriod,
                          maxIncubationPeriod: _maxIncubationPeriod
                        )
                      )
                    );
                  }
                )
              ],
            )
          ],
        )
      ],
    );
  }

  Widget _buildIncubationPeriod(context) {
    ThemeData theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.only(top: 60.0),
      child: Column(
        children: <Widget>[
          Text(
            AppLocalizations.of(context).incubationPeriodTitle,
            style: TextStyle(
              fontWeight: FontWeight.bold
            )),
          Padding(
            padding: EdgeInsets.all(8.0),
          ),
          Text(
            AppLocalizations.of(context).incubationPeriodDesc
          ),
          Padding(
            padding: EdgeInsets.all(4.0),
          ),
          Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Spacer(
                    flex: 3
                  ),
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        AppLocalizations.of(context).minLabel,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: _editIncubation ? theme.textTheme.body1.color : theme.disabledColor,
                        )
                      )
                    )
                  ),
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.only(left: 16.0),
                      child: TextField(
                        enabled: _editIncubation,
                        focusNode: _nodeText1,
                        keyboardType: TextInputType.number,
                        controller: _minIncubationPeriodController,
                        onChanged: (text) => _minIncubationPeriod = int.parse(text),
                        style: TextStyle(
                          color: _editIncubation ? Colors.teal : theme.disabledColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0
                        )
                      )
                    )
                  ),
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Text(
                        AppLocalizations.of(context).daysLabel,
                        style: TextStyle(
                          color: _editIncubation ? theme.textTheme.body1.color : theme.disabledColor,
                        )
                      )
                    )
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Spacer(
                    flex: 3
                  ),
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        AppLocalizations.of(context).maxLabel,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: _editIncubation ? theme.textTheme.body1.color : theme.disabledColor,
                        )
                      )
                    )
                  ),
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.only(left: 16.0),
                      child: TextField(
                        enabled: _editIncubation,
                        focusNode: _nodeText2,
                        keyboardType: TextInputType.number,
                        controller: _maxIncubationPeriodController,
                        onChanged: (text) => _maxIncubationPeriod = int.parse(text),
                        style: TextStyle(
                          color: _editIncubation ? Colors.teal : theme.disabledColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0
                        )
                      )
                    )
                  ),
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Text(
                        AppLocalizations.of(context).daysLabel,
                        style: TextStyle(
                          color: _editIncubation ? theme.textTheme.body1.color : theme.disabledColor,
                        )
                      )
                    )
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.all(12.0),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    child: Text(
                      AppLocalizations.of(context).editLabel
                    ),
                    onPressed: () {
                      setState(() {
                        _editIncubation = !_editIncubation;
                      });
                    }
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                  ),
                  RaisedButton(
                    child: Text(
                      AppLocalizations.of(context).resetLabel
                    ),
                    onPressed: () {
                      setState(() {
                        _minIncubationPeriod = 4;
                        _minIncubationPeriodController.text = "4";
                        _maxIncubationPeriod = 17;
                        _maxIncubationPeriodController.text = "17";
                      });
                    }
                  ),
                ],
              )
            ],
          ),
        ]
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _minIncubationPeriodController = TextEditingController(
        text: _minIncubationPeriod.toString()
    );
    _maxIncubationPeriodController = TextEditingController(
        text: _maxIncubationPeriod.toString()
    );

    FormKeyboardActions.setKeyboardActions(
      context,
      KeyboardActionsConfig(
        keyboardActionsPlatform: KeyboardActionsPlatform.ALL,
        keyboardBarColor: Colors.grey[200],
        nextFocus: false,
        actions: [
          KeyboardAction(
            focusNode: _nodeText1,
          ),
          KeyboardAction(
            focusNode: _nodeText2
          )
        ],
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          _buildHeader(context),
          _buildCalculatorSelect(context),
          _buildIncubationPeriod(context)
        ]
      )
    );
  }
}
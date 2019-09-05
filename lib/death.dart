/*
 * © 2019 The Johns Hopkins University Applied Physics Laboratory LLC.  All Rights Reserved.
 */

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

import 'package:ebola_calculator/locale/locales.dart';

class DeathCalculator extends StatelessWidget {

  final int minIncubationPeriod;
  final int maxIncubationPeriod;

  const DeathCalculator({
    this.minIncubationPeriod = 4,
    this.maxIncubationPeriod = 17
  }): super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context).deathDateTitle
        ),
      ),
      body: FormKeyboardActions(
        child: DeathCalculatorPage(
          minIncubationPeriod: minIncubationPeriod,
          maxIncubationPeriod: maxIncubationPeriod,
        ),
      )
    );
  }
}

class DeathCalculatorPage extends StatefulWidget {

  final int minIncubationPeriod;
  final int maxIncubationPeriod;

  const DeathCalculatorPage({
    this.minIncubationPeriod = 4,
    this.maxIncubationPeriod = 17
  }): super();

  @override
  State<StatefulWidget> createState() => _DeathCalculatorState();
}

class _DeathCalculatorState extends State<DeathCalculatorPage> {
  final FocusNode _nodeText1 = FocusNode();

  static DateFormat _dateYearFormat = DateFormat("EEE d-MMM-yyyy");
  static DateFormat _dateNoYearFormat = DateFormat("EEE d-MMM");

  DateTime _dateTime = DateTime.now();
  String _date = _dateYearFormat.format(new DateTime.now());

  TextEditingController _daysSymptomDeathController = TextEditingController();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: _dateTime,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101),
        builder: (context, child) {
          return SingleChildScrollView(
              child: child
          );
        }
    );

    if (picked != null && picked != _dateTime) {
      setState(() {
        _date = DateFormat("EEE d-MMM-yyyy").format(picked);
        _dateTime = picked;
      });
    }
  }

  Widget _buildEstimate() {
    DateTime estDateTime = _dateTime;

    if (_daysSymptomDeathController.text.length > 0) {
      estDateTime = estDateTime.subtract(Duration(
          days: int.parse(_daysSymptomDeathController.text)
      ));
    } else {
      estDateTime = estDateTime.subtract(Duration(
          days: 10
      ));
    }

    Column result = Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 16.0),
            child: Text(
              AppLocalizations.of(context).symptomsStartLabel +
                  " " + _dateYearFormat.format(estDateTime),
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.red
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 14.0),
            child: Text(
              AppLocalizations.of(context).exposureDatesTitle,
              style: TextStyle(
                fontSize: 22.0,
                color: Colors.red,
                fontWeight: FontWeight.bold
              )
            ),
          )
        ]
    );

    estDateTime = estDateTime.subtract(Duration(
        days: widget.maxIncubationPeriod
    ));

    String startDate = _dateNoYearFormat.format(estDateTime);

    estDateTime = estDateTime.add(Duration(
        days: widget.maxIncubationPeriod - widget.minIncubationPeriod
    ));

    String endDate = _dateNoYearFormat.format(estDateTime);

    result.children.add(
      Text(
        "$startDate -- $endDate",
        style: TextStyle(
            fontSize: 22.0,
            color: Colors.red,
            fontWeight: FontWeight.bold
        )
      )
    );

    return Padding(
      padding: EdgeInsets.only(top: 36.0),
      child: result,
    );
  }

  Widget _buildHeader(context) {
    ThemeData theme = Theme.of(context);
    return Container(
        margin: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              AppLocalizations.of(context).mainTitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold
              )
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                  AppLocalizations.of(context).deathDateSubtitle,
                  style: theme.textTheme.subtitle
              ),
            )
          ],
        )
    );
  }

  Widget _buildForm() {
    int min = widget.minIncubationPeriod;
    int max = widget.maxIncubationPeriod;

    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              flex: 6,
              child: Padding(
                padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
                child: Text(
                  AppLocalizations.of(context).incubationPeriodLabel,
                  textAlign: TextAlign.end
                )
              )
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: EdgeInsets.fromLTRB(4.0, 8.0, 16.0, 8.0),
                child: Text(
                  "$min-$max " + AppLocalizations.of(context).daysLabel
                )
              )
            )
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
              flex: 6,
              child: Padding(
                padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
                child: Text(
                  AppLocalizations.of(context).deathDateLabel,
                  textAlign: TextAlign.end
                )
              )
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: EdgeInsets.fromLTRB(4.0, 8.0, 16.0, 8.0),
                child: InkWell(
                  child: Text(
                    "$_date",
                    style: TextStyle(
                      color: Colors.teal,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0
                    ),
                  ),
                  onTap: () => _selectDate(context),
                )
              ),
            )
          ],
        ),
        Row(
          children: <Widget>[
            Expanded(
              flex: 6,
              child: Padding(
                padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
                child: Text(
                  AppLocalizations.of(context).deathDateSymptomsOnset,
                  textAlign: TextAlign.end
                )
              ),
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: EdgeInsets.fromLTRB(4.0, 24.0, 16.0, 8.0),
                child: TextField(
                  focusNode: _nodeText1,
                  keyboardType: TextInputType.number,
                  controller: _daysSymptomDeathController,
                  style: TextStyle(
                    color: Colors.teal,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0
                  ),
                )
              )
            )
          ],
        )
      ],
    );
  }

  @override
  void dispose() {
    _daysSymptomDeathController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _daysSymptomDeathController.text = "10";

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
          ],
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          _buildHeader(context),
          _buildForm(),
          _buildEstimate()
        ],
      )
    );
  }
}
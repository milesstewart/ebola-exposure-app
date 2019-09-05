/*
 * © 2019 The Johns Hopkins University Applied Physics Laboratory LLC.  All Rights Reserved.
 */

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

import 'package:ebola_calculator/locale/locales.dart';

class SymptomsCalculator extends StatelessWidget {

  final int minIncubationPeriod;
  final int maxIncubationPeriod;

  const SymptomsCalculator({
    this.minIncubationPeriod = 4,
    this.maxIncubationPeriod = 17
  }): super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context).symptomsOnsetTitle
        ),
      ),
      body: FormKeyboardActions(
        child: SymptomsCalculatorPage(
          minIncubationPeriod: minIncubationPeriod,
          maxIncubationPeriod: maxIncubationPeriod,
        ),
      )
    );
  }
}

class SymptomsCalculatorPage extends StatefulWidget {

  final int minIncubationPeriod;
  final int maxIncubationPeriod;

  const SymptomsCalculatorPage({
    this.minIncubationPeriod = 4,
    this.maxIncubationPeriod = 17
  }): super();

  @override
  State<StatefulWidget> createState() => _SymptomsCalculatorState();
}

class _SymptomsCalculatorState extends State<SymptomsCalculatorPage> {
  final FocusNode _nodeText1 = FocusNode();
  final FocusNode _nodeText2 = FocusNode();

  static DateFormat _dateYearFormat = DateFormat("EEE d-MMM-yyyy");
  static DateFormat _dateNoYearFormat = DateFormat("EEE d-MMM");

  DateTime _dateTime = DateTime.now();
  String _date = _dateYearFormat.format(DateTime.now());
  bool _wasBleeding = false;
  bool _hadDiarrhea = false;

  TextEditingController _daysBleedingController = TextEditingController();
  TextEditingController _daysDiarrheaController = TextEditingController();

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

    if (_wasBleeding) {
      if (_daysBleedingController.text.length != 0) {
        estDateTime = estDateTime.subtract(Duration(
            days: int.parse(_daysBleedingController.text)
        ));
      }
    } else if (_hadDiarrhea) {
      if (_daysDiarrheaController.text.length != 0) {
        estDateTime = estDateTime.subtract(Duration(
            days: int.parse(_daysDiarrheaController.text)
        ));
      }
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

  ValueChanged<bool> _wasBleedingOnChanged() {
    return _hadDiarrhea ? null : (value) {
      setState(() {
        _wasBleeding = value;
      });
    };
  }

  ValueChanged<bool> _hadDiarrheaOnChanged() {
    return _wasBleeding ? null : (value) {
      setState(() {
        _hadDiarrhea = value;
      });
    };
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
                  AppLocalizations.of(context).symptomOnsetSubtitle,
                  style: theme.textTheme.subtitle
              ),
            )
          ],
        )
    );
  }

  Widget _buildForm(context) {
    ThemeData theme = Theme.of(context);

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
                  textAlign: TextAlign.end,
                )
              ),
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: EdgeInsets.fromLTRB(4.0, 8.0, 16.0, 8.0),
                child: Text(
                    "$min-$max " + AppLocalizations.of(context).daysLabel
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
                padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
                child: Text(
                  AppLocalizations.of(context).symptomsStartLabel,
                  textAlign: TextAlign.end
                )
              ),
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
                padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
                child: Text(
                  AppLocalizations.of(context).symptomsOnsetBleeding,
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    color: !_hadDiarrhea ? theme.textTheme.body1.color : theme.disabledColor,
                  )
                )
              ),
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: EdgeInsets.fromLTRB(4.0, 8.0, 16.0, 8.0),
                child: Checkbox(
                  value: _wasBleeding,
                  onChanged: _wasBleedingOnChanged()
                )
              )
            )
          ],
        ),
        Visibility(
          visible: _wasBleeding,
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 6,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
                  child: Text(
                    AppLocalizations.of(context).symptomsOnsetBleedingDays,
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      color: _wasBleeding ? theme.textTheme.body1.color : theme.disabledColor
                    ),
                  )
                ),
              ),
              Expanded(
                flex: 4,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(4.0, 16.0, 16.0, 8.0),
                  child: TextField(
                    enabled: _wasBleeding,
                    focusNode: _nodeText1,
                    keyboardType: TextInputType.number,
                    controller: _daysBleedingController,
                    style: TextStyle(
                      color: _wasBleeding ? Colors.teal : theme.disabledColor,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold
                    )
                  )
                )
              )
            ]
          ),
        ),
        Row(
          children: <Widget>[
            Expanded(
              flex: 6,
              child: Padding(
                padding: EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
                child: Text(
                  AppLocalizations.of(context).symptomsOnsetDiarrhea,
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    color: !_wasBleeding ? theme.textTheme.body1.color : theme.disabledColor,
                  )
                )
              )
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: EdgeInsets.fromLTRB(4.0, 8.0, 16.0, 8.0),
                child: Checkbox(
                  value: _hadDiarrhea,
                  onChanged: _hadDiarrheaOnChanged()
                )
              )
            )
          ],
        ),
        Visibility(
          visible: _hadDiarrhea,
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 6,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
                  child: Text(
                    AppLocalizations.of(context).symptomsOnsetDiarrheaDays,
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      color: _hadDiarrhea ? theme.textTheme.body1.color : theme.disabledColor
                    ),
                  )
                )
              ),
              Expanded(
                flex: 4,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(4.0, 16.0, 16.0, 8.0),
                  child: TextField(
                    enabled: _hadDiarrhea,
                    focusNode: _nodeText2,
                    keyboardType: TextInputType.number,
                    controller: _daysDiarrheaController,
                    style: TextStyle(
                      color: _hadDiarrhea ? Colors.teal : theme.disabledColor,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold
                    )
                  )
                )
              )
            ],
          ),
        )
      ]
    );
  }

  @override
  void dispose() {
    _daysBleedingController.dispose();
    _daysDiarrheaController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _daysBleedingController.text = "7";
    _daysDiarrheaController.text = "4";

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
          _buildForm(context),
          _buildEstimate()
        ],
      )
    );
  }
}


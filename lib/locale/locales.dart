/*
 * © 2019 The Johns Hopkins University Applied Physics Laboratory LLC.  All Rights Reserved.
 */

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';

import 'package:ebola_calculator/l10n/messages_all.dart';

class AppLocalizations {

  static Future<AppLocalizations> load(Locale locale) {
    String name;
    if (locale.countryCode != null && locale.countryCode.isNotEmpty) {
      name = locale.countryCode;
    } else {
      name = locale.toString();
    }

    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      return AppLocalizations();
    });
  }

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  String get appTitle {
    return Intl.message(
      'Ebola Exposure Calculator',
      name: 'appTitle',
      desc: 'Short title for the application'
    );
  }

  String get mainTitle {
    return Intl.message(
      'Calculator to Estimate the Exposure Window for Ebola Virus Disease',
      name: 'mainTitle',
      desc: 'Long title for the application',
    );
  }

  String get calcSymptomsChoice {
    return Intl.message(
      'Date of Symptoms Onset:',
      name: 'calcSymptomsChoice',
      desc: 'Title for symptoms calculator choice'
    );
  }

  String get calcDeathChoice {
    return Intl.message(
        'Date of Death:',
        name: 'calcDeathChoice',
        desc: 'Title for death calculator choice'
    );
  }

  String get incubationPeriodTitle {
    return Intl.message(
      'Incubation Period For Ebola Virus Disease',
      name: 'incubationPeriodTitle',
      desc: 'Title for incubation period configuration section'
    );
  }

  String get incubationPeriodDesc {
    return Intl.message(
        'Use the fields below to change the incubation period for '
        'calculations of potential exposure periods. In general, these '
        'do not need to be altered, so only edit if needed.',
        name: 'incubationPeriodDesc',
        desc: 'Description for incubation period configuration section'
    );
  }

  String get minLabel {
    return Intl.message(
      'min',
      name: 'minLabel',
      desc: 'Label for min value'
    );
  }

  String get maxLabel {
    return Intl.message(
      'max',
      name: 'maxLabel',
      desc: 'Label for max value'
    );
  }

  String get daysLabel {
    return Intl.message(
      'days',
      name: 'daysLabel',
      desc: 'Label for days'
    );
  }

  String get editLabel {
    return Intl.message(
      'Edit',
      name: 'editLabel',
      desc: 'Label for edit button'
    );
  }

  String get openLabel {
    return Intl.message(
      'Open',
      name: 'openLabel',
      desc: 'Label for open button'
    );
  }

  String get symptomOnsetSubtitle {
    return Intl.message(
      '(By Date of Symptoms Onset)',
      name: 'symptomOnsetSubtitle',
      desc: 'Subtitle for date of symptoms onset calculator'
    );
  }

  String get incubationPeriodLabel {
    return Intl.message(
      'Incubation period:',
      name: 'incubationPeriodLabel',
      desc: 'Label for incubation period'
    );
  }

  String get symptomsOnsetTitle {
    return Intl.message(
      'Date of Symptoms Onset',
      name: 'symptomsOnsetTitle',
      desc: 'Page title for the symptoms onset calculator'
    );
  }

  String get symptomsStartLabel {
    return Intl.message(
      'Start of symptoms:',
      name: 'symptomsStartLabel',
      desc: 'Label for start of symptoms'
    );
  }

  String get symptomsOnsetBleeding {
    return Intl.message(
      'At symptoms onset, was the patient bleeding?',
      name: 'symptomsOnsetBleeding',
      desc: 'Question if patient was bleeding on symptoms onset'
    );
  }

  String get symptomsOnsetBleedingDays {
    return Intl.message(
      'Number of days from symptoms onset to start of bleeding (typically, at least 6 days):',
      name: 'symptomsOnsetBleedingDays',
      desc: 'Question of days between symptoms onset and bleeding'
    );
  }

  String get symptomsOnsetDiarrhea {
    return Intl.message(
      'At symptoms onset, did the patient have diarrhea?',
      name: 'symptomsOnsetDiarrhea',
      desc: 'Question if patient had diarrhea on symptoms onset'
    );
  }

  String get symptomsOnsetDiarrheaDays {
    return Intl.message(
        'Number of days from symptoms onset to start of diarrhea (typically, at least 4 days):',
        name: 'symptomsOnsetDiarrheaDays',
        desc: 'Question of days between symptoms onset and diarrhea'
    );
  }

  String get exposureDatesTitle {
    return Intl.message(
      'Estimated Exposure Dates',
      name: 'exposureDatesTitle',
      desc: 'Title for exposure dates'
    );
  }

  String get deathDateTitle {
    return Intl.message(
        'Date of Death',
        name: 'deathDateTitle',
        desc: 'Page title for the date of death calculator'
    );
  }

  String get deathDateSubtitle {
    return Intl.message(
        '(By Date of Death)',
        name: 'deathDateSubtitle',
        desc: 'Subtitle for date of death calculator'
    );
  }

  String get deathDateLabel {
    return Intl.message(
      'Date of death:',
      name: 'deathDateLabel',
      desc: 'Label for the date of death'
    );
  }

  String get deathDateSymptomsOnset {
    return Intl.message(
      'Number of days between symptom onset and death (typically, 7-10 days):',
      name: 'deathDateSymptomsOnset',
      desc: 'Question of number of days between symptoms and death'
    );
  }

  String get importantLabel {
    return Intl.message(
      'Important:',
      name: 'importantLabel',
      desc: 'Important label'
    );
  }

  String get estimateWord {
    return Intl.message(
      'estimate',
      name: 'estimateWord',
      desc: 'Estimate word used for translation and formatting'
    );
  }

  String get noticeText1 {
    return Intl.message(
      'This calculator estimates the period of time during which a person '
      'with Ebola virus disease may have been exposed to the virus.',
      name: 'noticeText1',
      desc: 'Disclaimer text block one'
    );
  }

  String get noticeText2 {
    return Intl.message(
      'This tool may be useful in guiding case investigations by helping to more '
      'reliably calculate the period during which the patient was likely to have '
      'been exposed to Ebola virus.',
      name: 'noticeText2',
      desc: 'Disclaimer text block two'
    );
  }

  String get noticeText3 {
    return Intl.message(
      'This only provides an ',
      name: 'noticeText3',
      desc: 'Disclaimer text block three'
    );
  }

  String get noticeText4 {
    return Intl.message(
      ' of the exposure window. The true exposure window may be different.',
      name: 'noticeText4',
      desc: 'Disclaimer text block four'
    );
  }

  String get noticeText5 {
    return Intl.message(
      'The information provided by this tool need to be used in the context of '
      'other known information about the case in question.',
      name: 'noticeText5',
      desc: 'Disclaimer text block five'
    );
  }

  String get confirmLabel {
    return Intl.message(
      'OK',
      name: 'confirmLabel',
      desc: 'Confirmation label'
    );
  }

  String get resetLabel {
    return Intl.message(
      'Reset',
      name: 'resetLabel',
      desc: 'Reset label'
    );
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  @override
  bool isSupported(Locale locale) {
    return ['en', 'fr'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) {
    return AppLocalizations.load(locale);
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) {
    return false;
  }
}
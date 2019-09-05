/*
 * © 2019 The Johns Hopkins University Applied Physics Laboratory LLC.  All Rights Reserved.
 */

// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a messages locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

// ignore: unnecessary_new
final messages = new MessageLookup();

// ignore: unused_element
final _keepAnalysisHappy = Intl.defaultLocale;

// ignore: non_constant_identifier_names
typedef MessageIfAbsent(String message_str, List args);

class MessageLookup extends MessageLookupByLibrary {
  get localeName => 'messages';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "appTitle" : MessageLookupByLibrary.simpleMessage("Ebola Exposure Calculator"),
    "calcDeathChoice" : MessageLookupByLibrary.simpleMessage("Date of Death:"),
    "calcSymptomsChoice" : MessageLookupByLibrary.simpleMessage("Date of Symptoms Onset:"),
    "confirmLabel" : MessageLookupByLibrary.simpleMessage("OK"),
    "daysLabel" : MessageLookupByLibrary.simpleMessage("days"),
    "deathDateLabel" : MessageLookupByLibrary.simpleMessage("Date of death:"),
    "deathDateSubtitle" : MessageLookupByLibrary.simpleMessage("(By Date of Death)"),
    "deathDateSymptomsOnset" : MessageLookupByLibrary.simpleMessage("Number of days between symptom onset and death (typically, 7-10 days):"),
    "deathDateTitle" : MessageLookupByLibrary.simpleMessage("Date of Death"),
    "editLabel" : MessageLookupByLibrary.simpleMessage("Edit"),
    "estimateWord" : MessageLookupByLibrary.simpleMessage("estimate"),
    "exposureDatesTitle" : MessageLookupByLibrary.simpleMessage("Estimated Exposure Dates"),
    "importantLabel" : MessageLookupByLibrary.simpleMessage("Important:"),
    "incubationPeriodDesc" : MessageLookupByLibrary.simpleMessage("Use the fields below to change the incubation period for calculations of potential exposure periods. In general, these do not need to be altered, so only edit if needed."),
    "incubationPeriodLabel" : MessageLookupByLibrary.simpleMessage("Incubation period:"),
    "incubationPeriodTitle" : MessageLookupByLibrary.simpleMessage("Incubation Period For Ebola Virus Disease"),
    "mainTitle" : MessageLookupByLibrary.simpleMessage("Calculator to Estimate the Exposure Window for Ebola Virus Disease"),
    "maxLabel" : MessageLookupByLibrary.simpleMessage("max"),
    "minLabel" : MessageLookupByLibrary.simpleMessage("min"),
    "noticeText1" : MessageLookupByLibrary.simpleMessage("This calculator estimates the period of time during which a person with Ebola virus disease may have been exposed to the virus."),
    "noticeText2" : MessageLookupByLibrary.simpleMessage("This tool may be useful in guiding case investigations by helping to more reliably calculate the period during which the patient was likely to have been exposed to Ebola virus."),
    "noticeText3" : MessageLookupByLibrary.simpleMessage("This only provides an "),
    "noticeText4" : MessageLookupByLibrary.simpleMessage(" of the exposure window. The true exposure window may be different."),
    "noticeText5" : MessageLookupByLibrary.simpleMessage("The information provided by this tool need to be used in the context of other known information about the case in question."),
    "openLabel" : MessageLookupByLibrary.simpleMessage("Open"),
    "resetLabel" : MessageLookupByLibrary.simpleMessage("Reset"),
    "symptomOnsetSubtitle" : MessageLookupByLibrary.simpleMessage("(By Date of Symptoms Onset)"),
    "symptomsOnsetBleeding" : MessageLookupByLibrary.simpleMessage("At symptoms onset, was the patient bleeding?"),
    "symptomsOnsetBleedingDays" : MessageLookupByLibrary.simpleMessage("Number of days from symptoms onset to start of bleeding (typically, at least 6 days):"),
    "symptomsOnsetDiarrhea" : MessageLookupByLibrary.simpleMessage("At symptoms onset, did the patient have diarrhea?"),
    "symptomsOnsetDiarrheaDays" : MessageLookupByLibrary.simpleMessage("Number of days from symptoms onset to start of diarrhea (typically, at least 4 days):"),
    "symptomsOnsetTitle" : MessageLookupByLibrary.simpleMessage("Date of Symptoms Onset"),
    "symptomsStartLabel" : MessageLookupByLibrary.simpleMessage("Start of symptoms:")
  };
}

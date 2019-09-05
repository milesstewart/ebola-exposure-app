/*
 * © 2019 The Johns Hopkins University Applied Physics Laboratory LLC.  All Rights Reserved.
 */

// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a fr locale. All the
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
  get localeName => 'fr';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "appTitle" : MessageLookupByLibrary.simpleMessage("Outil Ebola"),
    "calcDeathChoice" : MessageLookupByLibrary.simpleMessage("Date du Décès:"),
    "calcSymptomsChoice" : MessageLookupByLibrary.simpleMessage("Date de Début de Symptômes:"),
    "confirmLabel" : MessageLookupByLibrary.simpleMessage("VALIDER"),
    "daysLabel" : MessageLookupByLibrary.simpleMessage("jours"),
    "deathDateLabel" : MessageLookupByLibrary.simpleMessage("Date du décès:"),
    "deathDateSubtitle" : MessageLookupByLibrary.simpleMessage("(En fonction de la date de décès)"),
    "deathDateSymptomsOnset" : MessageLookupByLibrary.simpleMessage("Temps qui s’écoule entre le début des symptômes et le décès (en general, entre 7 et 10 jours):"),
    "deathDateTitle" : MessageLookupByLibrary.simpleMessage("Date du Décès"),
    "editLabel" : MessageLookupByLibrary.simpleMessage("Modifier"),
    "estimateWord" : MessageLookupByLibrary.simpleMessage("estimation"),
    "exposureDatesTitle" : MessageLookupByLibrary.simpleMessage("Dates d\'exposition (estimées)"),
    "importantLabel" : MessageLookupByLibrary.simpleMessage("Important:"),
    "incubationPeriodDesc" : MessageLookupByLibrary.simpleMessage("Utiliser les critères ci-dessous pour modifier la période d’incubation afin d’estimer la fenêtre d’exposition d’Ebola. En générale, il ne faut pas modifier.  Changer seulement si nécessaire."),
    "incubationPeriodLabel" : MessageLookupByLibrary.simpleMessage("Période d\'incubation:"),
    "incubationPeriodTitle" : MessageLookupByLibrary.simpleMessage("Période d\'Incubation pour la Maladie à Virus Ebola"),
    "mainTitle" : MessageLookupByLibrary.simpleMessage("Outil d’estimation de la fenêtre d’exposition au virus Ebola"),
    "maxLabel" : MessageLookupByLibrary.simpleMessage("max"),
    "minLabel" : MessageLookupByLibrary.simpleMessage("min"),
    "noticeText1" : MessageLookupByLibrary.simpleMessage("Cet outil de calcul estime la période pendant laquelle une personne a pu être exposée au virus Ebola."),
    "noticeText2" : MessageLookupByLibrary.simpleMessage("Cet outil peut être utilisé pour guider les enquêtes sur les cas en se  concentrant sur la période pendant laquelle une personne aurait pu être exposée au virus Ebola."),
    "noticeText3" : MessageLookupByLibrary.simpleMessage("Ceci ne fournira qu\'une "),
    "noticeText4" : MessageLookupByLibrary.simpleMessage(" de la fenêtre d\'exposition. La période d\'exposition réelle peut être différente."),
    "noticeText5" : MessageLookupByLibrary.simpleMessage("Les informations fournies par cet outil doivent être utilisées en collaboration avec d\'autres informations connues sur le patient."),
    "openLabel" : MessageLookupByLibrary.simpleMessage("Ouvrir"),
    "resetLabel" : MessageLookupByLibrary.simpleMessage("Réinitialiser"),
    "symptomOnsetSubtitle" : MessageLookupByLibrary.simpleMessage("(En fonction de la date de début de symptômes)"),
    "symptomsOnsetBleeding" : MessageLookupByLibrary.simpleMessage("Au début de symptômes, le patient a-t-il signalé des saignements?"),
    "symptomsOnsetBleedingDays" : MessageLookupByLibrary.simpleMessage("Nombre de jours entre de début de symptômes de la maladie et le début des saignements:"),
    "symptomsOnsetDiarrhea" : MessageLookupByLibrary.simpleMessage("Au début de symptômes, le patient a-t-il signalé de la diarrhée?"),
    "symptomsOnsetDiarrheaDays" : MessageLookupByLibrary.simpleMessage("Nombre de jours entre de début de symptômes de la maladie et le début de la diarrhée:"),
    "symptomsOnsetTitle" : MessageLookupByLibrary.simpleMessage("Date de début de symptômes"),
    "symptomsStartLabel" : MessageLookupByLibrary.simpleMessage("Début sympt. (estimé):")
  };
}

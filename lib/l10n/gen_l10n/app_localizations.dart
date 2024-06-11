import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_zh.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen_l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('en', 'US'),
    Locale('zh'),
    Locale.fromSubtags(languageCode: 'zh', countryCode: 'TW', scriptCode: 'Hant')
  ];

  /// No description provided for @welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome Back'**
  String get welcome;

  /// No description provided for @goodMorning.
  ///
  /// In en, this message translates to:
  /// **'Good Morning'**
  String get goodMorning;

  /// No description provided for @goodAfternoon.
  ///
  /// In en, this message translates to:
  /// **'Good Afternoon'**
  String get goodAfternoon;

  /// No description provided for @goodNight.
  ///
  /// In en, this message translates to:
  /// **'Good Night'**
  String get goodNight;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search Health Knowledge'**
  String get search;

  /// No description provided for @homeAppbarTitle.
  ///
  /// In en, this message translates to:
  /// **'Stork'**
  String get homeAppbarTitle;

  /// No description provided for @drawerVersion.
  ///
  /// In en, this message translates to:
  /// **'v'**
  String get drawerVersion;

  /// No description provided for @drawerMenuItemIndex.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get drawerMenuItemIndex;

  /// No description provided for @drawerMenuItemMedicalCenter.
  ///
  /// In en, this message translates to:
  /// **'Medical Info'**
  String get drawerMenuItemMedicalCenter;

  /// No description provided for @drawerMenuItemHealthEducation.
  ///
  /// In en, this message translates to:
  /// **'Health Education'**
  String get drawerMenuItemHealthEducation;

  /// No description provided for @drawerMenuItemCustomerService.
  ///
  /// In en, this message translates to:
  /// **'Customer Service'**
  String get drawerMenuItemCustomerService;

  /// No description provided for @drawerMenuItemPersonalSetting.
  ///
  /// In en, this message translates to:
  /// **'Personal Setting'**
  String get drawerMenuItemPersonalSetting;

  /// No description provided for @bottomAppBarItemReservation.
  ///
  /// In en, this message translates to:
  /// **'Reservation'**
  String get bottomAppBarItemReservation;

  /// No description provided for @bottomAppBarItemMedicalConsultationProgress.
  ///
  /// In en, this message translates to:
  /// **'Process'**
  String get bottomAppBarItemMedicalConsultationProgress;

  /// No description provided for @bottomAppBarItemTodoList.
  ///
  /// In en, this message translates to:
  /// **'Todo'**
  String get bottomAppBarItemTodoList;

  /// No description provided for @bottomAppBarItemExamineReport.
  ///
  /// In en, this message translates to:
  /// **'Examine Report'**
  String get bottomAppBarItemExamineReport;

  /// No description provided for @bottomAppBarItemCellInfo.
  ///
  /// In en, this message translates to:
  /// **'Cells Info'**
  String get bottomAppBarItemCellInfo;

  /// No description provided for @bottomAppBarItemFee.
  ///
  /// In en, this message translates to:
  /// **'Fee'**
  String get bottomAppBarItemFee;

  /// No description provided for @upcoming.
  ///
  /// In en, this message translates to:
  /// **'Upcoming'**
  String get upcoming;

  /// No description provided for @viewAll.
  ///
  /// In en, this message translates to:
  /// **'Viwe all'**
  String get viewAll;

  /// No description provided for @recommendArticle.
  ///
  /// In en, this message translates to:
  /// **'Recommend Article'**
  String get recommendArticle;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'zh'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
    // Lookup logic when language+script+country codes are specified.
  switch (locale.toString()) {
    case 'zh_Hant_TW': return AppLocalizationsZhHantTw();
  }

  // Lookup logic when language+country codes are specified.
  switch (locale.languageCode) {
    case 'en': {
  switch (locale.countryCode) {
    case 'US': return AppLocalizationsEnUs();
   }
  break;
   }
  }

  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'zh': return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}

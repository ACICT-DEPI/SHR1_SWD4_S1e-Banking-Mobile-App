// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Add New Card`
  String get AddNewCard {
    return Intl.message(
      'Add New Card',
      name: 'AddNewCard',
      desc: '',
      args: [],
    );
  }

  /// `Mastercard`
  String get Mastercard {
    return Intl.message(
      'Mastercard',
      name: 'Mastercard',
      desc: '',
      args: [],
    );
  }

  /// `Cardholder Name`
  String get CardholderName {
    return Intl.message(
      'Cardholder Name',
      name: 'CardholderName',
      desc: '',
      args: [],
    );
  }

  /// `Expiry Date`
  String get ExpiryDate {
    return Intl.message(
      'Expiry Date',
      name: 'ExpiryDate',
      desc: '',
      args: [],
    );
  }

  /// `CVV`
  String get CVV {
    return Intl.message(
      'CVV',
      name: 'CVV',
      desc: '',
      args: [],
    );
  }

  /// `Card Number`
  String get CardNumber {
    return Intl.message(
      'Card Number',
      name: 'CardNumber',
      desc: '',
      args: [],
    );
  }

  /// `Add Card`
  String get AddCard {
    return Intl.message(
      'Add Card',
      name: 'AddCard',
      desc: '',
      args: [],
    );
  }

  /// `Light`
  String get Light {
    return Intl.message(
      'Light',
      name: 'Light',
      desc: '',
      args: [],
    );
  }

  /// `This Field is required`
  String get FieldRequired {
    return Intl.message(
      'This Field is required',
      name: 'FieldRequired',
      desc: '',
      args: [],
    );
  }

  /// `Must be 16 digits`
  String get Must16Digits {
    return Intl.message(
      'Must be 16 digits',
      name: 'Must16Digits',
      desc: '',
      args: [],
    );
  }

  /// `Must be 3 digits`
  String get Must3Digits {
    return Intl.message(
      'Must be 3 digits',
      name: 'Must3Digits',
      desc: '',
      args: [],
    );
  }

  /// `Expiration date is required`
  String get ExpirationDateRequired {
    return Intl.message(
      'Expiration date is required',
      name: 'ExpirationDateRequired',
      desc: '',
      args: [],
    );
  }

  /// `format is (MM/YY)`
  String get DateFormat {
    return Intl.message(
      'format is (MM/YY)',
      name: 'DateFormat',
      desc: '',
      args: [],
    );
  }

  /// `date is in the past`
  String get dateInPast {
    return Intl.message(
      'date is in the past',
      name: 'dateInPast',
      desc: '',
      args: [],
    );
  }

  /// `Name is required`
  String get NameRequired {
    return Intl.message(
      'Name is required',
      name: 'NameRequired',
      desc: '',
      args: [],
    );
  }

  /// `Name must contain only letters`
  String get NameMustContainLetters {
    return Intl.message(
      'Name must contain only letters',
      name: 'NameMustContainLetters',
      desc: '',
      args: [],
    );
  }

  /// `All Cards`
  String get AllCards {
    return Intl.message(
      'All Cards',
      name: 'AllCards',
      desc: '',
      args: [],
    );
  }

  /// `Login failed. Please try again.`
  String get LoginFailedTryAgain {
    return Intl.message(
      'Login failed. Please try again.',
      name: 'LoginFailedTryAgain',
      desc: '',
      args: [],
    );
  }

  /// `No user found for that email.`
  String get NoUserFound {
    return Intl.message(
      'No user found for that email.',
      name: 'NoUserFound',
      desc: '',
      args: [],
    );
  }

  /// `Wrong password provided for that user.`
  String get WrongPassword {
    return Intl.message(
      'Wrong password provided for that user.',
      name: 'WrongPassword',
      desc: '',
      args: [],
    );
  }

  /// `The email address is badly formatted.`
  String get EmailBadlyFormatted {
    return Intl.message(
      'The email address is badly formatted.',
      name: 'EmailBadlyFormatted',
      desc: '',
      args: [],
    );
  }

  /// `The email or password is wrong.`
  String get EmailOrPasswordWrong {
    return Intl.message(
      'The email or password is wrong.',
      name: 'EmailOrPasswordWrong',
      desc: '',
      args: [],
    );
  }

  /// `Too many login attempts. Please try again later.`
  String get ManyLoginAttempts {
    return Intl.message(
      'Too many login attempts. Please try again later.',
      name: 'ManyLoginAttempts',
      desc: '',
      args: [],
    );
  }

  /// `Network error. Please check your connection.`
  String get NetworkError {
    return Intl.message(
      'Network error. Please check your connection.',
      name: 'NetworkError',
      desc: '',
      args: [],
    );
  }

  /// `An unexpected error occurred.`
  String get UnexpectedError {
    return Intl.message(
      'An unexpected error occurred.',
      name: 'UnexpectedError',
      desc: '',
      args: [],
    );
  }

  /// `The password is too weak.`
  String get PasswordWeak {
    return Intl.message(
      'The password is too weak.',
      name: 'PasswordWeak',
      desc: '',
      args: [],
    );
  }

  /// `The email address is already in use.`
  String get EmailInUse {
    return Intl.message(
      'The email address is already in use.',
      name: 'EmailInUse',
      desc: '',
      args: [],
    );
  }

  /// `Email/password accounts are not enabled.`
  String get EmailPasswordNotEnabled {
    return Intl.message(
      'Email/password accounts are not enabled.',
      name: 'EmailPasswordNotEnabled',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account.`
  String get AlreadyHaveAccount {
    return Intl.message(
      'Already have an account.',
      name: 'AlreadyHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get SignIn {
    return Intl.message(
      'Sign In',
      name: 'SignIn',
      desc: '',
      args: [],
    );
  }

  /// `Email Address`
  String get EmailAddress {
    return Intl.message(
      'Email Address',
      name: 'EmailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get Password {
    return Intl.message(
      'Password',
      name: 'Password',
      desc: '',
      args: [],
    );
  }

  /// `Welcome`
  String get Welcome {
    return Intl.message(
      'Welcome',
      name: 'Welcome',
      desc: '',
      args: [],
    );
  }

  /// `I’m a new user.`
  String get INewUser {
    return Intl.message(
      'I’m a new user.',
      name: 'INewUser',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get SignUp {
    return Intl.message(
      'Sign Up',
      name: 'SignUp',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get FullName {
    return Intl.message(
      'Full Name',
      name: 'FullName',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid name`
  String get EnterValidName {
    return Intl.message(
      'Please enter a valid name',
      name: 'EnterValidName',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get PhoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'PhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid number`
  String get EnterValidNumber {
    return Intl.message(
      'Please enter a valid number',
      name: 'EnterValidNumber',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email`
  String get EnterValidEmail {
    return Intl.message(
      'Please enter a valid email',
      name: 'EnterValidEmail',
      desc: '',
      args: [],
    );
  }

  /// `The email created successfully`
  String get EmailCreatedSuccessfully {
    return Intl.message(
      'The email created successfully',
      name: 'EmailCreatedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `The password changed successfully`
  String get PasswordChangedSuccessfully {
    return Intl.message(
      'The password changed successfully',
      name: 'PasswordChangedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get ChangePassword {
    return Intl.message(
      'Change Password',
      name: 'ChangePassword',
      desc: '',
      args: [],
    );
  }

  /// `Current Password`
  String get CurrentPassword {
    return Intl.message(
      'Current Password',
      name: 'CurrentPassword',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get NewPassword {
    return Intl.message(
      'New Password',
      name: 'NewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Confirm New Password`
  String get ConfirmNewPassword {
    return Intl.message(
      'Confirm New Password',
      name: 'ConfirmNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Both Passwords Must Match`
  String get PasswordsMustMatch {
    return Intl.message(
      'Both Passwords Must Match',
      name: 'PasswordsMustMatch',
      desc: '',
      args: [],
    );
  }

  /// `Both new Passwords must match!!`
  String get NewPasswordsMustMatch {
    return Intl.message(
      'Both new Passwords must match!!',
      name: 'NewPasswordsMustMatch',
      desc: '',
      args: [],
    );
  }

  /// `Enter the correct password!!`
  String get EnterCorrectPassword {
    return Intl.message(
      'Enter the correct password!!',
      name: 'EnterCorrectPassword',
      desc: '',
      args: [],
    );
  }

  /// `Languages`
  String get Languages {
    return Intl.message(
      'Languages',
      name: 'Languages',
      desc: '',
      args: [],
    );
  }

  /// `Please authenticate to access`
  String get AuthenticateToAccess {
    return Intl.message(
      'Please authenticate to access',
      name: 'AuthenticateToAccess',
      desc: '',
      args: [],
    );
  }

  /// `Forgot PIN?`
  String get ForgotPIN {
    return Intl.message(
      'Forgot PIN?',
      name: 'ForgotPIN',
      desc: '',
      args: [],
    );
  }

  /// `Bank App`
  String get BankApp {
    return Intl.message(
      'Bank App',
      name: 'BankApp',
      desc: '',
      args: [],
    );
  }

  /// `Del`
  String get Del {
    return Intl.message(
      'Del',
      name: 'Del',
      desc: '',
      args: [],
    );
  }

  /// `Monthly spending limit`
  String get MonthlySpendingLimit {
    return Intl.message(
      'Monthly spending limit',
      name: 'MonthlySpendingLimit',
      desc: '',
      args: [],
    );
  }

  /// `Dark`
  String get Dark {
    return Intl.message(
      'Dark',
      name: 'Dark',
      desc: '',
      args: [],
    );
  }

  /// `Amount`
  String get Amount {
    return Intl.message(
      'Amount',
      name: 'Amount',
      desc: '',
      args: [],
    );
  }

  /// `My Cards`
  String get MyCards {
    return Intl.message(
      'My Cards',
      name: 'MyCards',
      desc: '',
      args: [],
    );
  }

  /// `Saved New Monthly Limit`
  String get SavedNewMonthlyLimit {
    return Intl.message(
      'Saved New Monthly Limit',
      name: 'SavedNewMonthlyLimit',
      desc: '',
      args: [],
    );
  }

  /// `Sent`
  String get Sent {
    return Intl.message(
      'Sent',
      name: 'Sent',
      desc: '',
      args: [],
    );
  }

  /// `Receive`
  String get Receive {
    return Intl.message(
      'Receive',
      name: 'Receive',
      desc: '',
      args: [],
    );
  }

  /// `Services`
  String get Services {
    return Intl.message(
      'Services',
      name: 'Services',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get Home {
    return Intl.message(
      'Home',
      name: 'Home',
      desc: '',
      args: [],
    );
  }

  /// `My Statistics`
  String get MyStatistics {
    return Intl.message(
      'My Statistics',
      name: 'MyStatistics',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get Settings {
    return Intl.message(
      'Settings',
      name: 'Settings',
      desc: '',
      args: [],
    );
  }

  /// `Welcome back`
  String get WelcomeBack {
    return Intl.message(
      'Welcome back',
      name: 'WelcomeBack',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred`
  String get ErrorOccurred {
    return Intl.message(
      'An error occurred',
      name: 'ErrorOccurred',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get Notifications {
    return Intl.message(
      'Notifications',
      name: 'Notifications',
      desc: '',
      args: [],
    );
  }

  /// `No Notifications`
  String get NoNotifications {
    return Intl.message(
      'No Notifications',
      name: 'NoNotifications',
      desc: '',
      args: [],
    );
  }

  /// `Loading...`
  String get Loading {
    return Intl.message(
      'Loading...',
      name: 'Loading',
      desc: '',
      args: [],
    );
  }

  /// `Fastest Payment in \nthe world`
  String get FastestPayment {
    return Intl.message(
      'Fastest Payment in \nthe world',
      name: 'FastestPayment',
      desc: '',
      args: [],
    );
  }

  /// `Integrate multiple payment methods\n to help you up the process quickly`
  String get FastestPaymentDescription {
    return Intl.message(
      'Integrate multiple payment methods\n to help you up the process quickly',
      name: 'FastestPaymentDescription',
      desc: '',
      args: [],
    );
  }

  /// `The most Secure\n Platform for Customers`
  String get SecurePlatform {
    return Intl.message(
      'The most Secure\n Platform for Customers',
      name: 'SecurePlatform',
      desc: '',
      args: [],
    );
  }

  /// `Built-in Fingerprint, face recognition\n and more, keeping you completely safe`
  String get SecurePlatformDescription {
    return Intl.message(
      'Built-in Fingerprint, face recognition\n and more, keeping you completely safe',
      name: 'SecurePlatformDescription',
      desc: '',
      args: [],
    );
  }

  /// `Paying for Everything is\n Easy and Convenient`
  String get PayingEverything {
    return Intl.message(
      'Paying for Everything is\n Easy and Convenient',
      name: 'PayingEverything',
      desc: '',
      args: [],
    );
  }

  /// `Built-in Fingerprint, face recognition\n and more, keeping you completely safe`
  String get PayingEverythingDescription {
    return Intl.message(
      'Built-in Fingerprint, face recognition\n and more, keeping you completely safe',
      name: 'PayingEverythingDescription',
      desc: '',
      args: [],
    );
  }

  /// `Get Started`
  String get GetStarted {
    return Intl.message(
      'Get Started',
      name: 'GetStarted',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get Next {
    return Intl.message(
      'Next',
      name: 'Next',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get PrivacyPolicy {
    return Intl.message(
      'Privacy Policy',
      name: 'PrivacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Birth Date`
  String get BirthDate {
    return Intl.message(
      'Birth Date',
      name: 'BirthDate',
      desc: '',
      args: [],
    );
  }

  /// `Profile edited successfully`
  String get ProfileEditedSuccessfully {
    return Intl.message(
      'Profile edited successfully',
      name: 'ProfileEditedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Edit Profile`
  String get EditProfile {
    return Intl.message(
      'Edit Profile',
      name: 'EditProfile',
      desc: '',
      args: [],
    );
  }

  /// `Joined at`
  String get JoinedAt {
    return Intl.message(
      'Joined at',
      name: 'JoinedAt',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get Save {
    return Intl.message(
      'Save',
      name: 'Save',
      desc: '',
      args: [],
    );
  }

  /// `Id:`
  String get Id {
    return Intl.message(
      'Id:',
      name: 'Id',
      desc: '',
      args: [],
    );
  }

  /// `ID`
  String get ID {
    return Intl.message(
      'ID',
      name: 'ID',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get Profile {
    return Intl.message(
      'Profile',
      name: 'Profile',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get Logout {
    return Intl.message(
      'Logout',
      name: 'Logout',
      desc: '',
      args: [],
    );
  }

  /// `Delete Account`
  String get DeleteAccount {
    return Intl.message(
      'Delete Account',
      name: 'DeleteAccount',
      desc: '',
      args: [],
    );
  }

  /// `Copy ID`
  String get CopyID {
    return Intl.message(
      'Copy ID',
      name: 'CopyID',
      desc: '',
      args: [],
    );
  }

  /// `Copied to clipboard`
  String get CopiedToClipboard {
    return Intl.message(
      'Copied to clipboard',
      name: 'CopiedToClipboard',
      desc: '',
      args: [],
    );
  }

  /// `Receive Money`
  String get ReceiveMoney {
    return Intl.message(
      'Receive Money',
      name: 'ReceiveMoney',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get Search {
    return Intl.message(
      'Search',
      name: 'Search',
      desc: '',
      args: [],
    );
  }

  /// `Start Searching...`
  String get StartSearching {
    return Intl.message(
      'Start Searching...',
      name: 'StartSearching',
      desc: '',
      args: [],
    );
  }

  /// `Please check the ID or Enter enough amount`
  String get CheckIDOrEnterEnoughAmount {
    return Intl.message(
      'Please check the ID or Enter enough amount',
      name: 'CheckIDOrEnterEnoughAmount',
      desc: '',
      args: [],
    );
  }

  /// `QR Scanner`
  String get QRScanner {
    return Intl.message(
      'QR Scanner',
      name: 'QRScanner',
      desc: '',
      args: [],
    );
  }

  /// `Enter amount`
  String get EnterAmount {
    return Intl.message(
      'Enter amount',
      name: 'EnterAmount',
      desc: '',
      args: [],
    );
  }

  /// `Change Currency?`
  String get ChangeCurrency {
    return Intl.message(
      'Change Currency?',
      name: 'ChangeCurrency',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the amount`
  String get EnterTheAmount {
    return Intl.message(
      'Please enter the amount',
      name: 'EnterTheAmount',
      desc: '',
      args: [],
    );
  }

  /// `Enter Payment ID`
  String get EnterPaymentID {
    return Intl.message(
      'Enter Payment ID',
      name: 'EnterPaymentID',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the id`
  String get EnterId {
    return Intl.message(
      'Please enter the id',
      name: 'EnterId',
      desc: '',
      args: [],
    );
  }

  /// `Selected Service`
  String get SelectedService {
    return Intl.message(
      'Selected Service',
      name: 'SelectedService',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get Continue {
    return Intl.message(
      'Continue',
      name: 'Continue',
      desc: '',
      args: [],
    );
  }

  /// `Biometric`
  String get Biometric {
    return Intl.message(
      'Biometric',
      name: 'Biometric',
      desc: '',
      args: [],
    );
  }

  /// `General`
  String get General {
    return Intl.message(
      'General',
      name: 'General',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get Language {
    return Intl.message(
      'Language',
      name: 'Language',
      desc: '',
      args: [],
    );
  }

  /// `My Profile`
  String get MyProfile {
    return Intl.message(
      'My Profile',
      name: 'MyProfile',
      desc: '',
      args: [],
    );
  }

  /// `Theme Mode`
  String get ThemeMode {
    return Intl.message(
      'Theme Mode',
      name: 'ThemeMode',
      desc: '',
      args: [],
    );
  }

  /// `Security`
  String get Security {
    return Intl.message(
      'Security',
      name: 'Security',
      desc: '',
      args: [],
    );
  }

  /// `Contact Us`
  String get ContactUs {
    return Intl.message(
      'Contact Us',
      name: 'ContactUs',
      desc: '',
      args: [],
    );
  }

  /// `Use fingerprint or PIN code`
  String get UseFingerprintPIN {
    return Intl.message(
      'Use fingerprint or PIN code',
      name: 'UseFingerprintPIN',
      desc: '',
      args: [],
    );
  }

  /// `Category Chart`
  String get CategoryChart {
    return Intl.message(
      'Category Chart',
      name: 'CategoryChart',
      desc: '',
      args: [],
    );
  }

  /// `Current Balance`
  String get CurrentBalance {
    return Intl.message(
      'Current Balance',
      name: 'CurrentBalance',
      desc: '',
      args: [],
    );
  }

  /// `Statistics`
  String get Statistics {
    return Intl.message(
      'Statistics',
      name: 'Statistics',
      desc: '',
      args: [],
    );
  }

  /// `Financial Services`
  String get FinancialServices {
    return Intl.message(
      'Financial Services',
      name: 'FinancialServices',
      desc: '',
      args: [],
    );
  }

  /// `Entertainment`
  String get Entertainment {
    return Intl.message(
      'Entertainment',
      name: 'Entertainment',
      desc: '',
      args: [],
    );
  }

  /// `Utilities`
  String get Utilities {
    return Intl.message(
      'Utilities',
      name: 'Utilities',
      desc: '',
      args: [],
    );
  }

  /// `Shopping`
  String get Shopping {
    return Intl.message(
      'Shopping',
      name: 'Shopping',
      desc: '',
      args: [],
    );
  }

  /// `Telecommunication`
  String get Telecommunication {
    return Intl.message(
      'Telecommunication',
      name: 'Telecommunication',
      desc: '',
      args: [],
    );
  }

  /// `Transport`
  String get Transport {
    return Intl.message(
      'Transport',
      name: 'Transport',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get Error {
    return Intl.message(
      'Error',
      name: 'Error',
      desc: '',
      args: [],
    );
  }

  /// `Transaction History`
  String get TransactionHistory {
    return Intl.message(
      'Transaction History',
      name: 'TransactionHistory',
      desc: '',
      args: [],
    );
  }

  /// `See All`
  String get SeeAll {
    return Intl.message(
      'See All',
      name: 'SeeAll',
      desc: '',
      args: [],
    );
  }

  /// `Today`
  String get Today {
    return Intl.message(
      'Today',
      name: 'Today',
      desc: '',
      args: [],
    );
  }

  /// `Transaction`
  String get Transaction {
    return Intl.message(
      'Transaction',
      name: 'Transaction',
      desc: '',
      args: [],
    );
  }

  /// `Last 7 days`
  String get Last7Days {
    return Intl.message(
      'Last 7 days',
      name: 'Last7Days',
      desc: '',
      args: [],
    );
  }

  /// `Last 30 days`
  String get Last30Days {
    return Intl.message(
      'Last 30 days',
      name: 'Last30Days',
      desc: '',
      args: [],
    );
  }

  /// `No Internet Connection`
  String get NoInternetConnection {
    return Intl.message(
      'No Internet Connection',
      name: 'NoInternetConnection',
      desc: '',
      args: [],
    );
  }

  /// `Open WiFi Settings`
  String get OpenWiFiSettings {
    return Intl.message(
      'Open WiFi Settings',
      name: 'OpenWiFiSettings',
      desc: '',
      args: [],
    );
  }

  /// `Could not open WiFi settings`
  String get CouldNotOpenWiFiSettings {
    return Intl.message(
      'Could not open WiFi settings',
      name: 'CouldNotOpenWiFiSettings',
      desc: '',
      args: [],
    );
  }

  /// `Spotify`
  String get Spotify {
    return Intl.message(
      'Spotify',
      name: 'Spotify',
      desc: '',
      args: [],
    );
  }

  /// `Apple Store`
  String get AppleStore {
    return Intl.message(
      'Apple Store',
      name: 'AppleStore',
      desc: '',
      args: [],
    );
  }

  /// `Money Transfer`
  String get MoneyTransfer {
    return Intl.message(
      'Money Transfer',
      name: 'MoneyTransfer',
      desc: '',
      args: [],
    );
  }

  /// `Grocery`
  String get Grocery {
    return Intl.message(
      'Grocery',
      name: 'Grocery',
      desc: '',
      args: [],
    );
  }

  /// `Google Play`
  String get GooglePlay {
    return Intl.message(
      'Google Play',
      name: 'GooglePlay',
      desc: '',
      args: [],
    );
  }

  /// `Amazon Pay`
  String get AmazonPay {
    return Intl.message(
      'Amazon Pay',
      name: 'AmazonPay',
      desc: '',
      args: [],
    );
  }

  /// `Paypal`
  String get Paypal {
    return Intl.message(
      'Paypal',
      name: 'Paypal',
      desc: '',
      args: [],
    );
  }

  /// `Netflix`
  String get Netflix {
    return Intl.message(
      'Netflix',
      name: 'Netflix',
      desc: '',
      args: [],
    );
  }

  /// `Uber`
  String get Uber {
    return Intl.message(
      'Uber',
      name: 'Uber',
      desc: '',
      args: [],
    );
  }

  /// `Water Bill`
  String get WaterBill {
    return Intl.message(
      'Water Bill',
      name: 'WaterBill',
      desc: '',
      args: [],
    );
  }

  /// `Home Internet`
  String get HomeInternet {
    return Intl.message(
      'Home Internet',
      name: 'HomeInternet',
      desc: '',
      args: [],
    );
  }

  /// `Mobile Bill`
  String get MobileBill {
    return Intl.message(
      'Mobile Bill',
      name: 'MobileBill',
      desc: '',
      args: [],
    );
  }

  /// `Mobile Recharge`
  String get MobileRecharge {
    return Intl.message(
      'Mobile Recharge',
      name: 'MobileRecharge',
      desc: '',
      args: [],
    );
  }

  /// `Social Insurance`
  String get SocialInsurance {
    return Intl.message(
      'Social Insurance',
      name: 'SocialInsurance',
      desc: '',
      args: [],
    );
  }

  /// `Fawry Pay`
  String get FawryPay {
    return Intl.message(
      'Fawry Pay',
      name: 'FawryPay',
      desc: '',
      args: [],
    );
  }

  /// `Landline`
  String get Landline {
    return Intl.message(
      'Landline',
      name: 'Landline',
      desc: '',
      args: [],
    );
  }

  /// `Electricity`
  String get Electricity {
    return Intl.message(
      'Electricity',
      name: 'Electricity',
      desc: '',
      args: [],
    );
  }

  /// `Finance And Banks`
  String get FinanceAndBanks {
    return Intl.message(
      'Finance And Banks',
      name: 'FinanceAndBanks',
      desc: '',
      args: [],
    );
  }

  /// `Donations`
  String get Donations {
    return Intl.message(
      'Donations',
      name: 'Donations',
      desc: '',
      args: [],
    );
  }

  /// `Games`
  String get Games {
    return Intl.message(
      'Games',
      name: 'Games',
      desc: '',
      args: [],
    );
  }

  /// `Gas`
  String get Gas {
    return Intl.message(
      'Gas',
      name: 'Gas',
      desc: '',
      args: [],
    );
  }

  /// `Tickets`
  String get Tickets {
    return Intl.message(
      'Tickets',
      name: 'Tickets',
      desc: '',
      args: [],
    );
  }

  /// `Microfinance`
  String get Microfinance {
    return Intl.message(
      'Microfinance',
      name: 'Microfinance',
      desc: '',
      args: [],
    );
  }

  /// `Education`
  String get Education {
    return Intl.message(
      'Education',
      name: 'Education',
      desc: '',
      args: [],
    );
  }

  /// `Payments`
  String get Payments {
    return Intl.message(
      'Payments',
      name: 'Payments',
      desc: '',
      args: [],
    );
  }

  /// `Unions`
  String get Unions {
    return Intl.message(
      'Unions',
      name: 'Unions',
      desc: '',
      args: [],
    );
  }

  /// `Daily Waste`
  String get DailyWaste {
    return Intl.message(
      'Daily Waste',
      name: 'DailyWaste',
      desc: '',
      args: [],
    );
  }

  /// `Save Gaza`
  String get SaveGaza {
    return Intl.message(
      'Save Gaza',
      name: 'SaveGaza',
      desc: '',
      args: [],
    );
  }

  /// `Just now`
  String get JustNow {
    return Intl.message(
      'Just now',
      name: 'JustNow',
      desc: '',
      args: [],
    );
  }

  /// `minutes ago`
  String get MinutesAgo {
    return Intl.message(
      'minutes ago',
      name: 'MinutesAgo',
      desc: '',
      args: [],
    );
  }

  /// `1 hour ago`
  String get HourAgo {
    return Intl.message(
      '1 hour ago',
      name: 'HourAgo',
      desc: '',
      args: [],
    );
  }

  /// `hours ago`
  String get HoursAgo {
    return Intl.message(
      'hours ago',
      name: 'HoursAgo',
      desc: '',
      args: [],
    );
  }

  /// `Yesterday`
  String get Yesterday {
    return Intl.message(
      'Yesterday',
      name: 'Yesterday',
      desc: '',
      args: [],
    );
  }

  /// `days ago`
  String get DaysAgo {
    return Intl.message(
      'days ago',
      name: 'DaysAgo',
      desc: '',
      args: [],
    );
  }

  /// `1 week ago`
  String get WeekAgo {
    return Intl.message(
      '1 week ago',
      name: 'WeekAgo',
      desc: '',
      args: [],
    );
  }

  /// `weeks ago`
  String get WeeksAgo {
    return Intl.message(
      'weeks ago',
      name: 'WeeksAgo',
      desc: '',
      args: [],
    );
  }

  /// `1 month ago`
  String get MonthAgo {
    return Intl.message(
      '1 month ago',
      name: 'MonthAgo',
      desc: '',
      args: [],
    );
  }

  /// `months ago`
  String get MonthsAgo {
    return Intl.message(
      'months ago',
      name: 'MonthsAgo',
      desc: '',
      args: [],
    );
  }

  /// `1 year ago`
  String get YearAgo {
    return Intl.message(
      '1 year ago',
      name: 'YearAgo',
      desc: '',
      args: [],
    );
  }

  /// `years ago`
  String get YearsAgo {
    return Intl.message(
      'years ago',
      name: 'YearsAgo',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}

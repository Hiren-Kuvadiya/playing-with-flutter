import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {

  final String _accessCode = "access";
  final String _refreshCode = "refresh";
  final String _verificationHash = "verificationHash";
  final String _isLoginStatus = "isLoginStatus";
  final String _uesrName = "userName";
  final String _userProfile = "userProfile";
  final String fcmToken = "fcmToken";
  final String subScribeIds = "subScribeIds";
  final String _userId = "userId";

  String _topicPreText = Platform.isIOS ? "IOS_" : "ANDROID_";

  SharedPreferences prefs;

  SharedPreferencesHelper(){
    load();
  }

  Future<SharedPreferences> load() async {
    if (prefs == null) {
      prefs = await SharedPreferences.getInstance();
    }
  }

  /* SharedPreferencesHelper(SharedPreferences prefs) {
    prefs = await SharedPreferences.getInstance();
  }*/

  Future<String> getUserId() async {
    prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userId);
  }

  Future<bool> setUserId(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(_userId, value);
  }

  Future<String> getAccessToken() async {
    prefs = await SharedPreferences.getInstance();
    return prefs.getString(_accessCode);
  }

  Future<bool> setAccessToken(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(_accessCode, value);
  }

  Future<String> getRefreshToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_refreshCode) ?? 'refreshToken';
  }

  Future<bool> setRefreshToken(String value) async {


    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(_refreshCode, value);
  }

  Future<String> getVerificationHash() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_verificationHash) ?? 'verificationHash';
  }

  Future<bool> setVerificationHash(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(_verificationHash, value);
  }

  Future<bool> getLoginStatus() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_isLoginStatus) ?? false;
  }

  Future<bool> setLoginStatus(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setBool(_isLoginStatus, value) ?? false;
  }

  Future<bool> setUserName(String userName) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(_uesrName, userName) ?? false;
  }

  Future<bool> setUserProfile(String userProfile) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(_userProfile, userProfile) ?? false;
  }

  Future<String> getUserName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_uesrName);
  }

  Future<String> getUserProfile() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userProfile);
  }

  Future<String> getFcmToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(fcmToken);
  }

  void setFcmToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(fcmToken, token);
  }

  Future<List<String>> getSubscibeIds() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(subScribeIds) ?? [];
  }

  Future<bool> getSubscribeIdsAvailable(String id) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> tempList = prefs.getStringList(subScribeIds) ?? [];

    if ((tempList?.isNotEmpty ?? false)) {

      if (!tempList.contains(_topicPreText + id) && (id?.isNotEmpty ?? false)) {
        tempList.add(_topicPreText + id);
        prefs.setStringList(subScribeIds, tempList);
      }

      return true;

    } else {
      tempList.add(_topicPreText + id);
      prefs.setStringList(subScribeIds, tempList);
    }

  }

}

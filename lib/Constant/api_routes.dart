class ApiUrl {
  static const String baseurl = "https://api.epass.com.np";
  static const String loginurl = "$baseurl/user/login/";
  static const String registerurl = "$baseurl/user/register/";
  static const String orgregisterurl ="$baseurl/organization/create/";
  static const String forgotPassword = "$baseurl/user/forgot-password/";
  static const String verifyotp = "$baseurl/user/verify-otp/";
  static const String resetPassword = "$baseurl/user/reset-password/";
  static const String changePassword = "$baseurl/user/change-password/";
  static const String loginDetails = "$baseurl/user/me";
  static const String createBranchurl = "$baseurl/organization/branches/";
  static const String scanQrcode = "$baseurl/organization/scan-organization/";
  static const String verifykyc = "$baseurl/organization/verify-kyc/";
  static const String branchlist = "$baseurl/organization/branches/";
  static const String getorgkycpreview = "$baseurl/organization/kyc/me/";
}

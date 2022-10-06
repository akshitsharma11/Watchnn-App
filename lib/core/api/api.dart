class Api {
  static const baseurlLocal = 'https://watchnapp.herokuapp.com';

  /// Auth
  static const userlogin = '/api/v1/app/user-login';
  static const userloginwithUID = '/api/v1/app/user-login-uid';
  static const userRegisterwithUID = '/api/v1/app/create-user-uid';
  static const userregister = '/api/v1/app/create-user';
  static const emailRegister = '/api/v1/app/user-email-register';
  static const forgotPassword = '/api/v1/app/forgot-password';
  static const updatePassword = '/api/v1/app/update-password';
  static const getUserProfile = '/api/v1/app/get-user-profile';
}

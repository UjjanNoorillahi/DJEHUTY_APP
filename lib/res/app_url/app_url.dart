class AppUrl {
  static const String baseUrl = 'http://3.141.13.123:3000/api';

  static const loginApi = '$baseUrl/auth/login';
  static const signupApi = '$baseUrl/auth/signup';
  static const createProfile = '$baseUrl/profile/create';
  static const fetchChats = '$baseUrl/chat-app/chats';
  static const verifyOTP = '$baseUrl/auth/verify-otp';
  static const checkScreenStatus = '$baseUrl/auth/check-screen-status';
  static const showProfile = '$baseUrl/profile/get/';
  static const uploadPhoto = '$baseUrl/upload';

  static String fetchMessages(String chatId) =>
      '$baseUrl/chat-app/messages/$chatId';
  static const fetchUsers = '$baseUrl/chat-app/chats/users';
  static String createChat(String receiverId) =>
      '$baseUrl/chat-app/chats/c/$receiverId';
  static String createGroupChat = '$baseUrl/chat-app/chats/group';
  static String deleteChat(String chatId) =>
      '$baseUrl/chat-app/chats/remove/$chatId';
  static String sendMessage(String chatId) =>
      '$baseUrl/chat-app/messages/$chatId';
}

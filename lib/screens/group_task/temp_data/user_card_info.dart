class UserCardInfo {
  final String userInfo;
  final String imagePath;
  final bool taskStatus;

  UserCardInfo(
    this.userInfo,
    this.imagePath, {
    this.taskStatus = true,
  });
}

List<UserCardInfo> userInfo = [
  UserCardInfo('Павел Антипов', 'assets/users/user1.png'),
  UserCardInfo('Юрий Капков', 'assets/users/user2.png'),
];

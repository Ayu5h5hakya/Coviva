class UserStat {
  final int likeCount;
  final int favoriteCount;

  UserStat({this.likeCount, this.favoriteCount});

  @override
  String toString() => 'UserStat(likeCount : $likeCount, favoriteCount : $favoriteCount)';
}
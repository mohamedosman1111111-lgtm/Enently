class UserModel {
  static UserModel? loggedUser;
  String id;
  String name;
  String email;
  List<String>favoriteEventsId;
  UserModel({
    required this.id,
    required this.name,
    required this.email,
     this.favoriteEventsId=const []
});
}
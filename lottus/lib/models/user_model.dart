class UserModel {
final String id;
final String name;
final String email;
final String photoUrl;
UserModel({
required this.id,
required this.name,
required this.email,
required this.photoUrl,
});
Map<String, dynamic> toMap() {
return {
'id': id,
'name': name,
'email': email,
'photoUrl': photoUrl,
};
}
}
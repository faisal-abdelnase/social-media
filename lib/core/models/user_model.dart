class UserModel {
  final String passowrd;
  final String email;
  final String userName;
  final String userImage;
  final String uID;
  final List followers;
  final List folloeing;

  UserModel({
    required this.passowrd, 
    required this.email, 
    required this.userName, 
    required this.userImage, 
    required this.uID, 
    required this.followers, 
    required this.folloeing});


    Map<String, dynamic> covertToMap(){

      return {
        "passowrd" : passowrd,
        "email" : email,
        "userName" : userName,
        "userImage" : userImage,
        "uID" : uID,
        "followers" : followers,
        "folloeing" : folloeing,
      };
    }


    factory UserModel.fromJeson(jesonData){

      return UserModel(
        passowrd: jesonData["passowrd"], 
        email: jesonData["email"], 
        userName: jesonData["userName"], 
        userImage: jesonData["userImage"], 
        uID: jesonData["uID"], 
        followers: jesonData["followers"], 
        folloeing: jesonData["folloeing"]
        );
    }
}
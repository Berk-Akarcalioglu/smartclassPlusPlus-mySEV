class Auth {

 var userID;

  void login(){
    print("Logged in");
    userID = 1;
  }

  void signOut(){
    print("Signed Out");
    userID = null;
  }

}
final Auth authServices = new Auth();
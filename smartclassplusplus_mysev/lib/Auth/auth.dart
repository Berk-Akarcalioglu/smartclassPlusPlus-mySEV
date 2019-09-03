import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rxdart/rxdart.dart';

FirebaseUser firestoreUser;

class AuthService {
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    signInOption: SignInOption.standard,
  );
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Firestore _db = Firestore.instance;

  Observable<FirebaseUser> user;
  Observable<Map<String, dynamic>> profile;
  PublishSubject loading = PublishSubject();

  AuthService() {
    user = Observable(_auth.onAuthStateChanged);

    profile = user.switchMap((FirebaseUser u) {
      if (u != null) {
        print("user is not  null");
        return _db
            .collection('users')
            .document(u.uid)
            .snapshots()
            .map((snap) => snap.data);
      } else {
        print("user is null");
        return Observable.just({});
      }
    });
  }

  Future<FirebaseUser> googleSignIn() async {
    loading.add(true);
    print("loading in googleSignIn()");
    GoogleSignInAccount googleUser;
    try {
      print("try catch google sign in");
      googleUser = await _googleSignIn.signIn();
    } catch (e) {
      print(e);
    } //try catch yap burayı
    print("google sign in");
    GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    print("google auth");

    final AuthCredential _credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    FirebaseUser user = await _auth.signInWithCredential(_credential);

    print("signin with google");

    print("signed in " + user.displayName);

    print(userID);

    firestoreUser = user;

    loading.add(false);
    return user;
  }

  var userID;

  void login() {
    print("Logged in");
    userID = 1;
  }

  void signOut() {
    print("signing out");
    _auth.signOut();
    _googleSignIn.disconnect();
    userID = null;
  }
}

final AuthService authService = new AuthService();

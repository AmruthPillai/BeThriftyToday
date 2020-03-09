import 'package:bethriftytoday/models/models.dart';
import 'package:bethriftytoday/services/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  static FirebaseAuth _auth = FirebaseAuth.instance;

  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: [
    'https://www.googleapis.com/auth/plus.me',
    'https://www.googleapis.com/auth/userinfo.email',
    'https://www.googleapis.com/auth/userinfo.profile',
  ]);

  Future<User> get getUser =>
      _auth.currentUser().then((user) => User.fromFirebaseUser(user));

  Stream<User> get user =>
      _auth.onAuthStateChanged.map((user) => User.fromFirebaseUser(user));

  Future<User> signInWithGoogle() async {
    try {
      AuthCredential credential = await getGoogleAuthCredential();
      AuthResult authResult = await _auth.signInWithCredential(credential);
      User user = await mapUserFromFirebaseUser(authResult);
      return user;
    } catch (e) {
      print(e.message);
      throw Exception('Something went horribly wrong, please try again later!');
    }
  }

  Future<AuthCredential> getGoogleAuthCredential() async {
    GoogleSignInAccount googleAccount = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleAuthentication =
        await googleAccount.authentication;
    AuthCredential credential = GoogleAuthProvider.getCredential(
      idToken: googleAuthentication.idToken,
      accessToken: googleAuthentication.accessToken,
    );
    return credential;
  }

  Future<User> signInAnonymously() async {
    try {
      AuthResult authResult = await _auth.signInAnonymously();
      User user = await mapUserFromFirebaseUser(authResult);
      return user;
    } catch (e) {
      print(e.message);
      throw Exception('Something went horribly wrong, please try again later!');
    }
  }

  Future<User> mapUserFromFirebaseUser(AuthResult authResult) async {
    FirebaseUser firebaseUser = authResult.user;
    User user = User.fromFirebaseUser(firebaseUser);
    try {
      if (!(await UserDatabaseService(user).checkIfUserExists)) {
        UserDatabaseService(user).createUser();
      }
    } catch (_) {}
    return user;
  }

  Future signOut() async {
    try {
      _googleSignIn.signOut();
      return await _auth.signOut();
    } catch (e) {
      print(e.message);
      throw Exception('Something went horribly wrong, please try again later!');
    }
  }

  Future deleteUser() async {
    FirebaseUser firebaseUser = await _auth.currentUser();
    if (firebaseUser.providerId != 'firebase') {
      AuthCredential credential = await getGoogleAuthCredential();
      AuthResult authResult = await _auth.signInWithCredential(credential);
      firebaseUser = authResult.user;
    }
    await firebaseUser.delete();
    signOut();
  }
}

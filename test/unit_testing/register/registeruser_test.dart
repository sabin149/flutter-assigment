import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/mocks/user_mocks.dart';
import 'package:frontend/model/register_model.dart';
import 'package:frontend/pages/shared/config.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'registeruser_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  late UserApiProvider apiProvider;
  late http.Client client;

  setUp(() {
    client = MockClient();
    apiProvider = UserApiProvider(client: client);
  });
  group('register', () {
    User user = User(
      fullname: "user20",
      username: "user20",
      email: "user20@gmail.com",
      password: "123456",
    );
    test('returns register successful', () async {
      when(client.post(Uri.parse(Config.apiURL + "register"), body: {
        "fullname": user.fullname,
        "username": user.username,
        "email": user.email,
        "password": user.password,
      })).thenAnswer(
          (_) async => http.Response('{"msg":"Register Success!"}', 200));

      final userdetails = await apiProvider.registerUser(user);
      expect(userdetails, isNotEmpty);
    });
  });
}

import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/mocks/user_mocks.dart';
import 'package:frontend/pages/shared/config.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'loginuser_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
late UserApiProvider apiProvider;
late http.Client client;

 setUp((){
client = MockClient();
apiProvider = UserApiProvider(client: client);
  });
  group('login', () {
    test('returns login successful', () async {
      when(client.post(Uri.parse(Config.apiURL + "login"),
          body: {"email": "user01@gmail.com", "password": "123456"}
  )).thenAnswer((_) async =>

              http.Response(
                '{"msg":"Login Success!"}',200),         
 );
      final userdetails = await apiProvider.loginUsers("user01@gmail.com", "123456");
      expect(userdetails, isNotEmpty);
 
    });
  });
}
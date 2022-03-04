import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/mocks/user_mocks.dart';
import 'package:frontend/model/user_model.dart';
import 'package:frontend/pages/shared/config.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'getuserdetails_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
late UserApiProvider apiProvider;
late http.Client client;

 setUp((){
client = MockClient();
apiProvider = UserApiProvider(client: client);
  });
  group('fetchuserDetails', () {
    test('returns userdetails successful', () async {
      when(
        client
              .get(Uri.parse(Config.apiURL + "user/" + "61b77a9fc2911ca494be991c"),

               headers: {'Authorization': Config.token}))
          .thenAnswer((_) async =>
          

              http.Response(
                '{"_id": "61b77a9fc2911ca494be991c","fullname": "user01","username": "user01","email": "user01@gmail.com"}',200),         
              
 );
   
      final userdetails = await apiProvider.getUserDetails("61b77a9fc2911ca494be991c");

      expect(userdetails,isA<UserModel>());
      expect(userdetails.email, 'user01@gmail.com');
      expect(userdetails.username, 'user01');
      expect(userdetails.fullname, 'user01');
    
    });

    test('throws an exception if the http call completes with an error', () {
      when(client
              .get(Uri.parse(Config.apiURL + "user/" + "61b77a9fc2911ca494be991c"),
               headers: {'Authorization': Config.token}))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      expect(apiProvider.getUserDetails("61b77a9fc2911ca494be991c"), throwsException);
    });
  });
}
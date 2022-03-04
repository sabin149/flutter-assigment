import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/mocks/post_mocks.dart';
import 'package:frontend/pages/shared/config.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'deletepost_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
late PostApiProvider apiProvider;
late http.Client client;

 setUp((){
client = MockClient();
apiProvider = PostApiProvider(client: client);
  });
  group('delete post', () {
    test('returns post delete successful', () async {
      when(client.delete( Uri.parse(Config.apiURL + "post/" + "621bc3a8e76f5ed4d7e18e6b"),
        headers: {'Authorization': Config.token}
  )).thenAnswer((_) async =>
              http.Response(
                '{"msg":"Deleted Post!"}',200),         
 );
      final postdetails = await apiProvider.deletePost("621bc3a8e76f5ed4d7e18e6b", "61c2077e95cec435cf79ba69");
      expect(postdetails, isNotEmpty);
    });
  });
}
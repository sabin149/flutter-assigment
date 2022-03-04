import 'package:flutter_test/flutter_test.dart';
import 'package:frontend/mocks/comment_mocks.dart';
import 'package:frontend/pages/shared/config.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'deletecomment_test.mocks.dart';


@GenerateMocks([http.Client])
void main() {
late CommentApiProvider apiProvider;
late http.Client client;

 setUp((){
client = MockClient();
apiProvider = CommentApiProvider(client: client);
  });
  group('delete comment', () {
    test('returns comment delete successful', () async {
      when(client.delete( Uri.parse(Config.apiURL + "comment/" + "621c5b82441dd6c6fc998902"),
        headers: {'Authorization': Config.token}
  )).thenAnswer((_) async =>
              http.Response(
                '{"msg":"Deleted Comment!"}',200),         
 );
   
      final commentdetails = await apiProvider.deleteComment("621c5b82441dd6c6fc998902");
      expect(commentdetails, isNotEmpty);
 
    });
  });
}
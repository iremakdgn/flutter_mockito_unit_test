import 'package:flutter_mockito_unit_test/api_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_mockito_unit_test/album_dto.dart';
import 'album_test.mocks.dart';

@GenerateMocks([ApiRepository])
void main() {
  MockApiRepository mockApiRepository = MockApiRepository();

  test('Get album list successfully', () async {
    when(mockApiRepository.fetchAlbum()).thenAnswer((realInvocation) => Future.value(AlbumDto(userId: 1, id: 1, title: "abc")));

    var result = await mockApiRepository.fetchAlbum();

    verify(await mockApiRepository.fetchAlbum());
    expect(result.id, 1);
    expect(result.title, "abc");
  });
}

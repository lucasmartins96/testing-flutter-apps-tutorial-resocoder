import 'package:flutter_testing_tutorial/news_change_notifier.dart';
import 'package:flutter_testing_tutorial/news_service.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_test/flutter_test.dart';

class MockNewsService extends Mock implements NewsService {}

void main() {
  late NewsChangeNotifier sut;
  late MockNewsService mockNewsService;

  setUp(() {
    mockNewsService = MockNewsService();
    sut = NewsChangeNotifier(mockNewsService);
  });

  test("Initial values are correct", () {
    expect(sut.articles, []);
    expect(sut.isLoading, false);
  });

  group('getArticles | ', () {
    test("gets articles using the NewsService", () async {
      when(() => mockNewsService.getArticles()).thenAnswer((_) async => []);
      await sut.getArticles();
      verify(() => mockNewsService.getArticles()).called(1);
    });
  });
}

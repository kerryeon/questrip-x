import 'package:meta/meta.dart';

/// 퀘스트 제출물에 대한 자세한 정보를 담고 있는 클래스입니다.
///
/// 담당자: 김호
///
class Submission {

  final int id;
  final int userId;
  final String nickname;
  final String imagePath;
  final int date;
  final int rating;

  const Submission({
    @required this.id,
    @required this.userId,
    @required this.nickname,
    @required this.imagePath,
    @required this.date,
    @required this.rating,
  })  : assert(id != null),
        assert(userId != null),
        assert(nickname != null),
        assert(imagePath != null),
        assert(date != null),
        assert(rating != null);

  int get year  => (this.date / 10000000000).round();
  int get month => ((this.date / 100000000) % 100).round();
  int get day   => ((this.date / 1000000) % 100).round();

  /// 서버로부터 전송받은 JSON 데이터를 해독합니다.
  static Submission fromJSON(Map<String, Object> response) => Submission(
      id: response['_id'],
      userId: response['user_id'],
      nickname: response['nickname'],
      imagePath: response['path'],
      date: response['date'],
      rating: response['rating'],
  );

  /// [a]와 [b]의 제출일자를 비교합니다.
  /// [b]가 더 최근에 제출됐으면 +를 반환합니다.
  /// 동점인 경우, 추천순으로 재정렬합니다.
  static int compareDate(Submission a, Submission b) =>
      b.date != a.date ? b.date - a.date : b.rating - a.rating;

  /// [a]와 [b]의 추천수를 비교합니다.
  /// [b]가 추천을 더 많이 받았다면 +를 반환합니다.
  /// 동점인 경우, 최신순으로 재정렬합니다.
  static int compareRating(Submission a, Submission b) =>
      b.rating != a.rating ? b.rating - a.rating : b.date - a.date;

}

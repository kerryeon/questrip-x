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

  /// 서버로부터 전송받은 JSON 데이터를 해독합니다.
  static Submission fromJSON(Map<String, Object> response) => Submission(
      id: response['_id'],
      userId: response['user_id'],
      nickname: response['nickname'],
      imagePath: response['path'],
      date: response['date'],
      rating: response['rating'],
  );

}

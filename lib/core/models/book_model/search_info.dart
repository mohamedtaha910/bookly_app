
import 'package:hive/hive.dart';
part 'search_info.g.dart';

@HiveType(typeId: 9)
class SearchInfo {
  @HiveField(0)
	String? textSnippet;

	SearchInfo({this.textSnippet});

	factory SearchInfo.fromJson(Map<String, dynamic> json) => SearchInfo(
				textSnippet: json['textSnippet'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'textSnippet': textSnippet,
			};
}

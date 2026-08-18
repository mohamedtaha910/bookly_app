
import 'package:hive/hive.dart';
part 'sale_info.g.dart';

@HiveType(typeId: 8) 
class SaleInfo {
  @HiveField(0)
	String? country;

  @HiveField(1)
	String? saleability;
	
  @HiveField(2)
  bool? isEbook;

  @HiveField(3)
	String? buyLink;

	SaleInfo({this.country, this.saleability, this.isEbook, this.buyLink});

	factory SaleInfo.fromJson(Map<String, dynamic> json) => SaleInfo(
				country: json['country'] as String?,
				saleability: json['saleability'] as String?,
				isEbook: json['isEbook'] as bool?,
				buyLink: json['buyLink'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'country': country,
				'saleability': saleability,
				'isEbook': isEbook,
				'buyLink': buyLink,
			};
}

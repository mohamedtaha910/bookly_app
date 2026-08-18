import 'package:hive/hive.dart';

import 'access_info.dart';
import 'sale_info.dart';
import 'search_info.dart';
import 'volume_info.dart';

part 'book_model.g.dart';

@HiveType(typeId: 0) 
class BookModel {
  @HiveField(0)
	String? kind;

  @HiveField(1)
	String? id;

  @HiveField(2)
	String? etag;

  @HiveField(3)
	String? selfLink;

  @HiveField(4)
	VolumeInfo volumeInfo;

  @HiveField(5)
	SaleInfo? saleInfo;

  @HiveField(6)
	AccessInfo? accessInfo;

  @HiveField(7)
	SearchInfo? searchInfo;

	BookModel({
		this.kind, 
		this.id, 
		this.etag, 
		this.selfLink, 
		required this.volumeInfo, 
		this.saleInfo, 
		this.accessInfo, 
		this.searchInfo, 
	});

	factory BookModel.fromJson(Map<String, dynamic> json) => BookModel(
				kind: json['kind'] as String?,
				id: json['id'] as String?,
				etag: json['etag'] as String?,
				selfLink: json['selfLink'] as String?,
				volumeInfo:  VolumeInfo.fromJson(json['volumeInfo'] as Map<String, dynamic>),
						
				saleInfo: json['saleInfo'] == null
						? null
						: SaleInfo.fromJson(json['saleInfo'] as Map<String, dynamic>),
				accessInfo: json['accessInfo'] == null
						? null
						: AccessInfo.fromJson(json['accessInfo'] as Map<String, dynamic>),
				searchInfo: json['searchInfo'] == null
						? null
						: SearchInfo.fromJson(json['searchInfo'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toJson() => {
				'kind': kind,
				'id': id,
				'etag': etag,
				'selfLink': selfLink,
				'volumeInfo': volumeInfo?.toJson(),
				'saleInfo': saleInfo?.toJson(),
				'accessInfo': accessInfo?.toJson(),
				'searchInfo': searchInfo?.toJson(),
			};
}

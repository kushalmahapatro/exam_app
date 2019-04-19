import 'package:exam_app/sdk/ApiUtils.dart';

Future<GetAppHomeFeatureModel> getAppHomeFeatureAPI(
    Map<String, String> parameters) async {
  try {
    return GetAppHomeFeatureModel.fromJSON(await request_POST_header(
        parameters: parameters, url: getAppHomeFeature()));
  } catch (e) {
    print(e);
  }
  return null;
}

class GetAppHomeFeatureModel {
  int code;
  String status;
  List<HomeFeaturePageBannerModel> bannerSectionList;
  String bannerText;
  int isFeatured;
  int sectionCount;
  List<HomeFeaturePageSectionModel> sectionName;

  GetAppHomeFeatureModel(
      {this.code,
      this.status,
      this.bannerSectionList,
      this.bannerText,
      this.isFeatured,
      this.sectionCount,
      this.sectionName});

  GetAppHomeFeatureModel.fromJSON(String json1) {
    Map<String, dynamic> json = (jsonDecode(json1) as Map);
    code = json['code'] ?? 0;
    status = json['status'] ?? "";
    bannerText = json['banner_text'] ?? "";
    isFeatured = json['is_featured'] ?? "";
    sectionCount = json['section_count'] ?? "";
    if (json['banner_section_list'] != null) {
      bannerSectionList = new List<HomeFeaturePageBannerModel>();
      json['banner_section_list'].forEach((v) {
        bannerSectionList.add(new HomeFeaturePageBannerModel.fromJson(v));
      });
    }
    if (json['section_name'] != null) {
      sectionName = new List<HomeFeaturePageSectionModel>();
      json['section_name'].forEach((v) {
        sectionName.add(new HomeFeaturePageSectionModel.fromJson(v));
      });
    }
  }
}

class HomeFeaturePageBannerModel {
  String imagePath;
  String bannerUrl;

  HomeFeaturePageBannerModel({this.imagePath, this.bannerUrl});

  HomeFeaturePageBannerModel.fromJson(Map<String, dynamic> json) {
    imagePath = json['image_path'] ?? "";
    bannerUrl = json['banner_url'] ?? "";
  }
}

class HomeFeaturePageSectionModel {
  String title;
  String sectionId;
  String sectionType;
  String total;
  List<HomeFeaturePageSectionDetailsModel> data;

  HomeFeaturePageSectionModel(
      {this.title, this.sectionId, this.sectionType, this.total, this.data});

  HomeFeaturePageSectionModel.fromJson(Map<String, dynamic> json) {
    title = json['title'] ?? "";
    sectionId = json['section_id'] ?? "";
    sectionType = json['section_type'] ?? "";
    total = json['total'] ?? "";
    if (json['data'] != null) {
      data = new List<HomeFeaturePageSectionDetailsModel>();
      json['data'].forEach((v) {
        data.add(new HomeFeaturePageSectionDetailsModel.fromJson(v));
      });
    }
  }
}

class HomeFeaturePageSectionDetailsModel {
  String permalink;
  String name;
  String contentTypesId;
  String posterUrl;
  String isEpisode;

  HomeFeaturePageSectionDetailsModel(
      {this.name,
      this.permalink,
      this.posterUrl,
      this.contentTypesId,
      this.isEpisode});

  HomeFeaturePageSectionDetailsModel.fromJson(Map<String, dynamic> json) {
    name = json['name'] ?? "";
    permalink = json['permalink'] ?? "";
    posterUrl = json['poster_url'] ?? "";
    contentTypesId = json['content_types_id'] ?? "";
    isEpisode = json['is_episode'] ?? "";
  }
}

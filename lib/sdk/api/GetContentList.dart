import 'package:exam_app/sdk/ApiUtils.dart';

Future<ContentListModel> getContentListApi(Map<String, String> parameters) async {
  try {
    return  ContentListModel.fromJson(await request_POST_header(parameters: parameters, url: getContentList()));
  } catch (e) {
    print(e);
  }
  return null;
}

class ContentListModel {
  String categoryId;
  String isFollowed;
  int status;
  String msg;
  List<MovieList> movieList;
  String orderby;
  String itemCount;
  String limit;
  Ads ads;
  String menuTitle;

  ContentListModel(
      {this.categoryId,
        this.isFollowed,
        this.status,
        this.msg,
        this.movieList,
        this.orderby,
        this.itemCount,
        this.limit,
        this.ads,
        this.menuTitle});

  ContentListModel.fromJson(String json1) {
    Map<String, dynamic> json = (jsonDecode(json1) as Map);
    categoryId = json['category_id'].toString() ?? "";
    isFollowed = json['isFollowed'].toString() ?? "";
    status = json['status'] ?? 0;
    msg = json['msg'].toString() ?? "";
    if (json['movieList'] != null) {
      movieList = new List<MovieList>();
      json['movieList'].forEach((v) {
        movieList.add(new MovieList.fromJson(v));
      });
    }
    orderby = json['orderby'].toString() ?? "";
    itemCount = json['item_count'].toString() ?? "";
    limit = json['limit'].toString() ?? "";
    ads = json['Ads'] != null ? new Ads.fromJson(json['Ads']) : null;
    menuTitle = json['menu_title'].toString() ?? "";
  }

}

class MovieList {
  String movieStreamUniqId;
  String movieId;
  String contentPublishDate;
  String movieStreamId;
  String isEpisode;
  String muviUniqId;
  String contentTypeId;
  String ppvPlanId;
  String permalink;
  String name;
  String fullMovie;
  String story;
  String genre;
  String releaseDate;
  String contentTypesId;
  String isConverted;
  String lastUpdatedDate;
  String contentLanguage;
  String censorRating;
  String isDownloadable;
  String custom1;
  String custom2;
  String custom3;
  String custom4;
  String custom5;
  String custom6;
  String custom7;
  String custom8;
  String custom9;
  String custom10;
  String movieid;
  String geocategoryId;
  String studioId;
  String categoryId;
  String countryCode;
  String ip;
  String posterUrl;
  String isFavorite;
  String isFreeContent;
  String embeddedUrl;
  String posterForTv;
  String posterUrlForTv;
  ViewStatus viewStatus;
  CustomMetaData customMetaData;
  Allposters allposters;

  MovieList(
      {this.movieStreamUniqId,
        this.movieId,
        this.contentPublishDate,
        this.movieStreamId,
        this.isEpisode,
        this.muviUniqId,
        this.contentTypeId,
        this.ppvPlanId,
        this.permalink,
        this.name,
        this.fullMovie,
        this.story,
        this.genre,
        this.releaseDate,
        this.contentTypesId,
        this.isConverted,
        this.lastUpdatedDate,
        this.contentLanguage,
        this.censorRating,
        this.isDownloadable,
        this.custom1,
        this.custom2,
        this.custom3,
        this.custom4,
        this.custom5,
        this.custom6,
        this.custom7,
        this.custom8,
        this.custom9,
        this.custom10,
        this.movieid,
        this.geocategoryId,
        this.studioId,
        this.categoryId,
        this.countryCode,
        this.ip,
        this.posterUrl,
        this.isFavorite,
        this.isFreeContent,
        this.embeddedUrl,
        this.posterForTv,
        this.posterUrlForTv,
        this.viewStatus,
        this.customMetaData,
        this.allposters});

  MovieList.fromJson(Map<String, dynamic> json) {
    movieStreamUniqId = json['movie_stream_uniq_id'].toString() ?? "";
    movieId = json['movie_id'].toString() ?? "";
    contentPublishDate = json['content_publish_date'].toString() ?? "";
    movieStreamId = json['movie_stream_id'].toString() ?? "";
    isEpisode = json['is_episode'].toString() ?? "";
    muviUniqId = json['muvi_uniq_id'].toString() ?? "";
    contentTypeId = json['content_type_id'].toString() ?? "";
    ppvPlanId = json['ppv_plan_id'].toString() ?? "";
    permalink = json['permalink'].toString() ?? "";
    name = json['name'].toString() ?? "";
    fullMovie = json['full_movie'].toString() ?? "";
    story = json['story'].toString() ?? "";
    genre = json['genre'].toString() ?? "";
    releaseDate = json['release_date'].toString() ?? "";
    contentTypesId = json['content_types_id'].toString() ?? "";
    isConverted = json['is_converted'].toString() ?? "";
    lastUpdatedDate = json['last_updated_date'].toString() ?? "";
    contentLanguage = json['content_language'].toString() ?? "";
    censorRating = json['censor_rating'].toString() ?? "";
    isDownloadable = json['is_downloadable'].toString() ?? "";
    custom1 = json['custom1'].toString() ?? "";
    custom2 = json['custom2'].toString() ?? "";
    custom3 = json['custom3'].toString() ?? "";
    custom4 = json['custom4'].toString() ?? "";
    custom5 = json['custom5'].toString() ?? "";
    custom6 = json['custom6'].toString() ?? "";
    custom7 = json['custom7'].toString() ?? "";
    custom8 = json['custom8'].toString() ?? "";
    custom9 = json['custom9'].toString() ?? "";
    custom10 = json['custom10'].toString() ?? "";
    movieid = json['movieid'].toString() ?? "";
    geocategoryId = json['geocategory_id'].toString() ?? "";
    studioId = json['studio_id'].toString() ?? "";
    categoryId = json['category_id'].toString() ?? "";
    countryCode = json['country_code'].toString() ?? "";
    ip = json['ip'].toString() ?? "";
    posterUrl = json['poster_url'].toString() ?? "";
    isFavorite = json['is_favorite'].toString() ?? "";
    isFreeContent = json['isFreeContent'].toString() ?? "";
    embeddedUrl = json['embeddedUrl'].toString() ?? "";
    posterForTv = json['posterForTv'].toString() ?? "";
    posterUrlForTv = json['poster_url_for_tv'].toString() ?? "";
    viewStatus = json['viewStatus'] != null
        ? new ViewStatus.fromJson(json['viewStatus'])
        : null;
    customMetaData = json['custom_meta_data'] != null
        ? new CustomMetaData.fromJson(json['custom_meta_data'])
        : null;
    allposters = json['allposters'] != null
        ? new Allposters.fromJson(json['allposters'])
        : null;
  }

}

class ViewStatus {
  String viewcount;
  String uniqViewCount;

  ViewStatus({this.viewcount, this.uniqViewCount});

  ViewStatus.fromJson(Map<String, dynamic> json) {
    viewcount = json['viewcount'].toString() ?? "";
    uniqViewCount = json['uniq_view_count'].toString() ?? "";
  }

}

class CustomMetaData {
  String episode;
  String season;
  String genr;
  String link;
  String censrRating;
  String censorRating1;

  CustomMetaData(
      {this.episode,
        this.season,
        this.genr,
        this.link,
        this.censrRating,
        this.censorRating1});

  CustomMetaData.fromJson(Map<String, dynamic> json) {
    episode = json['episode'].toString() ?? "";
    season = json['season'].toString() ?? "";
    genr = json['genr'].toString() ?? "";
    link = json['link'].toString() ?? "";
    censrRating = json['censr_rating'].toString() ?? "";
    censorRating1 = json['censor_rating1'].toString() ?? "";
  }

}

class Allposters {
  String original;
  String standard;
  String thumb;

  Allposters({this.original, this.standard, this.thumb});

  Allposters.fromJson(Map<String, dynamic> json) {
    original = json['original'].toString() ?? "";
    standard = json['standard'].toString() ?? "";
    thumb = json['thumb'].toString() ?? "";
  }

}

class Ads {
  String channelId;

  Ads({this.channelId});

  Ads.fromJson(Map<String, dynamic> json) {
    channelId = json['channelId'].toString() ?? "";
  }

}
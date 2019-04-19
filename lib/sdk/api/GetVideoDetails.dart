import 'package:exam_app/sdk/ApiUtils.dart';

Future<GetVideoDetails> getVideoDetailsApi(Map<String, String> parameters) async {
  try {
    return GetVideoDetails.fromJson(
        await request_POST_header(parameters: parameters, url: getVideoDetails()));
  } catch (e) {
    print(e);
  }
  return null;
}
class GetVideoDetails {
  IsWatermark isWatermark;
  String videoResolution;
  List<VideoDetails> videoDetails;
  String newvideoUrl;
  String isOffline;
  String studioApprovedUrl;
  String licenseUrl;
  String isFree;
  String purchaseStatus;
  int code;
  String status;
  String msg;
  String videoUrl;
  String thirdpartyUrl;
  String emedUrl;
  String trailerUrl;
  String trailerThirdpartyUrl;
  String embedTrailerUrl;
  String playedLength;
  List<SubTitle> subTitle;
  String streamingRestriction;
  String noStreamingDevice;
  String noOfViews;
  String downloadStatus;

  GetVideoDetails(
      {this.isWatermark,
        this.videoResolution,
        this.videoDetails,
        this.newvideoUrl,
        this.isOffline,
        this.studioApprovedUrl,
        this.licenseUrl,
        this.isFree,
        this.purchaseStatus,
        this.code,
        this.status,
        this.msg,
        this.videoUrl,
        this.thirdpartyUrl,
        this.emedUrl,
        this.trailerUrl,
        this.trailerThirdpartyUrl,
        this.embedTrailerUrl,
        this.playedLength,
        this.subTitle,
        this.streamingRestriction,
        this.noStreamingDevice,
        this.noOfViews,
        this.downloadStatus});

  GetVideoDetails.fromJson(String json1) {
    Map<String, dynamic> json = (jsonDecode(json1) as Map);
    isWatermark = json['is_watermark'] != null
        ? new IsWatermark.fromJson(json['is_watermark'])
        : null;
    videoResolution = json['videoResolution'].toString() ?? "";
    if (json['videoDetails'] != null) {
      videoDetails = new List<VideoDetails>();
      json['videoDetails'].forEach((v) {
        videoDetails.add(new VideoDetails.fromJson(v));
      });
    }
    newvideoUrl = json['newvideoUrl'].toString() ?? "";
    isOffline = json['is_offline'].toString() ?? "";
    studioApprovedUrl = json['studio_approved_url'].toString() ?? "";
    licenseUrl = json['licenseUrl'].toString() ?? "";
    isFree = json['is_free'].toString() ?? "";
    purchaseStatus = json['purchase_status'].toString() ?? "";
    code = json['code'] ?? "0";
    status = json['status'].toString() ?? "";
    msg = json['msg'].toString() ?? "";
    videoUrl = json['videoUrl'].toString() ?? "";
    thirdpartyUrl = json['thirdparty_url'].toString() ?? "";
    emedUrl = json['emed_url'].toString() ?? "";
    trailerUrl = json['trailerUrl'].toString() ?? "";
    trailerThirdpartyUrl = json['trailerThirdpartyUrl'].toString() ?? "";
    embedTrailerUrl = json['embedTrailerUrl'].toString() ?? "";
    playedLength = json['played_length'].toString() ?? "";
    if (json['subTitle'] != null) {
      subTitle = new List<SubTitle>();
      json['subTitle'].forEach((v) {
        subTitle.add(new SubTitle.fromJson(v));
      });
    }
    streamingRestriction = json['streaming_restriction'].toString() ?? "";
    noStreamingDevice = json['no_streaming_device'].toString() ?? "";
    noOfViews = json['no_of_views'].toString() ?? "";
    downloadStatus = json['download_status'].toString() ?? "";
  }

}

class IsWatermark {
  String status;
  String email;
  String ip;
  String date;

  IsWatermark({this.status, this.email, this.ip, this.date});


  IsWatermark.fromJson(Map<String, dynamic> json) {
    status = json['status'].toString() ?? "";
    email = json['email'].toString() ?? "";
    ip = json['ip'].toString() ?? "";
    date = json['date'].toString() ?? "";
  }
}

class VideoDetails {
  String resolution;
  String url;

  VideoDetails({this.resolution, this.url});

  VideoDetails.fromJson(Map<String, dynamic> json) {
    resolution = json['resolution'].toString() ?? "";
    url = json['url'].toString() ?? "";
  }

}

class SubTitle {
  String code;
  String url;
  String language;

  SubTitle({this.code, this.url, this.language});

  SubTitle.fromJson(Map<String, dynamic> json) {
    code = json['resolution'].toString() ?? "";
    url = json['url'].toString() ?? "";
    language = json['language'].toString() ?? "";
  }

}
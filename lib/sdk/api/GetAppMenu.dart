import 'package:exam_app/sdk/ApiUtils.dart';

Future<GetAppMenuModel> getAppMenuModel(Map<String, String> parameters) async {
  try {
    return GetAppMenuModel.fromJson(
        await request_POST_header(parameters: parameters, url: getAppMenu()));
  } catch (e) {
    print(e);
  }
  return null;
}

class GetAppMenuModel {
  int code;
  String status;
  List<MenuItems> menuItems;
  List<FooterMenu> footerMenu;

  GetAppMenuModel({this.code, this.status, this.menuItems, this.footerMenu});

  GetAppMenuModel.fromJson(String json1) {
    Map<String, dynamic> json = (jsonDecode(json1) as Map);
    code = json['code'] ?? 0;
    status = json['status'] ?? "";
    if (json['menu_items'] != null) {
      menuItems = new List<MenuItems>();
      json['menu_items'].forEach((v) {
        menuItems.add(new MenuItems.fromJson(v));
      });
    }
    if (json['footer_menu'] != null) {
      footerMenu = new List<FooterMenu>();
      json['footer_menu'].forEach((v) {
        footerMenu.add(new FooterMenu.fromJson(v));
      });
    }
  }
}

class ChildMenuItems {
  int id;
  String title;
  int parentId;
  String linkType;
  String permalink;
  String value;
  int idSeq;
  int languageId;
  int languageParentId;

  ChildMenuItems(
      {this.id, this.title, this.parentId,
       this.linkType,
      this.permalink,
      this.value,
      this.idSeq,
      this.languageId,
      this.languageParentId});

  ChildMenuItems.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    title = json['title'] ?? "";
    parentId = json['parent_id'] ?? 0;
    linkType = json['link_type'] ?? "";
    permalink = json['permalink'] ?? "";
    value = json['value'] ?? "";
    idSeq = json['id_seq'] ?? 0;
    languageId = json['language_id'] ?? 0;
    languageParentId = json['language_parent_id'] ?? 0;
  }
}

class MenuItems {
  int id;
  String title;
  int parentId;
  String linkType;
  String permalink;
  String value;
  int idSeq;
  int languageId;
  int languageParentId;
  List<ChildMenuItems> child;
  String categoryId;
  int isSubcategoryPresent;

  MenuItems(
      {this.id,
      this.title,
      this.parentId,
      this.linkType,
      this.permalink,
      this.value,
      this.idSeq,
      this.languageId,
      this.languageParentId,
      this.child,
      this.categoryId,
      this.isSubcategoryPresent});

  MenuItems.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    title = json['title'] ?? "";
    parentId = json['parent_id'] ?? 0;
    linkType = json['link_type'] ?? "";
    permalink = json['permalink'] ?? "";
    value = json['value'] ?? "";
    idSeq = json['id_seq'] ?? 0;
    languageId = json['language_id'] ?? 0;
    languageParentId = json['language_parent_id'] ?? 0;
    if (json['child'] != null) {
      child = new List<ChildMenuItems>();
      json['child'].forEach((v) {
        child.add(new ChildMenuItems.fromJson(v));
      });
    }
    categoryId = json['category_id'].toString() ?? "";
    isSubcategoryPresent = json['isSubcategoryPresent'] ?? 0;
  }
}

class FooterMenu {
  String domain;
  String linkType;
  String id;
  String displayName;
  String permalink;
  String url;

  FooterMenu(
      {this.domain,
      this.linkType,
      this.id,
      this.displayName,
      this.permalink,
      this.url});

  FooterMenu.fromJson(Map<String, dynamic> json) {
    domain = json['domain'] ?? "";
    linkType = json['link_type'] ?? "";
    id = json['id'] ?? "";
    displayName = json['display_name'] ?? "";
    permalink = json['permalink'] ?? "";
    url = json['url'] ?? "";
  }
}

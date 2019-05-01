class AcessorLogin{
  static AcessorLogin _instance;


  AcessorLogin() {
  }

  static AcessorLogin getInstance() {
    _instance ??= AcessorLogin();
    return _instance;
  }
}
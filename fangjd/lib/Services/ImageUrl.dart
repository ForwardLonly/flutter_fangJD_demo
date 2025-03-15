class Imageurl {
  static String getUrl(String url) {
    if (url.isNotEmpty) {
      var newUrl = url.replaceAll("\\", "/");
    return 'https://jdmall.itying.com/$newUrl';
    } else {
      return "";
    }
  }
}
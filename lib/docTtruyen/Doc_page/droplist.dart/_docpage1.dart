class DocPagea {
  late String chapter;
  late String url;
  DocPagea({
    required this.chapter,
    required this.url,
  });

  static List<DocPagea> lstChapter() {
    return [
      DocPagea(
          chapter: 'Chapter 1',
          url:
              'http://www.nettruyenvip.com/truyen-tranh/anh-hung-onepunch/chap-1/80034'),
      DocPagea(
          chapter: 'Chapter 2',
          url:
              'http://www.nettruyenvip.com/truyen-tranh/anh-hung-onepunch/chap-2/80035'),
      DocPagea(
          chapter: 'Chapter 3',
          url:
              'http://www.nettruyenvip.com/truyen-tranh/anh-hung-onepunch/chap-3/80036'),
    ];
  }
}

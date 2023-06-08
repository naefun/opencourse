class LessonNote {
  String _title = "";
  String _content = "";

  LessonNote(String title, String content){
    _title = title;
    _content = content;
  }

  String getTitle(){
    return _title;
  }

  String getContent(){
    return _content;
  }

  void setContent(String content) {
    _content = content;
  }
}

class ActionItemBean{
  String title;
  String coverImage;
  String bodyDescription;
  String exerciseDescription;

  ActionItemBean(this.title, this.coverImage, this.bodyDescription,
      this.exerciseDescription);

  @override
  String toString() {
    return 'ActionItemBean{title: $title, coverImage: $coverImage, bodyDescription: $bodyDescription, exerciseDescription: $exerciseDescription}';
  }


}
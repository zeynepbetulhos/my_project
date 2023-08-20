class ContentModel {
  final String imagePath;
  final String title;
  final String description;
  final String liked;
  final String seen;

  ContentModel({
    required this.imagePath,
    required this.title,
    required this.description,
    required this.liked,
    required this.seen,
  });

}

List<ContentModel> getList(){
  return [
    ContentModel(imagePath:'assets/plant.jpg', title: 'Dangling train', description: 'On the swaying train, I seem to think a lot about things.', liked: '259', seen: '2356'),
    ContentModel(imagePath: 'assets/sunset.jpg', title: 'Forest of Love', description: 'Love for life. It is love that makes us meet.', liked: '315', seen: '2689'),
    ContentModel(imagePath: 'assets/airplane.jpg', title: 'Somwhere else', description: 'Emotions are neither future nor past', liked: '518', seen: '3590'),
    ContentModel(imagePath: 'assets/chair.jpg', title: 'At first you hated it', description: 'You cant start wihout them', liked: '300', seen: '3789'),
  ];
}
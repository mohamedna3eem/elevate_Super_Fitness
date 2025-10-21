import 'package:equatable/equatable.dart';

class OnBoardingPageViewContentModel extends Equatable {
  final String image;
  final String title;
  final String desc;

  const OnBoardingPageViewContentModel({
    required this.image,
    required this.title,
    required this.desc,
  });
  
  @override
  List<Object?> get props => [image, title, desc];
}

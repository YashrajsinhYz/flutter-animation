class OnboardingModel {
  final String link;
  final String title;
  final String subTitle;

  OnboardingModel({
    required this.link,
    required this.title,
    required this.subTitle,
  });
}

List onBoardingItems = [
  OnboardingModel(
      title: "Start Journey",
      link: "https://lottie.host/172d0f07-296d-41d9-b94c-a6f2fe7f09be/Ai54NeM4is.json",
      subTitle: "When you make a journey, \nyou travel from one place to another \n place to enjoy."),
  OnboardingModel(
      title: "Continue",
      link: "https://lottie.host/b3b45a58-fe49-4f87-987f-405c98e5eec1/bSNbeglO0C.json",
      subTitle: "We make it simple to find the \nbest way to travel. Every journey \nis not easy."),
  OnboardingModel(
      title: "Final Point",
      link: "https://lottie.host/2de75391-acb5-483d-a173-2b6d57af8d13/GiIuccc6Tf.json",
      subTitle: "Dream point every rider, \n during the journey of every place and point."),
];

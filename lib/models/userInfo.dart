
class userInfo {
  final String email;
  final String fName;
  final String country;
  final String numOfParts;
  final String selectedParts;
  final int totalScore;
  final String image;
  final String dailyTime;

  userInfo({
    this.email = 'aaa',
    this.fName = 'aaa',
    this.country = 'aaa',
    this.numOfParts = 'aaa',
    this.selectedParts = '111',
    this.totalScore = 0,
    this.image = 'aaa',
    this.dailyTime = 'aaa',
  });

  factory userInfo.fromJson(jsonData) {
    return userInfo(
      email: jsonData['email'],
      fName: jsonData['firstName'],
      country: jsonData['country'],
      numOfParts: jsonData['numOfParts'],
      selectedParts: jsonData['selectedParts'] ,
      totalScore: jsonData['totalScore'],
      image: jsonData['image'],
      dailyTime: jsonData['dailyTime'],
    );
  }

  @override
  String toString() {
    // TODO: implement toString
    return 'UserInfo(email: $email, firstName:$fName, country: $country, numOfParts: $numOfParts, selectedParts: $selectedParts, totalScore:$totalScore, image:$image, dailyTime:$dailyTime)';
  }
}

class Question {
  final String text;
  final List<Option> options;
  bool isLocked;
  Option? selectedOption;

  Question(
      {required this.text,
      required this.options,
      this.isLocked = false,
      this.selectedOption});
}

class Option {
  final String text;
  final bool isCorrect;

  Option({required this.text, required this.isCorrect});
}

final questions = [
  Question(
      text:
          'قال تعالى: \n ( إنّ الّذين كفروا سواءٌ عليهم أأنذرتهم أم لم تنذرهم ............... )',
      options: [
        Option(text: 'لا يؤمنون', isCorrect: true),
        Option(text: 'لا يهتدون', isCorrect: false),
        Option(text: 'لا يكفرون', isCorrect: false),
        Option(text: 'لا يستوون', isCorrect: false),
      ]),
  Question(
      text:
          'قال تعالى: \n (يا بني إسرائيل اذكروا نعمتي الّتي أنعمت عليكم وأنّي فضّلتكم على ..........)',
      options: [
        Option(text: 'المتقين', isCorrect: false),
        Option(text: 'الناس', isCorrect: false),
        Option(text: 'العالمين', isCorrect: true),
        Option(text: 'المؤمنين', isCorrect: false),
      ]),
  Question(
      text: 'قال تعالى: \n ثمّ عفونا عنكم من بعد ذلك لعلّكم ..........',
      options: [
        Option(text: 'تهتدون', isCorrect: false),
        Option(text: 'تشكرون', isCorrect: true),
        Option(text: 'تتقون', isCorrect: false),
        Option(text: 'تؤمنون', isCorrect: false),
      ]),
  Question(
      text:
          'قال تعالى: \n (قالوا ادعُ لنا ربك يبين لنا ما هي إن البقر تشابه علينا وإنا إن شاء الله ..........)',
      options: [
        Option(text: 'لفاعلون', isCorrect: false),
        Option(text: 'لمؤمنون', isCorrect: false),
        Option(text: 'لتائبون', isCorrect: false),
        Option(text: 'لمهتدون', isCorrect: true),
      ]),
  Question(
      text:
          'قال تعالى: \n ولقد جاءكم موسى .......... ثم اتخذتم العجل من بعده وأنتم ظالمون',
      options: [
        Option(text: 'بالبينات', isCorrect: true),
        Option(text: 'بالمعجزات', isCorrect: false),
        Option(text: 'بالكتاب', isCorrect: false),
        Option(text: 'بالآيات', isCorrect: false),
      ]),
  Question(
      text:
          'قال تعالى: \n  قل من كان عدوّا .......... فإنه نزله على قلبك بإذن الله مصدقا لما يديه وهدىً وبشرى للمؤمنين)',
      options: [
        Option(text: 'لرسوله', isCorrect: false),
        Option(text: 'لله', isCorrect: false),
        Option(text: 'لجبريل', isCorrect: true),
        Option(text: 'لميكال', isCorrect: false),
      ]),
];

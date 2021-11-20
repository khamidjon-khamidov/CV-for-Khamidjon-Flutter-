part of skills_page;

class _SkillName extends StatelessWidget {
  final String name;
  final bool isAnimatable;

  _SkillName(
    this.name,
    this.isAnimatable, {
    Key? key,
  }) : super(key: key);

  final List<Color> colorizeColors = [
    Colors.purple,
    Colors.blue,
    Colors.yellow,
    Colors.red,
  ];

  final TextStyle colorizeTextStyle = TextStyle(
    fontSize: 18.sp,
    // fontFamily: GoogleFonts.aldrichTextTheme().headline1!.fontFamily,
  );

  @override
  Widget build(BuildContext context) {
    return isAnimatable
        ? AnimatedTextKit(
            animatedTexts: [
              ColorizeAnimatedText(
                name,
                speed: Duration(milliseconds: 200),
                textStyle: GoogleFonts.aldrich().copyWith(fontSize: 24.sp),
                colors: [
                  Theme.of(context).colorScheme.secondary,
                  Theme.of(context).errorColor,
                  Theme.of(context).primaryColorDark,
                ],
              ),
            ],
            totalRepeatCount: 3,
          )
        : Text(
            name,
            style: GoogleFonts.aldrich().copyWith(
              fontSize: 24.sp,
              color: Theme.of(context).colorScheme.secondary,
            ),
          );
  }
}

// class _SkillName extends StatefulWidget {
//   final String name;
//   _SkillName(this.name, {Key? key}) : super(key: key);
//
//   @override
//   _SkillNameState createState() => _SkillNameState();
// }
//
// class _SkillNameState extends State<_SkillName> {
//   late List<Color> colorizeColors = [
//     Colors.purple,
//     Colors.blue,
//     Colors.yellow,
//     Colors.red,
//   ];
//
//   TextStyle colorizeTextStyle = TextStyle(
//     fontSize: 30.sp,
//     // fontFamily: 'Horizon',
//   );
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     logger.d(widget.name);
//     return AnimatedTextKit(
//       repeatForever: true,
//       key: Key('${Random().nextInt(10000000)}'),
//       animatedTexts: [
//         ColorizeAnimatedText(
//           widget.name,
//           // speed: Duration(seconds: 1),
//           textStyle: TextStyle(
//             fontSize: 30.sp,
//             // fontFamily: 'Horizon',
//           ),
//           colors: colorizeColors,
//         ),
//       ],
//     );
//   }
// }

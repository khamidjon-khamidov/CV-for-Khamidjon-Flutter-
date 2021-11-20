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
                  Theme.of(context).colorScheme.warning,
                  Theme.of(context).colorScheme.success,
                ],
              ),
            ],
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

part of skills_page;

class _SkillDescription extends StatelessWidget {
  final List<String> descriptions;
  final bool isAnimatable;
  _SkillDescription(
    this.descriptions,
    this.isAnimatable, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.w),
      child: Wrap(
        children: descriptions
            .map((description) => Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                  child: ShakeAnimatedWidget(
                    enabled: isAnimatable,
                    shakeAngle: Rotation.deg(z: 1),
                    curve: Curves.linear,
                    duration: Duration(milliseconds: 500),
                    child: Text(
                      description,
                      style: GoogleFonts.aBeeZee().copyWith(
                        color: Theme.of(context).colorScheme.mediumEmphasisTextDark,
                      ),
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
}

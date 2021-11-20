part of skills_page;

class _SkillItem extends StatelessWidget {
  final Skill skill;
  final bool isAnimatable;

  _SkillItem(
    this.skill, {
    this.isAnimatable = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      elevation: 15.r,
      child: Container(
        width: width,
        child: Column(
          children: [
            SizedBox(height: 16.h),
            _SkillName(
              skill.name,
              isAnimatable,
              key: Key('name widget: ${skill.id}:${isAnimatable}'),
            ),
            SizedBox(height: 16.h),
            _SkillPercentage(
              skill.percentage,
              isAnimatable,
              Theme.of(context),
              key: Key('percentage widget: ${skill.id}:${isAnimatable}'),
            ),
            SizedBox(height: 20.h),
            _SkillDescription(
              skill.descriptions,
              isAnimatable,
              key: Key(
                'description widget: ${skill.id}:${isAnimatable}',
              ),
            ),
            SizedBox(height: 16.h),
          ],
        ),
      ),
    );
  }
}

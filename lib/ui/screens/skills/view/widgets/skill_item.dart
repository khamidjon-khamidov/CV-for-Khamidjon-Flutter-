part of skills_page;

class _SkillItem extends StatelessWidget {
  final Skill skill;

  _SkillItem(this.skill, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return ScaleTap(
      onPressed: () {},
      scaleMinValue: 0.9,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.r),
        ),
        elevation: 15.r,
        child: Container(
          width: width,
          child: Column(
            children: [
              SizedBox(height: 8.h),
              _SkillName(skill.name),
              SizedBox(height: 8.h),
              Text(
                skill.name,
                style: GoogleFonts.aldrich().copyWith(
                  fontSize: 24.sp,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
              SizedBox(height: 20.h),
              SizedBox(height: 80.h),
            ],
          ),
        ),
      ),
    );
  }
}

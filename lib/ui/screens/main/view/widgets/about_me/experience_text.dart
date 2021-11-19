part of home_pages;

class _ExperienceText extends StatelessWidget {
  const _ExperienceText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          S.current.development_experience,
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
            fontSize: 18.sp,
          ),
        ),
        SizedBox(height: 12.h),
        Padding(
          padding: EdgeInsets.only(left: 18.w),
          child: Text(
            S.current.experience_details,
            style: TextStyle(
              height: 1.5.h,
              color: Theme.of(context).textTheme.headline1!.color!,
              fontSize: 16.sp,
            ),
          ),
        ),
      ],
    );
  }
}

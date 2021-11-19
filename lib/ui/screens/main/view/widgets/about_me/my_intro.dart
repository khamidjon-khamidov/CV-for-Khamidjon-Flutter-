part of home_pages;

class _MyIntro extends StatelessWidget {
  const _MyIntro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.current.my_intro,
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
            fontSize: 24.sp,
          ),
        ),
        SizedBox(height: 12.h),
        Text(
          S.current.experience_description,
          style: TextStyle(
            color: Theme.of(context).textTheme.headline5!.color!,
            fontSize: 16.sp,
          ),
        ),
        SizedBox(height: 16.h),
      ],
    );
  }
}

part of home_pages;

class _TopTitle extends StatelessWidget {
  const _TopTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(height: 20.h),
        Center(
          child: Text(
            S.current.hiI_am,
            style: TextStyle(
              fontSize: 18.sp,
              color: Theme.of(context).textTheme.headline5!.color!,
            ),
          ),
        ),
        SizedBox(height: 15.h),
        Center(
          child: ScaleTap(
            onPressed: () {},
            scaleMinValue: 0.7,
            child: Text(
              S.current.my_name,
              style: GoogleFonts.aBeeZee().copyWith(
                fontSize: 24.sp,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

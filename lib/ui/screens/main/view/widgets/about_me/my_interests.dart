part of home_pages;

class _MyInterests extends StatelessWidget {
  const _MyInterests({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).my_interests,
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
            fontSize: 18.sp,
          ),
        ),
        SizedBox(height: 12.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _Interest(
              title: S.current.chess,
              icon: FontAwesomeIcons.chess,
            ),
            _Interest(
              title: S.current.travel,
              icon: FontAwesomeIcons.map,
            ),
            _Interest(
              title: S.current.film,
              icon: FontAwesomeIcons.film,
            ),
            _Interest(
              title: S.current.music,
              icon: FontAwesomeIcons.music,
            ),
          ],
        )
      ],
    );
  }
}

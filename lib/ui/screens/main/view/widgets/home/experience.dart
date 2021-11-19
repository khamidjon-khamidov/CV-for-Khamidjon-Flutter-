part of home_pages;

class _Experience extends StatelessWidget {
  final String title;
  final String path;
  final double paddingHorizontal;
  final double paddingVertical;

  _Experience({
    required this.title,
    required this.path,
    this.paddingHorizontal = 0,
    this.paddingVertical = 0,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30.r,
          backgroundColor: Theme.of(context).colorScheme.secondary,
          // backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          // backgroundImage: AssetImage(path),
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: paddingVertical,
              horizontal: paddingHorizontal,
            ),
            child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                  AppColors.textOnPrimaryDark,
                  // Theme.of(context).textTheme.headline1!.color!,
                  // Theme.of(context).colorScheme.secondary,
                  BlendMode.srcATop,
                ),
                child: Image.asset(path)),
          ),
        ),
        SizedBox(height: 6.h),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 6.h),
      ],
    );
  }
}

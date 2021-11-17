part of home_pages;

class _Experience extends StatelessWidget {
  final String title;
  final String path;
  final double padding;

  _Experience({
    required this.title,
    required this.path,
    this.padding = 0,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: Theme.of(context).colorScheme.secondary,
          // backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          // backgroundImage: AssetImage(path),
          child: Padding(
            padding: EdgeInsets.all(padding),
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
        SizedBox(height: 6),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 6),
      ],
    );
  }
}

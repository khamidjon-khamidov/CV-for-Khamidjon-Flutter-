part of home_pages;

class _ContactLink extends StatelessWidget {
  final String title;
  final String link;
  final IconData icon;

  _ContactLink({
    required this.title,
    required this.link,
    required this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaleTap(
      scaleMinValue: 0.7,
      onPressed: () async => await canLaunch(link) ? await launch(link) : () {},
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
            icon: FaIcon(
              icon,
              color: Theme.of(context).colorScheme.secondary,
              size: 24.w,
            ),
            onPressed: null,
          ),
          Text(
            title,
            style: TextStyle(fontSize: 12.sp),
          ),
        ],
      ),
    );
  }
}

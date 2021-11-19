part of home_pages;

class _Interest extends StatelessWidget {
  final String title;
  final IconData icon;
  _Interest({
    required this.title,
    required this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: FaIcon(
            icon,
            color: Theme.of(context).colorScheme.secondary,
            size: 18.r,
          ),
          onPressed: null,
        ),
        Text(
          title,
          style: TextStyle(fontSize: 16.sp),
        ),
      ],
    );
  }
}

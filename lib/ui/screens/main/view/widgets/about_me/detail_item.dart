part of home_pages;

class _DetailItem extends StatelessWidget {
  final String title;
  final String detail;
  final IconData icon;

  _DetailItem({
    required this.title,
    required this.detail,
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
            size: 20.r,
          ),
          onPressed: () {},
        ),
        Text(
          '$title:    ',
          style: TextStyle(
            color: Theme.of(context).splashColor,
            fontWeight: FontWeight.w500,
            fontSize: 18.sp,
          ),
        ),
        Text(
          detail,
          style: TextStyle(fontSize: 18.sp),
        ),
      ],
    );
  }
}

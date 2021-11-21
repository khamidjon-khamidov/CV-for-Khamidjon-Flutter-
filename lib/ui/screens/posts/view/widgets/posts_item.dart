part of posts_page;

class _PostItem extends StatelessWidget {
  final Post post;

  const _PostItem(
    this.post, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
        side: BorderSide(
          color: Theme.of(context).colorScheme.secondary,
          width: 1.0.w,
        ),
      ),
      elevation: 15.r,
      child: Column(
        children: [
          Container(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: CachedNetworkImage(
                imageUrl: post.link,
                // imageBuilder: (context, imageProvider) => Container(
                //   width: width,
                //   height: 600,
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(12.r),
                //     shape: BoxShape.rectangle,
                //     image: DecorationImage(
                //       image: imageProvider,
                //       fit: BoxFit.cover,
                //     ),
                //   ),
                // ),
              ),
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            post.title,
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
              fontSize: 16.sp,
            ),
          ),
          SizedBox(height: 8.h),
        ],
      ),
    );
  }
}

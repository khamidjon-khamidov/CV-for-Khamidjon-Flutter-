part of home_pages;

class _ImageExperience extends StatelessWidget {
  final String pictureLink;
  _ImageExperience({
    required this.pictureLink,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600.h,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 550.h,
              child: CachedNetworkImage(
                imageUrl: pictureLink,
                placeholder: (_, __) {
                  return Container();
                },
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Row(
              children: [
                Spacer(),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(55.r),
                  ),
                  // color: Theme.of(context).scaffoldBackgroundColor,
                  elevation: 10,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 30.w,
                      vertical: 12.h,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _Experience(
                          path: AppImages.mobileDevelopment,
                          title: S.current.mobile_development,
                          paddingHorizontal: 10.w,
                          paddingVertical: 10.h,
                        ),
                        SizedBox(width: 30.w),
                        _Experience(
                          path: AppImages.algorithms,
                          title: S.current.algorithms_cc,
                        ),
                        SizedBox(width: 30.w),
                        _Experience(
                          path: AppImages.webDevelopment,
                          title: S.current.web_development,
                        ),
                      ],
                    ),
                  ),
                ),
                Spacer(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

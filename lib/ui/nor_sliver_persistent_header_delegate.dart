import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_video_world/constant/data.dart';
import 'package:flutter_video_world/utils/utils_app.dart';

class TabBarSliverVerticalDelegate extends SliverPersistentHeaderDelegate {
  final TabBar _child;

  TabBarSliverVerticalDelegate(this._child);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Column(
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(
              right: AppUtils.instance.setWidth(SizeConstant.allBorderMargin),
              left: AppUtils.instance.setWidth(SizeConstant.allBorderMargin)),
          color: Colors.white,
          child: _child,
        ),
        Container(
          height: 0.1,
          color: Colors.grey,
        )
      ],
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => this._child.preferredSize.height;

  @override
  // TODO: implement minExtent
  double get minExtent => this._child.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

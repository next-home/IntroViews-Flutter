import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intro_views_flutter/Models/page_bubble_view_model.dart';

/// This class contains the UI for page bubble.
class PageBubble extends StatelessWidget {
  //view model
  final PageBubbleViewModel viewModel;

  //Constructor
  PageBubble({
    this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //width: 55.0,
      height: 65.0,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 10.0),
          child: Container(
            width: lerpDouble(
                12.0,
                32.0,
                viewModel
                    .activePercent), //This method return in between values according to active percent.
            height: 4.0,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              //Alpha is used to create fade effect for background color
              color: viewModel.activePercent == 0.0
                  ? Colors.grey
                  : viewModel.bubbleBackgroundColor,
              borderRadius: BorderRadius.circular(4.0)//Border
            ), //BoxDecoration
            child: Opacity(
              opacity: viewModel.activePercent,
              child: (viewModel.iconAssetPath != null &&
                      viewModel.iconAssetPath != "")
                  // ignore: conflicting_dart_import
                  ? Image.asset(
                      viewModel.iconAssetPath,
                      color: viewModel.iconColor,
                    )
                  : viewModel.bubbleInner != null
                      ? Transform.scale(
                          scale: viewModel.activePercent.clamp(0.5, 1.0),
                          child: viewModel.bubbleInner,
                        )
                      : Container(),
            ), //opacity
          ), //Container
        ), //Padding
      ), //Center
    ); //Container
  }
}

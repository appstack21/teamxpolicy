import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../constants/style.dart';

Widget getTileView(String title, String value) {
  return Padding(
    padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            title,
            style: TXPTextStyle.getTextStyle(
                size: 16, weight: FontWeight.normal, color: Colors.black),
          ),
        ),
        const SizedBox(
          width: 55,
        ),
        Text(
          value,
          style: TXPTextStyle.getTextStyle(
              size: 16, weight: FontWeight.bold, color: Colors.black),
        ),
      ],
    ),
  );
}

Widget dividerView() {
  return Container(
    height: 1,
    color: const Color(0XFFD7D7D7),
  );
}

Widget getDownloadTileView(
    String title, String value, bool isDownloaded, Function downloadCallBack) {
  return Padding(
    padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TXPTextStyle.getTextStyle(
              size: 16, weight: FontWeight.normal, color: Colors.black),
        ),
        GestureDetector(
          onTap: () => {downloadCallBack()},
          child: Row(
            children: [
              isDownloaded
                  ? const Icon(Icons.download_done)
                  : const Image(
                      width: 15,
                      height: 15,
                      color: Color(0XFF150F96),
                      image: AssetImage('assets/images/download.png',
                          package: 'teamxpolicy')),
              const SizedBox(
                width: 10,
              ),
              Text(
                value,
                style: const TextStyle(
                    fontSize: 16,
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.normal,
                    color: Color(0XFF150F96)),
              ),
            ],
          ),
        )
      ],
    ),
  );
}

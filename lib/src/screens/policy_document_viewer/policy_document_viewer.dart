import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pdf_viewer_plugin/pdf_viewer_plugin.dart';

class TXPPolicyDocumentView extends StatefulWidget {
  const TXPPolicyDocumentView({Key? key, required this.documentPath})
      : super(key: key);
  final String documentPath;

  @override
  State<TXPPolicyDocumentView> createState() => _TXPPolicyDocumentViewState();
}

class _TXPPolicyDocumentViewState extends State<TXPPolicyDocumentView> {
  @override
  void initState() {
    super.initState();
  }

  void didTapBackButton() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black.withOpacity(0.5),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.transparent,
          actions: const [],
          toolbarHeight: 0,
          elevation: 0,
        ),
        body: Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(8.0))),
            margin:
                const EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 32),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        onPressed: () => {Navigator.pop(context)},
                        icon: const Icon(
                          Icons.close,
                          size: 36,
                        )),
                  ],
                ),
                Expanded(child: PdfView(path: widget.documentPath))
              ],
            )));
  }
}

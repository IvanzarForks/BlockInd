// Copyright (c) 2017, ivan. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:mdl/mdl.dart';
import 'package:markdown/markdown.dart';

import 'dart:html';

import 'Application.dart';

main() async {
  registerMdl();

  await componentFactory().rootContext(Application).run();

  querySelector(".page-content").innerHtml = markdownToHtml('',
      blockSyntaxes: [const TableSyntax()]);
}
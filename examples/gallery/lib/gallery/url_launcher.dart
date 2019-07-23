// Copyright 2019 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:html' show window;

/// A flutter_web hack to allow launching urls.
Future<void> launch(String url,
    {bool forceSafariVC: false, bool forceWebView: true}) async {
  window.open(url, '');
}

bool canLaunch(String url) => true;

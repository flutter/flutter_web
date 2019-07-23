// Copyright 2019 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// Copyright 2018-present the Flutter authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:flutter_web/material.dart';
import 'package:flutter_web.examples.gallery/gallery/scoped_model.dart';

import 'package:flutter_web.examples.gallery/demo/shrine/backdrop.dart';
import 'package:flutter_web.examples.gallery/demo/shrine/expanding_bottom_sheet.dart';
import 'package:flutter_web.examples.gallery/demo/shrine/model/app_state_model.dart';
import 'package:flutter_web.examples.gallery/demo/shrine/model/product.dart';
import 'package:flutter_web.examples.gallery/demo/shrine/supplemental/asymmetric_view.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({this.category = Category.all});

  final Category category;

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<AppStateModel>(
        builder: (BuildContext context, Widget child, AppStateModel model) {
      return AsymmetricView(products: model.getProducts());
    });
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    this.expandingBottomSheet,
    this.backdrop,
    Key key,
  }) : super(key: key);

  final ExpandingBottomSheet expandingBottomSheet;
  final Backdrop backdrop;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        backdrop,
        Align(child: expandingBottomSheet, alignment: Alignment.bottomRight),
      ],
    );
  }
}

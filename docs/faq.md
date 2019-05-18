# Flutter for web: Frequently Asked Questions

## Why can't I import `package:flutter`?

Our goal is to enable building applications for mobile and web simultaneously
from a single codebase. However, to facilitate fast experimentation, we started
developing Flutter for web in a separate namespace. So, as of today, in order
to use Flutter for web you need to import `package:flutter_web` instead of
`package:flutter`, and `package:flutter_web_ui` instead of `dart:ui`. We are
working to merge these branches together, which will greatly reduce the friction
involved in working across both web and mobile targets.

## Why can't I use existing Flutter pub packages?

Due to the temporary limitation explained in "Why can't I import
`package:flutter`?" above it is not possible to use existing Flutter packages
published on https://pub.dev. This is because those packages import
`package:flutter`. One temporary approach is to copy the content of these
packages to the `lib/` folder, as demonstrated with the use of the 
[numberpicker](https://pub.dev/packages/numberpicker) package in the 
[timeflow](https://github.com/flutter/samples/tree/master/web/timeflow/lib) sample.

## Can I use plugin X on the web?

Plugin support for the web is currently in design stage. Please, stay tuned. In
the meantime, you can use libraries listed on https://api.dartlang.org to access
the browser API.

## Why are fonts not working?

Until Flutter for web is integrated into the Flutter SDK we do not automatically
bundle fonts as part of the build process. In the meantime, you need to follow
the instructions for including the fonts in the
[migration guide](https://github.com/flutter/flutter_web/blob/master/oss/docs/faq.md).

## When will Flutter for web be ready for production?

Flutter for web is currently a technical preview, indicating that we are still
making significant changes. Amongst other issues, the API is not yet stable, 
performance work is not yet complete and we have known rendering bugs on common
browsers. As a result, production readiness will depend greatly on your use case. 
Our timeframe is not yet predictable because feedback may uncover new issues that
we need to work on. Here are a few things we know we need to finish:

- Merge into the Flutter SDK.
- Make sure widgets are rendered correctly in all important use-cases.
- Make sure performance is great for common use cases.
- Finish our accessibility work.

## How do I make network requests?

Due to browser limitations `dart:io` is not supported on the Web. In the
meantime you can use `package:http` to make HTTP requests. This package works
both in Flutter for mobile and in Flutter for web.

# Project Overview

## Description

This project presents an interesting technical challenge that I tackled using Bloc,

The architecture closely aligns with what I typically work with in my day-to-day tasks. While it leans towards familiarity, I acknowledge the flexibility to explore and adapt to alternative architectures.

One aspect where I would consider refactoring is the BLoC files. I divided them into two separate BLoCs, and in retrospect, consolidating them into a single BLoC might have streamlined the process.

Concerning the state classes within the BLoC, I recognize that they could be refined for better clarity. However, despite this, the structure should still be comprehensible.

I made a conscious effort to avoid using any stateful classes throughout the application.

Regarding the token management, I generate a unique token for each user, persisting it in local storage. An area for potential improvement is the duplication of token retrieval logic in both BLoCs. Consideration of an extension for this functionality could be explored in future iterations of the project.

Additionally, it's worth mentioning that the application does not use any dependencies to generate or navigate through the calendar, as requested in the challenge.

## Running tests

```bash
flutter test
```

## Running the project

```bash
flutter pub get
```

```bash
flutter run -d chrome
```

Please note that the token is removed from the window if there are runs on different ports.

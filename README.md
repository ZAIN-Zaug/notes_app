# Notes App

A simple Flutter notes app with a dark theme. Create colorful notes, edit them, and delete them. Everything is saved on the device, so your notes are still there after closing the app.

## Features

- **Add notes:** write a title and content in a bottom sheet, and choose a color for the note from 5 options.
- **Edit notes:** tap a note to change its title or content.
- **Delete notes:** remove a note with one tap.
- **Automatic date:** every note is saved with the date it was created.
- **Form validation and feedback:** empty fields are checked before saving, and a message tells you whether the action succeeded or failed.
- **Works offline:** notes are stored locally with Hive.

## Screenshots

<img src="screenshots/home.jpg" width="220"> <img src="screenshots/add-note.jpg" width="220"> <img src="screenshots/edit-note.jpg" width="220">
## Tech stack

| Area | Tools |
| --- | --- |
| Framework | Flutter, Dart |
| State management | `flutter_bloc` (Cubit) |
| Local storage | `hive`, `hive_flutter` |
| Date formatting | `intl` |

## Architecture

The code is split into layers, so each part has one job:

```
UI (views / widgets)
        ↓
Cubit (state management)
        ↓
Repository (error handling)
        ↓
Service (reads and writes the Hive box)
```

```
lib/
├── models/           # Note model, service, repository, custom exception
├── view model/       # Cubit and states
├── views/            # Screens and reusable widgets
├── constants.dart
├── bloc_observer.dart
└── main.dart
```

## Getting started

1. Install [Flutter](https://docs.flutter.dev/get-started/install).
2. Clone the repository:
   ```bash
   git clone https://github.com/ZAIN-Zaug/notes-app.git
   cd notes-app
   ```
3. Install the dependencies:
   ```bash
   flutter pub get
   ```
4. Run the app:
   ```bash
   flutter run
   ```

## Author

**Zain Ahmad Issa** — [GitHub](https://github.com/ZAIN-Zaug)

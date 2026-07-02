# Flutter Web Portfolio

A corporate/professional single-page portfolio built with Flutter Web.

## Structure

```
lib/
  main.dart                 # App entry point + scroll navigation
  theme/app_theme.dart      # Colors & typography (navy/accent-blue palette)
  utils/responsive.dart     # Breakpoint helpers (mobile/tablet/desktop)
  data/portfolio_data.dart  # ALL your content — edit this file to update text
  widgets/
    navbar.dart
    hero_section.dart
    about_section.dart
    skills_section.dart
    experience_section.dart
    projects_section.dart
    education_section.dart
    contact_footer.dart
```

## Getting started

1. Install the Flutter SDK: https://docs.flutter.dev/get-started/install
2. From this project folder, fetch packages:
   ```
   flutter pub get
   ```
3. Run locally in Chrome:
   ```
   flutter run -d chrome
   ```
4. Build for deployment:
   ```
   flutter build web
   ```
   Output goes to `build/web/` — deploy that folder to Firebase Hosting, GitHub Pages, Netlify, Vercel, etc.

## Things to personalize (search for "TODO")

- `lib/data/portfolio_data.dart`
  - `PersonalInfo.name` — replace "Your Name"
  - `email`, `phone`, `location`
  - `github`, `linkedin` — your real profile URLs
  - `resumeUrl` — add a real PDF at `assets/resume.pdf` and register it in `pubspec.yaml` under `flutter: assets:` if you add one
- `lib/widgets/hero_section.dart`
  - Replace the placeholder circle avatar with `Image.asset('assets/profile.jpg')` or `Image.network(...)` once you have a headshot

## Notes

- All text content lives in one file (`portfolio_data.dart`) so you never need to touch UI code to update your resume details.
- The layout is fully responsive: single column on mobile, wider grid layouts on tablet/desktop.
- Colors, fonts, and spacing are centralized in `app_theme.dart` and `responsive.dart` for easy restyling.

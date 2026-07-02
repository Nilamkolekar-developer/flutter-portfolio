# Nilam Kolekar — Flutter Developer Portfolio

A corporate/professional single-page portfolio built with Flutter Web, showcasing 2+ years of experience in cross-platform mobile and full-stack web development.

### 🔗 [View Live Portfolio →](https://nilamkolekar-developer.github.io/flutter-portfolio/)

---



## ✨ Features

- Fully responsive layout — single column on mobile, multi-column grid on tablet/desktop
- Smooth scroll navigation between sections (About, Skills, Experience, Projects, Education, Contact)
- Downloadable resume (PDF) directly from the site
- Clean, corporate visual style with a navy + accent-blue color palette
- Built and deployed with a fully automated CI/CD pipeline (GitHub Actions → GitHub Pages)

## 🛠️ Tech Stack

- **Framework:** Flutter Web
- **Language:** Dart
- **Fonts:** Google Fonts (Poppins, Inter)
- **Deployment:** GitHub Actions + GitHub Pages

---

## Structure

```
lib/
  main.dart                 # App entry point + scroll navigation
  theme/app_theme.dart      # Colors & typography (navy/accent-blue palette)
  utils/responsive.dart     # Breakpoint helpers (mobile/tablet/desktop)
  data/portfolio_data.dart  # ALL content — edit this file to update text
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

## Personalizing

- `lib/data/portfolio_data.dart` — all resume content (name, contact info, skills, experience, projects, education)
- `assets/image/image.jpg` — profile photo
- `assets/pdf/Nilam-resume.pdf` — downloadable resume

## Notes

- All text content lives in one file (`portfolio_data.dart`) so there's no need to touch UI code to update resume details.
- Colors, fonts, and spacing are centralized in `app_theme.dart` and `responsive.dart` for easy restyling.

---

## 📫 Contact

- **Email:** nilamkolekar26@gmail.com
- **LinkedIn:** [linkedin.com/in/yourusername](https://linkedin.com/in/yourusername) <!-- TODO: update -->
- **GitHub:** [@Nilamkolekar-developer](https://github.com/Nilamkolekar-developer)

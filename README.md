# Portfolio

A modern, responsive portfolio website built with Flutter, showcasing professional experience, education, and projects.

## Features

- 🌍 **Internationalization**: Support for multiple languages (English, Portuguese, Spanish, French, German)
- 🎨 **Theme Support**: Light, dark, and system theme modes
- 📱 **Responsive Design**: Optimized for mobile, tablet, and desktop
- 🎭 **Smooth Animations**: Beautiful transitions using Flutter Animate and custom constants
- 🎯 **Modern UI**: Clean design with Google Fonts and Font Awesome icons
- 🚀 **Cross-Platform**: Runs on Web, iOS, Android, macOS, Linux, and Windows
- 🔍 **SEO Optimized**: Meta tags and Open Graph support for better social sharing
- 📡 **Offline Support**: Remote data fetching with automatic local fallback
- 🔗 **Share Functionality**: Native share capabilities

## Tech Stack

- **Framework**: Flutter 3.10.1+
- **Languages**: Dart
- **Key Packages**:
  - `flutter_animate` - Smooth animations
  - `google_fonts` - Beautiful typography
  - `font_awesome_flutter` - Icon library
  - `url_launcher` - External link handling
  - `intl` - Internationalization support
  - `share_plus` - Native sharing
  - `meta_seo` - SEO and meta tags
  - `http` - Remote data fetching

## Project Structure

```
lib/
├── design_system/       # Design tokens and components
│   ├── components/      # Reusable UI components
│   ├── animations.dart  # Animation constants
│   ├── breakpoints.dart
│   ├── colors.dart
│   ├── spacings.dart    # Spacings and elevations
│   ├── theme.dart
│   └── typography.dart
├── l10n/                # Localization files
├── models/              # Data models
├── pages/               # Application pages
│   └── sections/        # Page sections
├── repositories/        # Data repositories
└── main.dart            # App entry point
```

## Getting Started

### Prerequisites

- Flutter SDK 3.38.0 or higher
- Dart SDK 3.10.0 or higher
- FVM (Flutter Version Management) - recommended

### Installation

1. Clone the repository:
```bash
git clone <repository-url>
cd portfolio
```

2. Install dependencies:
```bash
flutter pub get
```

3. Generate localization files:
```bash
flutter gen-l10n
```
Or simply run:
```bash
flutter pub get
```
This will automatically generate localization files based on `l10n.yaml` configuration.

4. Generate launcher icons (optional):
```bash
flutter pub run flutter_launcher_icons
```

5. Generate splash screen (optional):
```bash
flutter pub run flutter_native_splash:create
```

### Running the App

#### Using Flutter directly:

**Web:**
```bash
flutter run -d chrome
```

**Desktop (macOS):**
```bash
flutter run -d macos
```

**Desktop (Linux):**
```bash
flutter run -d linux
```

**Desktop (Windows):**
```bash
flutter run -d windows
```

**Mobile:**
```bash
flutter run
```

#### Using FVM (recommended):

**Web:**
```bash
fvm flutter run -d chrome
```

**Desktop/Mobile:**
```bash
fvm flutter run
```

### Building for Production

**Web:**
```bash
flutter build web
```

**macOS:**
```bash
flutter build macos
```

**Linux:**
```bash
flutter build linux
```

**Windows:**
```bash
flutter build windows
```

## Development

### Adding a New Language

1. Add the locale to `lib/models/app_language.dart`
2. Create a new ARB file in `lib/l10n/app_<locale>.arb` (e.g., `app_fr.arb` for French)
3. Add all translation strings matching the keys in `app_en.arb`
4. Generate localization files:
```bash
flutter gen-l10n
```
Or:
```bash
flutter pub get
```

### Design System

The app uses a centralized design system located in `lib/design_system/`:
- **Colors**: Brand colors, theme colors, and shimmer colors
- **Typography**: Text styles using Google Fonts
- **Spacings**: Consistent spacing values and elevations
- **Animations**: Centralized animation durations and curves
- **Components**: Reusable UI components

## Configuration Files

- `flutter_launcher_icons.yaml` - App icon configuration
- `flutter_native_splash.yaml` - Splash screen configuration
- `l10n.yaml` - Localization configuration

## License

This project is private and not open for public use.

## Author

Maurici Ferreira Junior
- GitHub: [@mauricifj](https://github.com/mauricifj)
- LinkedIn: [mauricifj](https://www.linkedin.com/in/mauricifj/)

# Cheq Your Awesome Gallery

## Overview

**Cheq Your Awesome Gallery** is a Flutter-based app designed to fetch images from your device, group them into albums, and allow users to swipe through them with ease. This app supports both Android and iOS platforms and ensures a seamless user experience by managing image permissions.

---

## Features

- **Fetch Device Images**: Retrieve all images stored on the device.
- **Group Images into Albums**: Automatically group images by creation date, month, or other criteria for better organization.
- **Image Viewing with Swipe Gesture**: View images in a gallery format and swipe left or right to switch between them.
- **Permission Management**: Request user permissions to access photos and handle denied permissions gracefully.

---

## Project Architecture

**Cheq Your Awesome Gallery** follows a **Clean Architecture** to ensure scalability, maintainability, and separation of concerns. Here's an overview of the project structure:

### Project Structure

```plaintext
cheq-your-awesome-gallery/
├── data/                           # Handles data fetching and parsing
├── domain/                         # Core business logic and domain entities
├── cheq_your_awesome_gallery/      # The Flutter app
│   ├── lib/
│   │   ├── main.dart               # Entry point for the app
│   │   └── ...                     # UI components, widgets, and business logic
└── plugins/
    └── cheq_your_awesome_photo_fetcher/  # Custom plugin for fetching photos from device
```

### Breakdown

1. **Data Layer**:
    - Responsible for handling all data-related operations, including fetching data from the device or network and interacting with repositories.

2. **Domain Layer**:
    - Contains the business logic and application rules. This layer defines entities, use cases, and interacts with repositories from the data layer.

3. **App Layer** (`cheq_your_awesome_gallery`):
    - The actual Flutter app, which interacts with the user interface and invokes use cases from the domain layer. It also manages app-wide state using **Cubit** for state management.

4. **Plugins** (`cheq_your_awesome_photo_fetcher`):
    - A custom Flutter plugin responsible for interacting with the device's photo library on both Android and iOS, fetching and processing photos.

---

## Getting Started

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/sifat004bk/cheq-your-awesome-gallery
   cd cheq-your-awesome-gallery
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Build the app:
   ```bash
   flutter build
   ```

### Running the App

1. **From IDE**:
    - Open the project in your preferred IDE (Android Studio, VSCode, etc.).
    - Select the target environment (`debug`, `release`, or `profile`) and run the app.

2. **From Command Line**:

    - **Debug** Mode:
      ```bash
      flutter run --debug --target lib/main.dart
      ```

    - **Release** Mode:
      ```bash
      flutter run --release --target lib/main.dart
      ```

    - **Profile** Mode:
      ```bash
      flutter run --profile --target lib/main.dart
      ```

### Running on Specific Devices

To specify a target device, use the `-d` flag:

```bash
flutter run --debug -d <device_id> --target lib/main.dart
```

---

## Dependencies

Here are some key dependencies used in the project:

- **Cubit**: For managing state in a simple and effective manner.
- **getIt**: Dependency injection for decoupling classes and making code modular.
- **injectable**: For code generation of dependency injection configurations.
- **photo_fetcher_plugin**: A custom plugin for fetching and saving photos from the device.
- **flutter_bloc**: State management package that works well with Cubit for handling app state.

---

# ShareSpot

ShareSpot is a mobile application developed in Flutter that allows users to obtain their current location and easily share it through third-party applications. This application demonstrates the use of GPS-related functions, location permission handling, and integration with interactive maps.

## Features

- **Get current location**: Loads user location using device GPS
- **Interactive map**: Displays a map with a pin indicating user's current location
- **Permission management**: Requests user consent for location access; if denied, app won't load map information
- **Share location**: Share latitude and longitude through installed apps like WhatsApp, Instagram, Messenger, etc.
- **User-friendly interface**: Designed to provide an intuitive and visually appealing user experience
- **Error messages**: Displays friendly messages for errors or permission denials

## Requirements

- **Flutter**: Version 3.x or higher
- **SDK**: Dart
- **Supported platforms**: Android and iOS

## Installation

Follow these steps to clone and install the application:

1. Clone this repository:
```bash
git clone https://github.com/kjarj54/ShareSpot.git
cd ShareSpot
```

## Dependencies Installation

Ensure Flutter is installed and run:

```bash
flutter pub get
```

## Running the Application

Use this command to run the application on an emulator or physical device:

```bash
flutter run
```

## Application Usage

### Initial Screen

- Button to load user's current location
- Map display with pin showing current location after permissions granted

### Location Permissions

- App requests user consent before accessing location
- No map information loaded if permissions denied

### Share Location

- Share button displays menu of installed applications
- Selected app opens with pre-loaded latitude and longitude data

## Technologies Used

- **Flutter**: Main cross-platform development framework
- **Maps API**: Map integration and location display
- **Dart**: Programming language for project logic
- **CMake**: Native platform project configuration

## Project Structure

```plaintext
ShareSpot/
├── lib/
│   ├── main.dart                # Application entry point
│   ├── screens/
│   │   ├── home_screen.dart     # Initial screen with map functionality
│   │   └── permissions.dart     # Location permissions handling
│   ├── widgets/
│   │   ├── map_widget.dart      # Map and pin display widget
│   │   └── share_button.dart    # Location sharing button
├── assets/
│   ├── images/                  # Graphic resources
├── pubspec.yaml                 # Dependencies configuration
```

## Future Improvements

- Additional language support
- Light and dark theme implementation
- Previously shared locations storage

## Contributions

Contributions welcome! Feel free to open issues or submit pull requests.

## License

This project is licensed under the **MIT License**.

---

Thank you for using ShareSpot! Contact us with any questions or comments.

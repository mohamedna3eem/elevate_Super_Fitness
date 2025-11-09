Elevate Super Fitness
=====================

Welcome to **Elevate Super Fitness**! This is a modern mobile fitness application built with Flutter, designed to empower users on their fitness journey. Whether you're a beginner or a pro, the app provides personalized workout plans, exercise tracking, AI-powered coaching, and more. It's crafted with a focus on user experience, performance, and scalability.

If you're passionate about fitness tech or Flutter development, feel free to contribute, fork, or star the repo. Let's build something amazing together! 🚀

Project Overview
----------------

Elevate Super Fitness is a cross-platform mobile app that helps users achieve their fitness goals through guided exercises, progress tracking, and intelligent recommendations. Key highlights include:

* Onboarding for new users to get started quickly.

* A smart AI coach powered by Gemini for personalized advice.

* Local database management with ObjectBox for offline support.

* Responsive UI that adapts to different screen sizes using Flutter ScreenUtil.

The app emphasizes clean code, test-driven development, and adherence to best practices in Flutter architecture.

Tech Stack
----------

* **Framework**: Flutter (SDK ^3.9.0)

* **State Management**: Flutter Bloc

* **Networking**: Retrofit

* **Dependency Injection**: Injectable

* **Database**: ObjectBox (local storage)

* **AI Integration**: Firebase AI, Gemini 2.5 Flash

* **Routing**: Navigator

* **Testing**: Flutter Test, Bloc Test, Mockito

* **Other Libraries**: Cached Network Image, Image Picker, Youtube Player Flutter, Animated Text Kit, and more (see pubspec.yaml for full list)

* **Build Tools**: Build Runner, Json Serializable, Retrofit Generator

* **Localization**: Flutter Intl for multi-language support

Architecture
------------

The project follows **Clean Architecture** principles to ensure separation of concerns, testability, and maintainability. It's divided into layers:

* **Presentation Layer**: Handles UI and user interactions (e.g., screens, widgets, view models using Cubit).

* **Domain Layer**: Contains business logic, entities, use cases, and repositories (abstract interfaces).

* **Data Layer**: Implements repositories with data sources (e.g., API services via Retrofit, local DB via ObjectBox).

* **Core Layer**: Utilities, constants, and shared services (e.g., Gemini AI service, ObjectBox service).

This structure promotes loose coupling and makes it easy to swap data sources or add features without affecting the UI.

Features
--------

* **Splash Screen**: Animated loading screen for a smooth app launch.

* **Onboarding**: Interactive tutorial with smooth page indicators and skip/next navigation.

* **User Authentication**: Secure login/signup.

* **Main Home Dashboard**: Bottom navigation bar for easy access to home, workouts, profile, and more.

* **Smart Coach**: AI-powered chat interface using Gemini for fitness advice, workout plans, and queries.

* **Exercise Selection**: Filter exercises by muscle groups and difficulty levels.

* **Media Integration**: YouTube video playback for exercise demos.

* **Offline Support**: Local caching of data and conversations with ObjectBox.

* **Localization**: Multi-language support with generated ARB files.

* **Theming and Responsiveness**: Adaptive UI with custom fonts (Inter, Roboto, etc.) and screen scaling.

* **CI/CD**: GitHub Actions for automated testing and deployment.

Testing
-------

Testing is a core part of the project to ensure reliability. We use:

* **Unit Tests**: For view models and use cases (e.g., smart\_coach\_view\_model\_test.dart using Bloc Test and Mockito).

* **Widget Tests**: For UI components (e.g., on\_boarding\_screen\_test.dart, splash\_screen\_test.dart).

* **Mocking**: Mockito for simulating dependencies like API calls and databases.

Folder Structure
-----------------

Here's a high-level overview of the project structure:

```plaintext
.
├── android/                # Android-specific files
├── assets/                 # Images, icons, and fonts
│   ├── icons/
│   ├── images/
│   └── fonts/
├── ios/                    # iOS-specific files
├── lib/                    # Main Dart code
│   ├── api/                # API models and services (Retrofit-generated)
│   ├── core/               # Utilities, constants, services (e.g., Gemini, ObjectBox)
│   ├── data/               # Data sources and repositories
│   ├── domain/             # Entities, use cases
│   ├── generated/          # Auto-generated files (e.g., l10n, JSON serializers)
│   ├── presentation/       # UI screens, widgets, view models
│   │   ├── auth/
│   │   ├── edit_profile/
│   │   ├── exercise/
│   │   ├── explore_page/
│   │   ├── food/
│   │   ├── food_details/
│   │   ├── main_home/
│   │   ├── on_boarding/
│   │   ├── profile_page/
│   │   ├── smart_coach_page/
│   │   └── splash/
│   │   └── workout_page/
│   └── main.dart           # App entry point
├── test/                   # Unit and widget tests
├── analysis_options.yaml   # Analyzer rules
├── pubspec.yaml            # Dependencies and config
└── README.md               # This file
```

Contributors
------------

- [Mohamed Hossam El-Bably](https://github.com/Bablu521)
- [Youssef Mohamed](https://github.com/youssefmdev22)
- [Moaz Osama](https://github.com/moazosama1)
- [Mohamed Naeem](https://github.com/mohamedna3eem)

Screenshots
--------------

| Splash                                                                                                                                               | Onboarding                                                                                                                                               | Login                                                                                                                                            | Register                                                                                                                                               |
|----------------------------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------|
| <img src='https://github.com/user-attachments/assets/77a66b6d-1432-4bf8-ab88-f2600640a003?raw=true' width="150px" height="300px"/> | <img src='https://github.com/user-attachments/assets/7ac80741-b678-4867-bc11-744bd5077bc6?raw=true' width="150px" height="300px"/> | <img src='https://github.com/user-attachments/assets/f7e13c0b-5653-42ca-ac28-739dd6228b21?raw=true' width="150px" height="300px"/> | <img src='https://github.com/user-attachments/assets/34c50be2-d680-4d27-9b2c-9ab3ad9e977d?raw=true' width="150px" height="300px"/> |

| Explore Page                                                                                                                                                |Workout Page                                                                                                                                            | Food Details page                                                                                                                                                | Exercise                                                                                                                                                |
|----------------------------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------|
| <img src='https://github.com/user-attachments/assets/8ab2fd27-2e0f-4c1d-83c5-dd4f935dbce3?raw=true' width="150px" height="300px"/> | <img src='https://github.com/user-attachments/assets/d7aedc7a-b6c1-4aee-a267-4c26cd29c7c5?raw=true' width="150px" height="300px"/> | <img src='https://github.com/user-attachments/assets/1eb115f3-15d9-4408-a2d6-951f6c549bbd?raw=true' width="150px" height="300px"/> | <img src='https://github.com/user-attachments/assets/c04cd2f0-1aaa-4ac0-940a-dfaaf4f394ad?raw=true' width="150px" height="300px"/> |

| Smart Coach Page                                                                                                                                              | Profile                                                                                                                                              | Edit Profile                                                                                                                                                | Logout                                                                                                                                                |
|----------------------------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------|
| <img src='https://github.com/user-attachments/assets/6fe36325-f3d5-4e6c-8e38-55c39c8f55d9?raw=true' width="150px" height="300px"/> | <img src='https://github.com/user-attachments/assets/03c7b732-0954-44c8-ab5c-028c53e330b5?raw=true' width="150px" height="300px"/> | <img src='https://github.com/user-attachments/assets/c286528b-1c14-413c-a14a-900607f47260?raw=true' width="150px" height="300px"/> | <img src='https://github.com/user-attachments/assets/9e5b04ad-c3da-4705-b4c6-3ea89cabf56d?raw=true' width="150px" height="300px"/> |

Presentation
------------

Check out our project presentation: [View Presentation](https://www.canva.com/design/DAG4DgofXQc/KE7Gfp-qVyXHacCy2VPiOA/view?utm_content=DAG4DgofXQc&utm_campaign=designshare&utm_medium=link2&utm_source=uniquelinks&utlId=hd138620478)

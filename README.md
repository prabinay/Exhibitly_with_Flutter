# Exhibitly

> An optimized e-commerce application built with flutter. It allows users to buy and sell arts online. The app utilizes custom API request handling and authorization to ensure secure transactions and data protection.<br />


## Setup

Run the following commands from your terminal:

1) `git clone https://github.com/prabinay/Exhibitly_with_Flutter.git` to clone this repository 

2) `flutter pub get` in the project root directory to install all the required dependencies.

## Used Packages

- firebase_auth: [link](https://pub.dev/packages/firebase_auth)
- firebase_core: [link](https://pub.dev/packages/firebase_core)
- smooth_page_indicator: [link](https://pub.dev/packages/smooth_page_indicator)
- form_field_validator: [link](https://pub.dev/packages/form_field_validator)
- cloud_firestore: [link](https://pub.dev/packages/cloud_firestore)
- get: [link](https://pub.dev/packages/get)

## Sdk Requirements

compileSdkVersion : It tells Gradle what version of the Android SDK to compile your app with.<br/>
targetSdkVersion : It is the main way Android provides forward compatibility.<br/>
minimumSdkVersion : It is the minimum version of the Android operating system required to run your application.

    android {
        compileSdkVersion 33
        defaultConfig {
            applicationId "com.example.exhibitly_with_flutter"
            minSdkVersion 22
            targetSdkVersion 30
            versionCode flutterVersionCode.toInteger()
            versionName flutterVersionName
        }
    }

## Screenshots

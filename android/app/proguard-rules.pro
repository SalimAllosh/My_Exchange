# Flutter Wrapper
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.**  { *; }
-keep class io.flutter.util.**  { *; }
-keep class io.flutter.view.**  { *; }
-keep class io.flutter.**  { *; }

# Google Play Services
-dontwarn com.google.android.gms.**
-keep class com.google.android.gms.** { *; }

# Firebase
-dontwarn com.google.firebase.**
-keep class com.google.firebase.** { *; }

# Other Libraries
-dontwarn okio.**
-keep class okio.** { *; }
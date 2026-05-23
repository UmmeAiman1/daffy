**Daffy - Field Sales Management App**
A Flutter-based mobile application for field sales representatives to manage daily attendance, track distributors, routes, and delivery stats — with offline-first architecture.
Features

**Authentication**: Login with company credentials, auto-login on app reopen
**Dashboard**: Greeting, date, delivery stats with donut chart, attendance status
**Attendance **: Check-in/check-out using device GPS location
**Offline-First**: All attendance data saved locally via Hive, synced to server on demand
**Distributor & Route Selection**: Fetch and select distributors and routes from API
**Profile**: View offline-saved profile data (company, department, contact info)
**Attendance History**: View saved records with POST button to sync individually

**Tech Stack**
Flutter
State Management: GetX
Local Storage: Hive
Networking: Dio
Location: Geolocator
Chartsfl_: chart
Date Formatting: intl

**Application Flow**
Login → Dashboard → Select Distributor → Select Route → Check In → Check Out → POST to API


**Offline Strategy**
**Attendance**: Saved to Hive on check-in/check-out. Posted to API only when user taps POST button.
**Profile**: Saved to Hive on login. Displayed from local storage on Profile screen.
**Auto-Login**: If user data exists in Hive, app navigates directly to Dashboard.

**Setup & Run**
# Clone the repository
git clone https://github.com/yourusername/daffy.git
cd daffy

# Install dependencies
flutter pub get

# Generate Hive adapters
flutter pub run build_runner build --delete-conflicting-outputs

# Run the app
flutter run

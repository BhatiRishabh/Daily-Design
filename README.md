//
//  Readme.md.swift
//  Daily Design
//
//  Created by Rishabh Kumar on 28/01/26.
//

# Daily Design 🎨
### A Minimalist Wallpaper App for iOS

![Swift](https://img.shields.io/badge/Swift-5.9-orange.svg)
![Platform](https://img.shields.io/badge/Platform-iOS%2017.0+-lightgrey.svg)
![License](https://img.shields.io/badge/License-MIT-blue.svg)
![Architecture](https://img.shields.io/badge/Architecture-MVVM-green.svg)

**Daily Design** is a native iOS application built with **SwiftUI** that provides an infinite stream of high-quality, curated wallpapers. Designed with a focus on minimalism and content-first aesthetics, it leverages the Unsplash API to deliver a visually stunning experience.

---

## 📱 App Screenshots

<p align="center">
  <img src="/DailyDesign/screenshot1.png" width="250" alt="Home Screen">
  &nbsp;&nbsp;&nbsp;&nbsp;
  <img src="/DailyDesign/screenshot2.png" width="250" alt="Detail View">
  &nbsp;&nbsp;&nbsp;&nbsp;
  <img src="/DailyDesign/screenshot3.png" width="250" alt="Dark Mode">
</p>

---

## ✨ Key Features

* **Infinite Scrolling:** Implements pagination with `LazyVGrid` to load images seamlessly as the user scrolls.
* **Smart Filtering:** Browse wallpapers by categories like Architecture, Minimalism, Nature, and Neon.
* **Search Functionality:** Real-time search using the Unsplash API.
* **Modern UI:** Glassmorphism effects, staggered masonry layouts, and smooth animations.
* **Dark Mode Support:** Fully adaptive UI for both light and dark appearances.

---

## 🛠 Tech Stack

* **Language:** Swift 5.9
* **Framework:** SwiftUI
* **Architecture:** MVVM (Model-View-ViewModel)
* **Networking:** Swift Concurrency (`async`/`await`), `URLSession`
* **Data Handling:** `Codable` for JSON parsing
* **Design Tools:** Figma (for UI Prototyping)

---

## 📂 Project Structure

The project follows a clean **MVVM** architecture to separate business logic from the UI:

```text
DailyDesign/
├── Models/           # Data definitions (UnsplashImage.swift)
├── ViewModels/       # State management & API logic (HomeViewModel.swift)
├── Views/            # SwiftUI screens & Components (HomeView.swift)
├── Services/         # Networking layer
└── DailyDesignApp.swift
```


## 🚀 Getting Started
Follow these steps to run the project locally.

### 1️⃣ Clone the Repository

```bash
git clone https://github.com/your-username/DailyDesign.git
cd DailyDesign
```

### 2️⃣ Open in Xcode

Open the `DailyDesign.xcodeproj` file in **Xcode 15 or later**.

---

### 3️⃣ Configure Unsplash API Key

This app requires a **free API key** from Unsplash.

1. Register at **Unsplash Developers**
2. Create a new application to obtain your **Access Key**
3. Open `ViewModels/HomeViewModel.swift`
4. Replace the placeholder key:

```swift
let accessKey = "YOUR_ACCESS_KEY_HERE"
```

## 4️⃣ Run the App

Select a simulator (e.g., iPhone 17 Pro) and press Run (Cmd + R).


## 🔮 Future Improvements

 Download Feature
Allow users to save wallpapers directly to Photos.

 Favorites
Local persistence using CoreData or SwiftData.

 User Profiles
View photographer details and portfolios.

## 👨‍💻 Author
Rishabh Kumar

iOS Developer | Final Year B.Tech (CSD) at IIITD

[LinkedIn](https://www.linkedin.com/in/rishabh-kumar-profile/) | [Portfolio](https://rishabhdev31.vercel.app/)

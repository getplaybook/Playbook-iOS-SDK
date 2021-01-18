# Playbook IOS SDK

# Installation

#### CocoaPods

Current version of **PlaybookSDK** is v1.3
```
pod "PlaybookSDK", :git => 'https://github.com/getplaybook/Playbook-iOS-SDK.git', :tag => '1.3'
```

#### Initialize PlaybookSDK

Initialize Playbook SDK with your settings information and open the Playbook Modal from any UIController.

In your `UIApplicationDelegate` class you can setup playbook SDK with following code blocks:

```swift

func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        ...
        
        /**
         Playbook Config
         */
        PlaybookSDK.set(
            token: "...", // application client token
            userID: "...", // Unique user id of your system
            userGroups: ["..."], // User groups
            companyName: "Acme Academy" // 
        )
        
        /* This method is optional */
        PlaybookSDK.extraSettings(PBExraSettingsData(
            spinnerColor: UIColor(red: 1.00, green: 0.85, blue: 0.10, alpha: 1.00),
            mainColor: UIColor(red: 1.00, green: 0.85, blue: 0.10, alpha: 1.00),
            mainTitle: [
                "en": "Acme Academy",
                "tr": "Acme Akademi"
            ],
            mainDescriptionText: [
                "en": "Supercharge your skills with these short guides in various categories.",
                "tr": "Çeşitli konu ve kategorilerdeki kısa rehberler ile kendini geliştir."
            ]
            QRModule: true,
            updateModule: true
        ))
        ...
}
```

#### Posible properties of extra settings
Prop | Description | Type | default
------ | ------ | ------ | ------
`spinnerColor` | Color of main loading spinner  | `UIColor` | UIColor.gray
`fontFamily` | Family name of main font | `String` | null
`mainColor` | Application main color | `UIColor` | UIColor.gray
`mainTitle` | Title of main screen | `[String: String]` | null
`mainDescriptionText` | Description of main screen | `[String: String]` | null
`categoryDescriptionText` | Description of main screen | `[String: String]` | null
`QRModule` | State of QRModule | `Bool` | true
`updatesModule` | State of Update Module | `Bool` | true

#### Locale Your SDK

First of all you should set available languages as shown code block below for the SDK.

```swift
    PlaybookSDK.set(availableLocales: [
        Locale(identifier: "EN"),
        Locale(identifier: "DE"),
        Locale(identifier: "TR")
    ])
```

Current version of the SDK has localizated for only English, Turkish and Arabic yet. But developers can create their localization file from current JSON template. The example template can be found the main dir of the repository.

Please follow the three basic step below to localize the sdk for a new language.

1. Set the available languages.
2. Copy the example json to your bundle. The file must be in a `project relative folder` named **localization**.
3. Replace name of file with language short descriptor. For example `de.json`.

#### Peresenting ViewControllers

In any UIViewController instance you can use methods listed below.

```swift
    // Presenting both academy and updates module
    PlaybookSDK.presentListViewFrom(self, animated: true)
    // Presenting only update module
    PlaybookSDK.presentUpdatesListViewFrom(self, animated: true)
    // Presenting only academy module
    PlaybookSDK.presentAcademyListViewFrom(self, animated: true)
```

#### Remote notification for updates

In your `UIApplicationDelegate` class you can setup playbook SDK UpdateModule with following code blocks:

```swift

func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
    ...
    PlaybookSDK.catchTheNotification(notification.request.content.userInfo)
    completionHandler([.alert, .sound])
}

func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
    ...
    PlaybookSDK.catchTheNotification(response.notification.request.content.userInfo, andOpen: true)
    completionHandler()
}
```

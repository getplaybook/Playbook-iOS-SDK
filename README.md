# Playbook IOS SDK#

# Installation

#### CocoaPods

Current version of **PlaybookSDK** is v1.0.2
```
pod "PlaybookSDK", :git => 'https://github.com/getplaybook/Playbook-iOS-SDK.git', :tag => '1.0.2'
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
        
        PlaybookSDK.extraSettings(PBExraSettingsData(
            spinnerColor: UIColor(red: 1.00, green: 0.85, blue: 0.10, alpha: 1.00),
            mainColor: UIColor(red: 1.00, green: 0.85, blue: 0.10, alpha: 1.00),
            mainTitle: [
                "en": "Acme Academy",
                "tr": "Acme Akademi"
            ]
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
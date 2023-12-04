import UIKit
import FirebaseCore

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        FirebaseApp.configure()
        
        // Email Validation Test
        print("EMAIL DEBUG PRINT:", UserInfoValidation.isValidEmail(email: ""))
        print("EMAIL DEBUG PRINT:", UserInfoValidation.isValidEmail(email: "anna"))
        print("EMAIL DEBUG PRINT:", UserInfoValidation.isValidEmail(email: "anna@"))
        print("EMAIL DEBUG PRINT:", UserInfoValidation.isValidEmail(email: "anna@gmail"))
        print("EMAIL DEBUG PRINT:", UserInfoValidation.isValidEmail(email: "anna@gmail..com"))
        print("EMAIL DEBUG PRINT:", UserInfoValidation.isValidEmail(email: "anna@@gmail.com"))
        print("EMAIL DEBUG PRINT:", UserInfoValidation.isValidEmail(email: "anna@gmail.com"))
        
        // Password Validation Test
        print("PASSWORD DEBUG PRINT:", UserInfoValidation.isValidPassword(password: ""))
        print("PASSWORD DEBUG PRINT:", UserInfoValidation.isValidPassword(password: "password"))
        print("PASSWORD DEBUG PRINT:", UserInfoValidation.isValidPassword(password: "password1"))
        print("PASSWORD DEBUG PRINT:", UserInfoValidation.isValidPassword(password: "password$"))
        print("PASSWORD DEBUG PRINT:", UserInfoValidation.isValidPassword(password: "password1$"))
        print("PASSWORD DEBUG PRINT:", UserInfoValidation.isValidPassword(password: "Password"))
        print("PASSWORD DEBUG PRINT:", UserInfoValidation.isValidPassword(password: "Password1"))
        print("PASSWORD DEBUG PRINT:", UserInfoValidation.isValidPassword(password: "Password$"))
        print("PASSWORD DEBUG PRINT:", UserInfoValidation.isValidPassword(password: "Password"))
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}


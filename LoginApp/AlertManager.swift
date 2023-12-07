import UIKit

class AlertManager {
    
    private static func showBasicAlert(on vc: UIViewController, title: String, message: String?) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style:  .default, handler: nil))
            vc.present(alert, animated: true, completion: nil)
        }
    }
    
}


// MARK: - Extensions

// Validation Error Alerts
extension AlertManager {
    public static func showInvalidEmailAlert(on vc: UIViewController) {
        self.showBasicAlert(on: vc, title: "Invalid Email", message: "Please enter a valid email.")
    }
    
    public static func showInvalidPasswordAlert(on vc: UIViewController) {
        self.showBasicAlert(on: vc, title: "Invalid Password", message: "Please enter a valid password.")
    }
    
    public static func showInvalidUsernameAlert(on vc: UIViewController) {
        self.showBasicAlert(on: vc, title: "Invalid Username", message: "Please enter a valid username.")
    }
}

// Registration Error Alerts
extension AlertManager {
    public static func showRegistrationErrorAlert(on vc: UIViewController) {
        self.showBasicAlert(on: vc, title: "Unknown Registration Error", message: nil)
    }
    
    public static func showRegistrationErrorAlert(on vc: UIViewController, error: Error) {
        self.showBasicAlert(on: vc, title: "Registration Error", message: "\(error.localizedDescription)")
    }
}

// Sign In Error Alerts
extension AlertManager {
    public static func showSignInErrorAlert(on vc: UIViewController) {
        self.showBasicAlert(on: vc, title: "Unknown Signing In Error", message: nil)
    }
    
    public static func showSignInErrorAlert(on vc: UIViewController, error: Error) {
        self.showBasicAlert(on: vc, title: "Signing In Error", message: "\(error.localizedDescription)")
    }
}

// Logout Error Alerts
extension AlertManager {
    public static func showLogoutErrorAlert(on vc: UIViewController, error: Error) {
        self.showBasicAlert(on: vc, title: "Logout Error", message: "\(error.localizedDescription)")
    }
}

// Forgot Password Alerts
extension AlertManager {
    public static func showPasswordResetSentAlert(on vc: UIViewController) {
        self.showBasicAlert(on: vc, title: "Password Reset Sent", message: "We have sended a password reset link to your email. Please, check it to change your password!")
    }
    
    public static func showPasswordResetErrorAlert(on vc: UIViewController, error: Error) {
        self.showBasicAlert(on: vc, title: "Password Reset Sending Error", message: "\(error.localizedDescription)")
    }
}

// Fetching User Error Alerts
extension AlertManager {
    public static func showFetchingUserErrorAlert(on vc: UIViewController) {
        self.showBasicAlert(on: vc, title: "Fetching User Error", message: nil)
    }
    
    public static func showFetchingUserErrorAlert(on vc: UIViewController, error: Error) {
        self.showBasicAlert(on: vc, title: "Fetching User Error", message: "\(error.localizedDescription)")
    }
}
    

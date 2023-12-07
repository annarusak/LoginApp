import UIKit

class ForgotPasswordViewController: UIViewController {

    // MARK: - UI Components
    let backgroundColor = UIColor(red: 25/255, green: 30/255, blue: 49/255, alpha: 1)
    
    private let headerView = HeaderView(title: "Forgot password", subtitle: "Reset your password")
    
    private let emailField = CustomTextField(fieldType: .email)
    
    private let resetPasswordButton = CustomButton(title: "Reset password", hasBackground: true, fontSize: .medium)
    
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        resetPasswordButton.addTarget(self, action: #selector(didTapResetPassword), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        view.backgroundColor = backgroundColor
        
        view.addSubview(headerView)
        view.addSubview(emailField)
        view.addSubview(resetPasswordButton)
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        emailField.translatesAutoresizingMaskIntoConstraints = false
        resetPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 230),
            
            emailField.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 11),
            emailField.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            emailField.heightAnchor.constraint(equalToConstant: 55),
            emailField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            
            resetPasswordButton.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 22),
            resetPasswordButton.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            resetPasswordButton.heightAnchor.constraint(equalToConstant: 55),
            resetPasswordButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85)
        ])
    }
    
    // MARK: - Selectors
    @objc private func didTapResetPassword() {
        let email = self.emailField.text ?? ""
        
        if !UserInfoValidation.isValidEmail(email: email) {
            AlertManager.showInvalidEmailAlert(on: self)
            return
        }
        
        AuthenticationService.shared.forgotPassword(email: email) { [weak self] error in
            guard let self = self else { return }
            
            if let error = error {
                AlertManager.showPasswordResetErrorAlert(on: self, error: error)
                return
            }
            AlertManager.showPasswordResetSentAlert(on: self)
        }
    }

}

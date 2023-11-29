import UIKit

class HomeViewController: UIViewController {

    // MARK: - UI Components
    let backgroundColor = UIColor(red: 25/255, green: 30/255, blue: 49/255, alpha: 1)
    let uiElementsColor = UIColor(red: 103/255, green: 194/255, blue: 241/255, alpha: 1)
    
    private let label: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 21, weight: .semibold)
        label.text = "Loading..."
        label.numberOfLines = 2
        return label
    }()
    
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = false
        
        self.setupUI()
        label.text = "Anna Rusak\nanna@gmail.com"
    }
    

    
    // MARK: - UI Setup
    private func setupUI() {
        view.backgroundColor = backgroundColor
        self.navigationController?.navigationBar.tintColor = uiElementsColor
        self.navigationItem.hidesBackButton = true
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(didTapLogout))
        
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -40)
        ])
    }
    
    // MARK: - Selectors
    @objc private func didTapLogout() {
        print("didTapLogout")
        self.navigationController?.popToRootViewController(animated: true)
    }

}

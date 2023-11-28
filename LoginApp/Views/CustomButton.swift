import UIKit

class CustomButton: UIButton {

    let uiElementsColor = UIColor(red: 103/255, green: 194/255, blue: 241/255, alpha: 1)
    
    enum FontSize {
        case big
        case medium
        case small
        case tiny
    }
    
    init(title: String, hasBackground: Bool = false, fontSize: FontSize) {
        super.init(frame: .zero)
        self.setTitle(title, for: .normal)
        self.layer.cornerRadius = 12
        self.layer.masksToBounds = true
        self.backgroundColor = hasBackground ? uiElementsColor : .clear
        let titleColor: UIColor = hasBackground ? .white : uiElementsColor
        self.setTitleColor(titleColor, for: .normal)
        
        switch fontSize {
        case .big:
            self.titleLabel?.font = .systemFont(ofSize: 22, weight: .bold)
        case .medium:
            self.titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        case .small:
            self.titleLabel?.font = .systemFont(ofSize: 16, weight: .regular)
        case .tiny:
            self.titleLabel?.font = .systemFont(ofSize: 14, weight: .regular)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

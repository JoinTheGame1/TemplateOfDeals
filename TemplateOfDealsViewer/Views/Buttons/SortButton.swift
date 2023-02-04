import UIKit

enum SortButtonType {
    case instrument
    case price
    case amount
    case side
}

class SortButton: UIButton {
    
    let type: SortButtonType
    
    init(type: SortButtonType, title: String) {
        self.type = type
        super.init(frame: .zero)
        self.setTitle(title, for: .normal)
        self.backgroundColor = .systemBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}

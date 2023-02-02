import UIKit

extension DealCell {
    
    func makeLabel(
        textColor: UIColor = .black,
        textAlignment: NSTextAlignment = .center
    ) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.clipsToBounds = true
        label.textColor = textColor
        label.textAlignment = textAlignment
        return label
    }
}

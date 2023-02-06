import UIKit

extension DealCell {
    
    func makeLabel(
        textColor: UIColor = .label,
        textAlignment: NSTextAlignment = .center,
        font: UIFont = UIFont.systemFont(ofSize: 17, weight: .light)
    ) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = textColor
        label.textAlignment = textAlignment
        label.font = font
        label.backgroundColor = .systemBackground
        return label
    }
}

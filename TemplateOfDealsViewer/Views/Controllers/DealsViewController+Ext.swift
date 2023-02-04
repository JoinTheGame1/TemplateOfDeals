import UIKit

extension DealsViewController {
    
    func makeSortButton(
        type: SortButtonType,
        title: String,
        titleAlignment: UIControl.ContentHorizontalAlignment = .center
    ) -> SortButton {
        let button = SortButton(type: type, title: title)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.contentHorizontalAlignment = titleAlignment
        button.setTitleColor(.label, for: .normal)
        return button
    }
}

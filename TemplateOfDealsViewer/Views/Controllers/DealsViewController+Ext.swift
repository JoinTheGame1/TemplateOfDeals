import UIKit

extension DealsViewController {
    
    func makeSortButton(
        sortType: SortButtonType,
        title: String,
        titleAlignment: UIControl.ContentHorizontalAlignment = .center
    ) -> SortButton {
        let button = SortButton(sortType: sortType, title: title)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.contentHorizontalAlignment = titleAlignment
        return button
    }
}

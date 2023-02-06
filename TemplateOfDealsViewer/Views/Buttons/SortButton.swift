import UIKit

enum SortButtonType {
    case instrument
    case price
    case amount
    case side
}

protocol SortButtonDelegate: AnyObject {
    func sortButtonPressed(_ sender: SortButton)
}

class SortButton: UIButton {
    
    let sortType: SortButtonType
    var sortState: SortState
    
    weak var delegate: SortButtonDelegate?
    
    init(sortType: SortButtonType, title: String) {
        self.sortType = sortType
        self.sortState = .inactive
        super.init(frame: .zero)
        configure()
        setTitle(title, for: .normal)
        setTitleColor(.label, for: .normal)
        backgroundColor = .systemBackground
        setNeedsDisplay()
        addTarget(self, action: #selector(onTap(_:)), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func inactive() {
        self.sortState = .inactive
        UIButton.transition(
            with: self,
            duration: 0.3,
            options: [.curveLinear, .allowUserInteraction],
            animations: { self.setImage(nil, for: .normal) }
        )
    }
    
    private func configure() {
        switch sortState {
        case .inactive:
            setImage(nil, for: .normal)
        case .ascending:
            setImage(UIImage(systemName: "arrow.down"), for: .normal)
        case .descending:
            setImage(UIImage(systemName: "arrow.up"), for: .normal)
        }
        imageView?.tintColor = .label
    }
    
    @objc func onTap(_ sender: SortButton) {
        switch sortState {
        case .inactive:
            sortState = .ascending
        case .ascending:
            sortState = .descending
        case .descending:
            sortState = .ascending
        }
        UIButton.transition(
            with: self,
            duration: 0.3,
            options: [.curveLinear, .allowUserInteraction],
            animations: { self.configure() }
        )
        delegate?.sortButtonPressed(sender)
    }
    
}

extension SortButton {
    enum SortState {
        case inactive
        case ascending
        case descending
    }
}

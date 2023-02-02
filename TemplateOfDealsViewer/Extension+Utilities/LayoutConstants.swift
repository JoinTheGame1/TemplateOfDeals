import Foundation

class Constants {
    
    private let viewWidth: CGFloat
    var instrumentColumnWidth: CGFloat {
        get { return viewWidth * 0.35 }
    }
    var priceColumnWidth: CGFloat {
        get { return viewWidth * 0.15 }
    }
    var amountColumnWidth: CGFloat {
        get { return viewWidth * 0.3 }
    }
    var sideColumnWidth: CGFloat {
        get { return viewWidth * 0.2 }
    }
    init(viewWidth: CGFloat) {
        self.viewWidth = viewWidth
    }
}

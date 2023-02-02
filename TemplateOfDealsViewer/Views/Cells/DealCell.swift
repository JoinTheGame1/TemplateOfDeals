import UIKit

class DealCell: UITableViewCell {
    
    static let identifier = "DealCell"
    
    lazy var dateModifierLabel = makeLabel(
        textColor: .gray,
        textAlignment: .left
    )
    lazy var instrumentLabel = makeLabel(textAlignment: .left)
    lazy var priceLabel = makeLabel()
    lazy var amountLabel = makeLabel()
    lazy var sideLabel = makeLabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupCell()
    }
    
    private func setupCell() {
        addSubview(dateModifierLabel)
        addSubview(instrumentLabel)
        addSubview(priceLabel)
        addSubview(amountLabel)
        addSubview(sideLabel)
        
        let constants = Constants(viewWidth: frame.width)
        
        NSLayoutConstraint.activate([
            dateModifierLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            dateModifierLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            dateModifierLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            
            instrumentLabel.topAnchor.constraint(equalTo: dateModifierLabel.bottomAnchor, constant: 4),
            instrumentLabel.leadingAnchor.constraint(equalTo: dateModifierLabel.leadingAnchor),
            instrumentLabel.widthAnchor.constraint(equalToConstant: constants.instrumentColumnWidth),
            instrumentLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            
            priceLabel.topAnchor.constraint(equalTo: instrumentLabel.topAnchor),
            priceLabel.leadingAnchor.constraint(equalTo: instrumentLabel.trailingAnchor),
            priceLabel.widthAnchor.constraint(equalToConstant: constants.priceColumnWidth),
            priceLabel.bottomAnchor.constraint(equalTo: instrumentLabel.bottomAnchor),
            
            amountLabel.topAnchor.constraint(equalTo: instrumentLabel.topAnchor),
            amountLabel.leadingAnchor.constraint(equalTo: priceLabel.trailingAnchor),
            amountLabel.widthAnchor.constraint(equalToConstant: constants.amountColumnWidth),
            amountLabel.bottomAnchor.constraint(equalTo: instrumentLabel.bottomAnchor),
            
            sideLabel.topAnchor.constraint(equalTo: instrumentLabel.topAnchor),
            sideLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            sideLabel.widthAnchor.constraint(equalToConstant: constants.sideColumnWidth),
            sideLabel.bottomAnchor.constraint(equalTo: instrumentLabel.bottomAnchor)
        ])
    }
    
    func configure(with deal: Deal) {
        dateModifierLabel.text = DateToStringFormatter().toString(from: deal.dateModifier)
        instrumentLabel.text = deal.instrumentName
        priceLabel.text = "\(Int(deal.price))"
        amountLabel.text = "\(Int(deal.amount))"
        sideLabel.text = deal.side == .buy ? "Buy" : "Sell"
        sideLabel.textColor = deal.side == .buy ? .green : .red
    }
}

import UIKit

class DealCell: UITableViewCell {
    
    static let identifier = "DealCell"
    
    lazy var dateModifierLabel = makeLabel(
        textColor: .gray,
        textAlignment: .left,
        font: UIFont.systemFont(ofSize: 14, weight: .light)
    )
    lazy var instrumentLabel = makeLabel(textAlignment: .left)
    lazy var priceLabel = makeLabel()
    lazy var amountLabel = makeLabel()
    lazy var sideLabel = makeLabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        dateModifierLabel.text = nil
        instrumentLabel.text = nil
        priceLabel.text = nil
        amountLabel.text = nil
        sideLabel.text = nil
    }
    
    private func setupCell() {
        addSubview(dateModifierLabel)
        addSubview(instrumentLabel)
        addSubview(priceLabel)
        addSubview(amountLabel)
        addSubview(sideLabel)
                
        NSLayoutConstraint.activate([
            dateModifierLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            dateModifierLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            dateModifierLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            
            instrumentLabel.topAnchor.constraint(equalTo: dateModifierLabel.bottomAnchor, constant: 4),
            instrumentLabel.leadingAnchor.constraint(equalTo: dateModifierLabel.leadingAnchor),
            instrumentLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.35),
            instrumentLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            
            priceLabel.topAnchor.constraint(equalTo: instrumentLabel.topAnchor),
            priceLabel.leadingAnchor.constraint(equalTo: instrumentLabel.trailingAnchor, constant: 4),
            priceLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.12),
            priceLabel.bottomAnchor.constraint(equalTo: instrumentLabel.bottomAnchor),
            
            amountLabel.topAnchor.constraint(equalTo: instrumentLabel.topAnchor),
            amountLabel.leadingAnchor.constraint(equalTo: priceLabel.trailingAnchor, constant: 4),
            amountLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.3),
            amountLabel.bottomAnchor.constraint(equalTo: instrumentLabel.bottomAnchor),
            
            sideLabel.topAnchor.constraint(equalTo: instrumentLabel.topAnchor),
            sideLabel.trailingAnchor.constraint(equalTo: dateModifierLabel.trailingAnchor),
            sideLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.15),
            sideLabel.bottomAnchor.constraint(equalTo: instrumentLabel.bottomAnchor)
        ])
    }
    
    func configure(with deal: Deal) {
        alpha = 1.0
        backgroundColor = .systemBackground
        dateModifierLabel.text = DateToStringFormatter().toString(from: deal.dateModifier)
        instrumentLabel.text = deal.instrumentName
        priceLabel.text = String(format: "%.2f", arguments: [deal.price])
        amountLabel.text = String(format: "%.0f", arguments: [deal.amount])
        sideLabel.text = deal.side == .buy ? "Buy" : "Sell"
        sideLabel.textColor = deal.side == .buy ? UIColor(named: "buy") : UIColor(named: "sell")
    }
}

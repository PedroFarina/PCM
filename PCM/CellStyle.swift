//
//  CellStyle.swift
//  PCM
//
//  Created by Francielly Cristina Ortiz Candido on 18/10/21.
//

import Foundation
import UIKit

internal class CellStyle: UITableViewCell {
    public var comentAtv: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .body)
        label.adjustsFontForContentSizeCategory = true
        label.textColor = .blackProt
        return label
    }()
    private var dataComent: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .footnote)
        label.adjustsFontForContentSizeCategory = true
        label.textColor = .segmentedColor
        return label
    }()
    private var horaComent: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .footnote)
        label.adjustsFontForContentSizeCategory = true
        label.textColor = .segmentedColor
        return label
    }()
    
    internal lazy var Constraints: [NSLayoutConstraint] = {
        [
            comentAtv.topAnchor.constraint(equalTo: self.topAnchor, constant: 14),
            comentAtv.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10)
        ]
    }()
    
    internal override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(comentAtv)
//        self.addSubview(dataComent)
//        self.addSubview(horaComent)
        
        NSLayoutConstraint.activate(Constraints)
    }
    
    required init? (coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

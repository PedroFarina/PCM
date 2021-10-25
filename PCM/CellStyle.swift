//
//  CellStyle.swift
//  PCM
//
//  Created by Francielly Cristina Ortiz Candido on 18/10/21.
//

import Foundation
import UIKit

internal class CellStyle: UITableViewCell {
    public var atvComent: UILabel = {
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
            atvComent.topAnchor.constraint(equalTo: self.topAnchor, constant: 14),
            atvComent.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10)
        ]
    }()
    
    internal override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(atvComent)
        
        NSLayoutConstraint.activate(Constraints)
    }
    
    required init? (coder: NSCoder) {
       return nil
    }
    
    
}

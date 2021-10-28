//
//  CellStyle.swift
//  PCM
//
//  Created by Francielly Cristina Ortiz Candido on 18/10/21.
//

import Foundation
import UIKit

internal class ActivityLogTableViewCell: UITableViewCell {
    internal static let identifier = "activityLogItemCell"
    private static let dfDate: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "dd/MM/yy"
        return df
    }()
    private static let dfTime: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "hh:mm"
        return df
    }()

    private var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .body)
        label.adjustsFontForContentSizeCategory = true
        label.textColor = .blackProt
        return label
    }()
    private var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    private var dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .footnote)
        label.adjustsFontForContentSizeCategory = true
        label.textColor = .detailColor
        label.textAlignment = .right
        return label
    }()
    private var timeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .footnote)
        label.adjustsFontForContentSizeCategory = true
        label.textColor = .detailColor
        label.textAlignment = .right
        return label
    }()

    internal var descriptionText: String? {
        get {
            return descriptionLabel.text
        }
        set {
            descriptionLabel.text = newValue
        }
    }
    private var _date: Date = Date()
    internal var date: Date {
        get {
            return _date
        }
        set {
            dateLabel.text = ActivityLogTableViewCell.dfDate.string(from: newValue)
            timeLabel.text = ActivityLogTableViewCell.dfTime.string(from: newValue)
        }
    }
    
    internal lazy var myConstraints: [NSLayoutConstraint] = {
        [
            descriptionLabel.topAnchor.constraint(greaterThanOrEqualTo: topAnchor, constant: 10),
            descriptionLabel.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -10),
            descriptionLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            descriptionLabel.trailingAnchor.constraint(equalTo: containerView.leadingAnchor),

            containerView.topAnchor.constraint(greaterThanOrEqualTo: topAnchor, constant: 10),
            containerView.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -10),
            containerView.centerYAnchor.constraint(equalTo: centerYAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),

            dateLabel.topAnchor.constraint(equalTo: containerView.topAnchor),
            dateLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            dateLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),

            timeLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor),
            timeLabel.leadingAnchor.constraint(equalTo: dateLabel.leadingAnchor),
            timeLabel.trailingAnchor.constraint(equalTo: dateLabel.trailingAnchor),
            timeLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ]
    }()
    
    internal override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.layer.cornerRadius = 7
        self.clipsToBounds = true
        self.addSubview(descriptionLabel)
        self.addSubview(containerView)
        containerView.addSubview(dateLabel)
        containerView.addSubview(timeLabel)
        NSLayoutConstraint.activate(myConstraints)
    }
    
    required init? (coder: NSCoder) {
       return nil
    }
}

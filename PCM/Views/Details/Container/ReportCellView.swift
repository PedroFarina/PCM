//
//  ReportCellView.swift
//  PCM
//
//  Created by pedro.silveira on 28/10/21.
//

import Foundation
import UIKit

final class ReportCellView: UIView {

    private let viewModel: ReportCellViewModel

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .body)
        label.adjustsFontForContentSizeCategory = true
        label.textColor = .blackProt
        label.text = viewModel.title

        return label
    }()

    private lazy var valueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .body)
        label.adjustsFontForContentSizeCategory = true
        label.textColor = .blackProt
        label.text = viewModel.value

        return label
    }()

    private lazy var titleLabelConstraints: [NSLayoutConstraint] = {
        let constraints = [
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
        ]
        return constraints
    }()

    private lazy var valueLabelConstraints: [NSLayoutConstraint] = {
        let constraints = [
            valueLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            valueLabel.leadingAnchor.constraint(greaterThanOrEqualTo: titleLabel.trailingAnchor, constant: 40),
            valueLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            valueLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
        ]

        return constraints
    }()

    init(from viewModel: ReportCellViewModel, frame: CGRect = .zero) {
        self.viewModel = viewModel

        super.init(frame: frame)

        setupViewHierarchy()
        setupConstraints()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViewHierarchy() {
        addSubview(titleLabel)
        addSubview(valueLabel)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate(titleLabelConstraints)
        NSLayoutConstraint.activate(valueLabelConstraints)
    }
}

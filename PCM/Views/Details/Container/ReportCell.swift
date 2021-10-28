//
//  ReportCell.swift
//  PCM
//
//  Created by pedro.silveira on 28/10/21.
//

import Foundation
import UIKit

final class ReportCell: UIView {

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

    init(from viewModel: ReportCellViewModel, frame: CGRect = .zero) {
        self.viewModel = viewModel

        super.init(frame: frame)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupConstraints() {
        
    }
}

//
//  ReportContainerView.swift
//  PCM
//
//  Created by pedro.silveira on 28/10/21.
//

import Foundation
import UIKit

final class ReportContainerView: UIStackView {

    private let viewModel: ReportContainerViewModel

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .headline)
        label.adjustsFontForContentSizeCategory = true
        label.textColor = .blackProt
        label.text = "Quantidade de horas trabalhadas"

        return label
    }()

    private lazy var workersTimeCell: ReportCellView = {
        let viewModel = ReportCellViewModel(title: "Funcionários", value: viewModel.workersTimeValue)
        let cell = ReportCellView(from: viewModel)

        return cell
    }()

    private lazy var allocatedEquipmentCell: ReportCellView = {
        let viewModel = ReportCellViewModel(title: "Equipamentos alocados", value: viewModel.allocatedEquipments)
        let cell = ReportCellView(from: viewModel)

        return cell
    }()

    private lazy var workedHoursCell: ReportCellView = {
        let viewModel = ReportCellViewModel(title: "Horas trabalhadas", value: viewModel.workedHours)
        let cell = ReportCellView(from: viewModel)

        return cell
    }()

    private lazy var productiveHoursCell: ReportCellView = {
        let viewModel = ReportCellViewModel(title: "Horas produtivas", value: viewModel.productiveHours)
        let cell = ReportCellView(from: viewModel)

        return cell
    }()

    private lazy var unproductiveHoursCell: ReportCellView = {
        let viewModel = ReportCellViewModel(title: "Horas improdutivas", value: viewModel.unproductiveHours)
        let cell = ReportCellView(from: viewModel)

        return cell
    }()

    init(viewModel: ReportContainerViewModel, frame: CGRect = .zero) {
        self.viewModel = viewModel

        super.init(frame: frame)

        setupStackView()
        setupViewHierarchy()
    }

    @available(*, unavailable)
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    private func setupStackView() {
        spacing = 10
        axis = .vertical

        backgroundColor = .white
    }

    private func setupViewHierarchy() {
        addArrangedSubview(titleLabel)
        addArrangedSubview(workersTimeCell)
        addArrangedSubview(allocatedEquipmentCell)
        addArrangedSubview(workedHoursCell)
        addArrangedSubview(productiveHoursCell)
        addArrangedSubview(unproductiveHoursCell)
    }
}

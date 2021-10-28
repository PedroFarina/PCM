//
//  ReportContainerView.swift
//  PCM
//
//  Created by pedro.silveira on 28/10/21.
//

import Foundation
import UIKit

final class ReportContainerView: UIStackView {

    private lazy var workersTimeCell: ReportCellView = {
        let viewModel = ReportCellViewModel(title: "Funcionários", value: "")
        let cell = ReportCellView(from: viewModel)

        return cell
    }()

    private lazy var allocatedEquipmentCell: ReportCellView = {
        let viewModel = ReportCellViewModel(title: "Equipamentos alocados", value: "")
        let cell = ReportCellView(from: viewModel)

        return cell
    }()

    private lazy var workedHoursCell: ReportCellView = {
        let viewModel = ReportCellViewModel(title: "Horas trabalhadas", value: "")
        let cell = ReportCellView(from: viewModel)

        return cell
    }()

    private lazy var productiveHoursCell: ReportCellView = {
        let viewModel = ReportCellViewModel(title: "Horas produtivas", value: "")
        let cell = ReportCellView(from: viewModel)

        return cell
    }()

    private lazy var unproductiveHoursCell: ReportCellView = {
        let viewModel = ReportCellViewModel(title: "Horas improdutivas", value: "")
        let cell = ReportCellView(from: viewModel)

        return cell
    }()

    override init(frame: CGRect) {

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
        addArrangedSubview(workersTimeCell)
        addArrangedSubview(allocatedEquipmentCell)
        addArrangedSubview(workedHoursCell)
        addArrangedSubview(productiveHoursCell)
        addArrangedSubview(unproductiveHoursCell)
    }
}

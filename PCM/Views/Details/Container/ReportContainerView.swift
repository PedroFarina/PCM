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

    private lazy var dateTimeCell: ReportCellView = {
        let viewModel = ReportCellViewModel(title: "Data de início prevista", value: { self.viewModel.startDate })
        let cell = ReportCellView(from: viewModel)

        return cell
    }()

    private lazy var serviceValueCell: ReportCellView = {
        let viewModel = ReportCellViewModel(title: "Quantidade de serviço", value: { self.viewModel.serviceValue })
        let cell = ReportCellView(from: viewModel)

        return cell
    }()

    private lazy var officialWorkersCell: ReportCellView = {
        let viewModel = ReportCellViewModel(title: "Funcionários oficiais", value: { self.viewModel.officialWorkersCountValue })
        let cell = ReportCellView(from: viewModel)

        return cell
    }()

    private lazy var nonOfficialWorkersCell: ReportCellView = {
        let viewModel = ReportCellViewModel(title: "Funcionários meio oficiais", value: { self.viewModel.nonOfficialWorkersCountValue })
        let cell = ReportCellView(from: viewModel)

        return cell
    }()

    private lazy var allocatedEquipmentCell: ReportCellView = {
        let viewModel = ReportCellViewModel(title: "Equipamentos alocados", value: { self.viewModel.allocatedEquipments })
        let cell = ReportCellView(from: viewModel)

        return cell
    }()

    private lazy var workedHoursCell: ReportCellView = {
        let viewModel = ReportCellViewModel(title: "Tempo trabalhado", value: { self.viewModel.workedHours })
        let cell = ReportCellView(from: viewModel)

        return cell
    }()

    private lazy var productiveHoursCell: ReportCellView = {
        let viewModel = ReportCellViewModel(title: "Tempo produtivo", value: { self.viewModel.productiveHours })
        let cell = ReportCellView(from: viewModel)

        return cell
    }()

    private lazy var unproductiveHoursCell: ReportCellView = {
        let viewModel = ReportCellViewModel(title: "Tempo improdutivo", value: { self.viewModel.unproductiveHours })
        let cell = ReportCellView(from: viewModel)
        cell.translatesAutoresizingMaskIntoConstraints = false

        return cell
    }()

    private lazy var efficiencyCell: ReportCellView = {
        let viewModel = ReportCellViewModel(title: "Coeficiente de eficiência", value: { self.viewModel.efficiency })
        let cell = ReportCellView(from: viewModel)
        cell.translatesAutoresizingMaskIntoConstraints = false

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

    func reloadData() {
        dateTimeCell.reloadData()
        serviceValueCell.reloadData()
        nonOfficialWorkersCell.reloadData()
        officialWorkersCell.reloadData()
        allocatedEquipmentCell.reloadData()
        workedHoursCell.reloadData()
        productiveHoursCell.reloadData()
        unproductiveHoursCell.reloadData()
        efficiencyCell.reloadData()
    }


    private func setupStackView() {
        spacing = 5
        axis = .vertical

        backgroundColor = .white
        layer.cornerRadius = 4
    }

    private func setupViewHierarchy() {
        addArrangedSubview(dateTimeCell)
        addArrangedSubview(serviceValueCell)
        addArrangedSubview(officialWorkersCell)
        addArrangedSubview(nonOfficialWorkersCell)
        addArrangedSubview(allocatedEquipmentCell)
        addArrangedSubview(workedHoursCell)
        addArrangedSubview(productiveHoursCell)
        addArrangedSubview(unproductiveHoursCell)
        addArrangedSubview(efficiencyCell)
    }
}

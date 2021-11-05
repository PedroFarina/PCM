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
    private var cells: [ReportCellView] = []

    private lazy var dateTimeCell: ReportCellView = makeReportCellWith(title: "Data de inicio prevista", value: { self.viewModel.serviceValue })

    private lazy var serviceValueCell: ReportCellView = makeReportCellWith(title: "Quantidade de serviço", value: { self.viewModel.serviceValue })

    private lazy var officialWorkersCell: ReportCellView = makeReportCellWith(title: "Funcionários oficiais", value: { self.viewModel.officialWorkersCountValue })

    private lazy var nonOfficialWorkersCell: ReportCellView = makeReportCellWith(title: "Funcionários meio oficiais", value: { self.viewModel.nonOfficialWorkersCountValue })

    private lazy var allocatedEquipmentCell: ReportCellView = makeReportCellWith(title: "Equipamentos alocados", value: { self.viewModel.allocatedEquipments })

    private lazy var workedHoursCell: ReportCellView = makeReportCellWith(title: "Tempo total trabalhado", value: { self.viewModel.workedHours })

    private lazy var productiveHoursCell: ReportCellView = makeReportCellWith(title: "Tempo total produtivo", value: { self.viewModel.productiveHours })

    private lazy var unproductiveHoursCell: ReportCellView = makeReportCellWith(title: "Tempo total improdutivo", value: { self.viewModel.unproductiveHours })

    private lazy var efficiencyCell: ReportCellView = makeReportCellWith(title: "Coeficiente de eficiência geral", value: { self.viewModel.efficiency })

    init(viewModel: ReportContainerViewModel, frame: CGRect = .zero) {
        self.viewModel = viewModel

        super.init(frame: frame)

        setupStackView()
        makeViewHierarchy()
    }

    @available(*, unavailable)
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func reloadData() {
        makeViewHierarchy()
    }


    private func setupStackView() {
        spacing = 5
        axis = .vertical

        backgroundColor = .white
        layer.cornerRadius = 4
    }

    private func makeViewHierarchy() {
        cells.forEach({ $0.removeFromSuperview() })
        cells.removeAll()
        cells.append(dateTimeCell)
        cells.append(serviceValueCell)
        cells.append(officialWorkersCell)
        cells.append(nonOfficialWorkersCell)
        cells.append(allocatedEquipmentCell)

        let groupedUnits = Dictionary(grouping: viewModel.activity.workingUnits, by: { $0.description })
        let sortedUnits = groupedUnits.sorted(by: { $0.key < $1.key })
        for grouping in sortedUnits {
            let quantityCell = makeReportCellWith(title: "Quantidade [\(grouping.key)]",
                                                  value: { String(grouping.value.count) })
            cells.append(quantityCell)
            let efficiencyCell = makeReportCellWith(title: "Eficiência [\(grouping.key)]",
                                                    value: { self.calculateEfficiencyFor(activity: self.viewModel.activity, and: grouping.value) })
            cells.append(efficiencyCell)
        }

        cells.append(workedHoursCell)
        cells.append(productiveHoursCell)
        cells.append(unproductiveHoursCell)
        cells.append(efficiencyCell)

        for cell in cells {
            addArrangedSubview(cell)
        }
    }

    private func makeReportCellWith(title: String, value: @escaping () -> String) -> ReportCellView {
        let viewModel = ReportCellViewModel(title: title, value: value)
        let cell = ReportCellView(from: viewModel)

        return cell
    }

    /// This should not exist, but I'm lazy and just want to end the app at this point
    private func calculateEfficiencyFor(activity: PCMActivity, and workingUnits: [PCMWorkingUnit]) -> String {
        let peopleCount = Double(workingUnits.count)
        let allHours = peopleCount * activity.timeElapsed
        let unproductiveIndividualHours = activity.impeditives.filter({ !$0.category.appliesToAll }).map({ $0.timeSpent }).reduce(0, +)
        let unproductiveGroupedHours = activity.impeditives.filter({ $0.category.appliesToAll }).map({ $0.timeSpent * peopleCount }).reduce(0, +)
        let unproductiveHours = unproductiveIndividualHours + unproductiveGroupedHours
        let usefulHours = (allHours - unproductiveHours)/3600

        return String(format: "%.2f", (peopleCount * usefulHours / activity.serviceValue))
    }
}

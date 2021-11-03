//
//  ActivitiesViewController.swift
//  PCM
//
//  Created by Francielly Cristina Ortiz Candido on 13/10/21.
//

import Foundation
import UIKit
import Simple_QR_Reader

internal class ActivitiesViewController: UIViewController, SimpleQROutputDelegate {
    
    private lazy var exitButton: UIBarButtonItem = {
        var exitButton = UIBarButtonItem()
        exitButton = UIBarButtonItem(title: "Sair", style: UIBarButtonItem.Style.plain, target: self, action: #selector(logoutTap(_:)))
        exitButton.tintColor = .buttonColor
        return exitButton
    }()

    private let tableViewDataSource = ActivitiesTableViewDataSource()
    weak var selectedActivity: PCMActivity?

    private lazy var tableViewDelegate = ActivitiesViewControllerTableViewDelegate { [weak self] indexPath in
        guard let self = self else { return }

        let activity = self.tableViewDataSource.activityAt(indexPath.row)
        if activity.state != .todo {
            let detailsViewController = DetailsViewController(with: self.tableViewDataSource.activityAt(indexPath.row))
            self.navigationController?.pushViewController(detailsViewController, animated: true)
        } else {
            activity.state = .doing
            self.tableView.reloadData()
            self.segmentedControlCustom.selectedSegmentIndex = 1
            self.tableViewDataSource.filterBy(.doing)
            self.selectedActivity = activity
            let qrVC = SimpleQRViewController()
            self.present(qrVC, animated: true)
        }

        self.tableView.deselectRow(at: indexPath, animated: true)
    }

    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = .clear
        table.translatesAutoresizingMaskIntoConstraints = false
        table.dataSource = tableViewDataSource
        table.delegate = tableViewDelegate
        return table
    }()
    
    private lazy var segmentedControlCustom: UISegmentedControl = {
        let segmentedControlCustom: UISegmentedControl
        let items = ["Liberados", "Em execução", "Concluídos"]
        segmentedControlCustom = UISegmentedControl(items: items)
        segmentedControlCustom.translatesAutoresizingMaskIntoConstraints = false
        segmentedControlCustom.selectedSegmentIndex = 0
        let xPostion:CGFloat = 10
        let yPostion:CGFloat = 150
        let elementWidth:CGFloat = 300
        let elementHeight:CGFloat = 30
        segmentedControlCustom.frame = CGRect(x: xPostion, y: yPostion, width: elementWidth, height: elementHeight)
        segmentedControlCustom.backgroundColor = .segmentedColor
        segmentedControlCustom.addTarget(self, action: #selector(self.segmentedValueChanged(_:)), for: .valueChanged)
        return segmentedControlCustom
    }()
    
    private lazy var constraints: [NSLayoutConstraint] = {
        [
            segmentedControlCustom.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.height * 0.125),
            segmentedControlCustom.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            segmentedControlCustom.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            
            tableView.topAnchor.constraint(equalTo: segmentedControlCustom.bottomAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            
        ]
    }()
    
    internal override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .bgColor
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        self.navigationItem.title = "Atividades"
        navigationItem.rightBarButtonItem = exitButton
        
        view.addSubview(segmentedControlCustom)
        view.addSubview(tableView)
    }
    
    internal override func viewDidLayoutSubviews() {
        NSLayoutConstraint.activate(constraints)
    }
    
    @objc private func logoutTap (_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    @objc private func segmentedValueChanged(_ sender:UISegmentedControl!)
    {
        switch sender.selectedSegmentIndex {
            case 0:
                tableViewDataSource.filterBy(.todo)
            case 1:
                tableViewDataSource.filterBy(.doing)
            case 2:
                tableViewDataSource.filterBy(.done)
            default:
                break
        }
        tableView.beginUpdates()
        tableView.reloadSections(.init(integer: 0), with: .automatic)
        tableView.endUpdates()
    }

    override func viewWillAppear(_ animated: Bool) {
        tableView.beginUpdates()
        tableView.reloadSections(.init(integer: 0), with: .automatic)
        tableView.endUpdates()
    }

    func viewDidSetup() {
    }

    func qrCodeFound(_ value: String) {
        let cut = value.split(separator: ",").map({ String($0) })

        guard cut.count == 4,
              let category = WorkingUnitCategory(rawValue: cut[0]),
              let subcategory = WorkingUnitSubcategory(rawValue: cut[1]) else {
            return
        }
        let workingUnit = ModelController.createWorkingUnit(description: cut[2], category: category, subcategory: subcategory, title: cut[3])
        selectedActivity?.addWorkingUnit(workingUnit, at: Date())
    }

    func viewWasDismissed() {
        selectedActivity = nil
    }
}

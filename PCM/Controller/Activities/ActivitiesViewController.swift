//
//  ActivitiesViewController.swift
//  PCM
//
//  Created by Francielly Cristina Ortiz Candido on 13/10/21.
//

import Foundation
import UIKit

class ActivitiesScreenViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    private lazy var atividades: [String] = {
        let atividades: [String] = ["Atividade 1", "Atividade 2", "Atividade 3", "Atividade 4", "Atividade 5", "Atividade 6"]
        return atividades
    }()
    
    let cellReuseIdentifier = "cell"
    
    private lazy var exitButton: UIBarButtonItem = {
        var exitButton = UIBarButtonItem()
        exitButton = UIBarButtonItem(title: "Sair", style: UIBarButtonItem.Style.plain, target: self, action: #selector(logoutTap(_:)))
        exitButton.tintColor = .buttonColor
        return exitButton
    }()
    
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = .clear
        table.translatesAutoresizingMaskIntoConstraints = false
        table.dataSource = self
        table.delegate = self
        table.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        return table
    }()
    
    private lazy var segmentedControlCustom: UISegmentedControl = {
        let segmentedControlCustom: UISegmentedControl
        let items = ["Liberados", "Em execução", "Concluídos"]
        segmentedControlCustom = UISegmentedControl(items: items)
        segmentedControlCustom.translatesAutoresizingMaskIntoConstraints = false
        segmentedControlCustom.selectedSegmentIndex = 1
        let xPostion:CGFloat = 10
        let yPostion:CGFloat = 150
        let elementWidth:CGFloat = 300
        let elementHeight:CGFloat = 30
        segmentedControlCustom.frame = CGRect(x: xPostion, y: yPostion, width: elementWidth, height: elementHeight)
        segmentedControlCustom.selectedSegmentIndex = 1
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
    
    override func viewDidLoad() {
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
    
    override func viewDidLayoutSubviews() {
        NSLayoutConstraint.activate(constraints)
    }
    
    @objc func logoutTap (_ sender: UIButton){
        self.present(InitialScreenViewController(), animated: true)
    }
    
    @objc func segmentedValueChanged(_ sender:UISegmentedControl!)
    {
        switch sender.selectedSegmentIndex {
        case 0:
            print ("Liberados")
        case 1:
            print ("Em execução")
        case 2:
            print ("Concluídos")
        default:
            break
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // create a new cell if needed or reuse an old one
        let cell:UITableViewCell = (self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as UITableViewCell?)!
               
               // set the text from the data model
            cell.textLabel?.text = self.atividades[indexPath.row]
        cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator
               
               return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            print("Célula tocada - \(indexPath.row).")
        }
}

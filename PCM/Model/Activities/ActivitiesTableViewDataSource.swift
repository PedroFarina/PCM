//
//  ActivitiesTableViewDataSource.swift
//  PCM
//
//  Created by Pedro Farina on 17/10/21.
//

import UIKit

internal class ActivitiesTableViewDataSource: NSObject, UITableViewDataSource {
    private var atividades: [String] = {
        let atividades: [String] = ["Atividade 1", "Atividade 2", "Atividade 3", "Atividade 4", "Atividade 5", "Atividade 6"]
        return atividades
    }()

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return atividades.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = atividades[indexPath.row]
        return cell
    }
}

//
//  DetailsTableViewDataSource.swift
//  PCM
//
//  Created by Francielly Cristina Ortiz Candido on 18/10/21.
//

import Foundation
import UIKit

internal class DetailsTableViewDataSource: NSObject, UITableViewDataSource {
//    private var atividades: [String] = {
//        let atividades: [String] = ["Atividade 1", "Atividade 2", "Atividade 3", "Atividade 4", "Atividade 5", "Atividade 6"]
//        return atividades
//    }()

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.register(CellStyle.self, forCellReuseIdentifier: "cell")
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CellStyle else { preconditionFailure() }
        
        cell.comentAtv.text = "Teste"
        return cell
    }
}

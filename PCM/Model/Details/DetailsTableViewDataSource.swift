//
//  DetailsTableViewDataSource.swift
//  PCM
//
//  Created by Francielly Cristina Ortiz Candido on 18/10/21.
//

import Foundation
import UIKit

internal class DetailsTableViewDataSource: NSObject, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.register(CellStyle.self, forCellReuseIdentifier: "cell")
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CellStyle else { preconditionFailure() }
        
        cell.comentAtv.text = "Teste"
        cell.layer.cornerRadius = 7
        cell.clipsToBounds = true
        return cell
    }
}

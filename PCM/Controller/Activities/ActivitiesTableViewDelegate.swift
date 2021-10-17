//
//  ActivitiesTableViewDelegate.swift
//  PCM
//
//  Created by Pedro Farina on 17/10/21.
//

import UIKit

internal class ActivitiesTableViewDelegate: NSObject, UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selecionou")
    }
}

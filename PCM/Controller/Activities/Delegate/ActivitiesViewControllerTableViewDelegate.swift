//
//  ActivitiesViewControllerTableViewDelegate.swift
//  PCM
//
//  Created by pedro.silveira on 28/10/21.
//

import Foundation
import UIKit

final class ActivitiesViewControllerTableViewDelegate: NSObject, UITableViewDelegate {

    private let rowAction: () -> Void

    init(action: @escaping () -> Void) {
        rowAction = action
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        rowAction()
    }
}

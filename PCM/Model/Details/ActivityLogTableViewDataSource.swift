//
//  DetailsTableViewDataSource.swift
//  PCM
//
//  Created by Francielly Cristina Ortiz Candido on 18/10/21.
//

import Foundation
import UIKit

internal class ActivityLogTableViewDataSource: NSObject, UITableViewDataSource {
    private let activity: PCMActivity

    init(with activity: PCMActivity) {
        self.activity = activity
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return activity.logItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ActivityLogTableViewCell.identifier, for: indexPath) as? ActivityLogTableViewCell else { fatalError() }
        cell.descriptionText = activity.logItems[indexPath.row].description
        cell.date = activity.logItems[indexPath.row].registeredAt
        return cell
    }
}

//
//  ActivitiesTableViewDataSource.swift
//  PCM
//
//  Created by Pedro Farina on 17/10/21.
//

import UIKit

internal class ActivitiesTableViewDataSource: NSObject, UITableViewDataSource {
    private var filter: PCMActivityState = .todo
    private var activities: [PCMActivity] = ModelController.getMockedActivities()
    private var filteredActivities: [PCMActivity] {
        activities.filter({ $0.state == filter })
    }

    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredActivities.count
    }
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = filteredActivities[indexPath.row].name
        return cell
    }

    internal func filterBy(_ state: PCMActivityState) {
        self.filter = state
    }
}

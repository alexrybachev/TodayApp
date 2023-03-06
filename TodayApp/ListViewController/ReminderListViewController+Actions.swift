//
//  ReminderListViewController+Actions.swift
//  TodayApp
//
//  Created by Aleksandr Rybachev on 05.03.2023.
//

import UIKit

extension ReminderListViewController {
    
    @objc func didPressDoneButton(_ sender: ReminderDoneButton) {
        guard let id = sender.id else { return }
        completeReminder(withId: id)
    }
}

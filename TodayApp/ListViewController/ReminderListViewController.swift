//
//  ReminderListViewController.swift
//  TodayApp
//
//  Created by Aleksandr Rybachev on 04.03.2023.
//

import UIKit

class ReminderListViewController: UICollectionViewController {
   
    var dataSource: DataSource!
    var reminders: [Reminder] = Reminder.sampleData

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let listLayout = listLayout()
        collectionView.collectionViewLayout = listLayout
        
//        let cellRegistration = UICollectionView.CellRegistration {
//            (cell: UICollectionViewListCell, indexPath: IndexPath, itemIdentifier: String) in
//            let reminder = Reminder.sampleData[indexPath.item]
//            var contentConfiguration = cell.defaultContentConfiguration()
//            contentConfiguration.text = reminder.title
//            cell.contentConfiguration = contentConfiguration
//        }
        
        let cellRegistration = UICollectionView.CellRegistration(handler: cellRegistrationHandler)
        
        dataSource = DataSource(collectionView: collectionView) {
            (collectionView: UICollectionView, indexPath: IndexPath, itemIdentifier: Reminder.ID) in
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
        }
        
//        var snapshot = Snapshot()
//        snapshot.appendSections([0])
//        var reminderTitles = [String]()
//        for reminder in Reminder.sampleData {
//            reminderTitles.append(reminder.title)
//        }
//        snapshot.appendItems(reminderTitles)
//        snapshot.appendItems(Reminder.sampleData.map { $0.title })
//        snapshot.appendItems(reminders.map { $0.id })
//        dataSource.apply(snapshot)
        
        updateSnapshot()
        
        collectionView.dataSource = dataSource
    }
    
    private func listLayout() -> UICollectionViewCompositionalLayout {
        var listConfiguration = UICollectionLayoutListConfiguration(appearance: .grouped)
        listConfiguration.showsSeparators = false
        listConfiguration.backgroundColor = .clear
        return UICollectionViewCompositionalLayout.list(using: listConfiguration)
    }


}


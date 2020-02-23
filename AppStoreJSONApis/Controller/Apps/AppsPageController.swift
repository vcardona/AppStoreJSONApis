//
//  AppsPageController.swift
//  AppStoreJSONApis
//
//  Created by Victor Hugo on 3/02/20.
//  Copyright © 2020 Vintage Robot. All rights reserved.
//

import UIKit

class AppsPageController: BaseListController, UICollectionViewDelegateFlowLayout{
    
    //Iniciamos con el proceso común para la creación de un Collection View
    
    let cellId = "id"
    let headerId = "headerId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        
        collectionView.register(AppsGroupCell.self, forCellWithReuseIdentifier: cellId)
        
        // 1
        collectionView.register(AppsPageHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
        
        fetchData()
    }
    
//    var editorsChoiceGames : AppGroup?
    
    var groups = [AppGroup]()
    
    fileprivate func fetchData()
    {
        
        var group1: AppGroup?
        var group2: AppGroup?
        var group3: AppGroup?
        
        //Esto nos ayuda a que cada uno de los datos se cargue juntos y no en el orden que se tiene.
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        Service.shared.fetchGames {(appGroup, err) in
            dispatchGroup.leave()
            group1 = appGroup
        }
        
        dispatchGroup.enter()
        Service.shared.fetchTopGrossing{ (appGroup, err) in
            dispatchGroup.leave()
            group2 = appGroup
        }
            
        dispatchGroup.enter()
        Service.shared.fetchAppGroup(urlString: "https://rss.itunes.apple.com/api/v1/us/ios-apps/top-free/all/50/explicit.json") {
                (appGroup, err) in
                dispatchGroup.leave()
                group3 = appGroup
            }
        
        dispatchGroup.notify(queue: .main){
            print("completed your dispatch group tasks...")
            
            if let group = group1{
                self.groups.append(group)
            }
            if let group = group2{
                self.groups.append(group)
            }
            if let group = group3{
                self.groups.append(group)
            }
            self.collectionView.reloadData()
        }
    }
    
    // 2
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath)
        return header
    }
    
    // 3
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 300)
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return groups.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! AppsGroupCell
        
        let appGroup = groups[indexPath.item]
        
        cell.titleLabel.text = appGroup.feed.title
        cell.horizontalController.appGroup = appGroup
        cell.horizontalController.collectionView.reloadData()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 300)
    }
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 16, left: 0, bottom: 0, right: 0)
    }
}

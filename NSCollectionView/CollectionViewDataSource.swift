//
//  AppDelegate.swift
//  NSCollectionView
//
//  Created by Albert Sanchez on 9/11/17.
//  Copyright © 2017 Albert Sanchez. All rights reserved.
//
import Cocoa
class CollectionViewDataSource: NSObject, NSCollectionViewDataSource {
    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return NamesModel.singleton.namesList.count
    }
    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        return collectionView.makeItem(withIdentifier: "CollectionViewItem", for: indexPath)
    }
}

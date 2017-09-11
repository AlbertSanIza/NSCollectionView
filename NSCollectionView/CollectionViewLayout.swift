//
//  AppDelegate.swift
//  NSCollectionView
//
//  Created by Albert Sanchez on 9/11/17.
//  Copyright © 2017 Albert Sanchez. All rights reserved.
//
import Cocoa
class CollectionViewLayout: NSCollectionViewFlowLayout {
    override func prepare() {
        super.prepare()
        self.itemSize = NSSize(width: 450, height: 50)
        self.minimumLineSpacing = 5.0
    }
}

//
//  AppDelegate.swift
//  NSCollectionView
//
//  Created by Albert Sanchez on 9/11/17.
//  Copyright © 2017 Albert Sanchez. All rights reserved.
//
import Cocoa
class CollectionViewItem: NSCollectionViewItem {
    override var isSelected: Bool {
        didSet {
            view.layer?.borderWidth = isSelected ? 2.0 : 0.0
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.wantsLayer = true
        view.layer?.backgroundColor = CGColor(red:0.80, green:0.80, blue:0.80, alpha:1.0)
        view.layer?.borderColor = CGColor.black
        view.layer?.borderWidth = 0.0
    }
}

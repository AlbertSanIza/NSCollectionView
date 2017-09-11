//
//  ViewController.swift
//  NSCollectionView
//
//  Created by Albert Sanchez on 9/11/17.
//  Copyright © 2017 Albert Sanchez. All rights reserved.
//
import Cocoa
class ViewController: NSViewController {
    @IBOutlet weak var collectionView: NSCollectionView!
    @IBOutlet weak var nameTextField: NSTextField!
    var collectionViewDataSource = CollectionViewDataSource()
    var collectionViewDelegate = CollectionViewDelegate()
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = collectionViewDataSource
        collectionView.delegate = collectionViewDelegate
        collectionView.collectionViewLayout = CollectionViewLayout()
        collectionView.register(forDraggedTypes: [NSPasteboardTypeString])
    }
    override var representedObject: Any? {
        didSet {
        }
    }
    @IBAction func addClicked(_ sender: Any) {
        if NamesModel.singleton.addName(newName: nameTextField.stringValue) {
            collectionView.reloadData()
            nameTextField.stringValue = ""
        }
    }
    @IBAction func moveUpClicked(_ sender: Any) {
        if collectionView.selectionIndexes.count > 0 {
            var newIndexPath = collectionView.selectionIndexPaths.first
            newIndexPath?.item -= 1
            if NamesModel.singleton.moveNameUp(at: (collectionView.selectionIndexPaths.first?.item)!) {
                collectionView.animator().moveItem(at: collectionView.selectionIndexPaths.first!, to: newIndexPath!)
            }
            
        }
    }
    @IBAction func moveDownClicked(_ sender: Any) {
        if collectionView.selectionIndexes.count > 0 {
            var newIndexPath = collectionView.selectionIndexPaths.first
            newIndexPath?.item += 1
            if NamesModel.singleton.moveNameDown(at: (collectionView.selectionIndexPaths.first?.item)!) {
                collectionView.animator().moveItem(at: collectionView.selectionIndexPaths.first!, to: newIndexPath!)
            }
        }
    }
    @IBAction func deleteClicked(_ sender: Any) {
        if collectionView.selectionIndexes.count > 0 {
            NamesModel.singleton.removeName(at: (collectionView.selectionIndexPaths.first?.item)!)
            collectionView.deleteItems(at: collectionView.selectionIndexPaths)
        }
    }
}

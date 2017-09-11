//
//  AppDelegate.swift
//  NSCollectionView
//
//  Created by Albert Sanchez on 9/11/17.
//  Copyright © 2017 Albert Sanchez. All rights reserved.
//
import Cocoa
class CollectionViewDelegate: NSObject, NSCollectionViewDelegate {
    var draggingIndexPaths: Set<IndexPath> = []
    var draggingItem: NSCollectionViewItem?
    func collectionView(_ collectionView: NSCollectionView, willDisplay item: NSCollectionViewItem, forRepresentedObjectAt indexPath: IndexPath) {
        item.textField?.stringValue = NamesModel.singleton.namesList[indexPath.item]
    }
    func collectionView(_ collectionView: NSCollectionView, draggingSession session: NSDraggingSession, willBeginAt screenPoint: NSPoint, forItemsAt indexPaths: Set<IndexPath>) {
        draggingIndexPaths = indexPaths
        if let indexPath = draggingIndexPaths.first,
            let item = collectionView.item(at: indexPath) {
            draggingItem = item
        }
    }
    func collectionView(_ collectionView: NSCollectionView, draggingSession session: NSDraggingSession, endedAt screenPoint: NSPoint, dragOperation operation: NSDragOperation) {
        draggingIndexPaths = []
        draggingItem = nil
    }
    func collectionView(_ collectionView: NSCollectionView, writeItemsAt indexPaths: Set<IndexPath>, to pasteboard: NSPasteboard) -> Bool {
        pasteboard.declareTypes([NSPasteboardTypeString], owner: nil)
        return true
    }
//    func collectionView(_ collectionView: NSCollectionView, pasteboardWriterForItemAt index: Int) -> NSPasteboardWriting? {
//        let pb = NSPasteboardItem()
//        pb.setString(String(index), forType: NSPasteboardTypeString)
//        return pb
//    }
    func collectionView(_ collectionView: NSCollectionView, validateDrop draggingInfo: NSDraggingInfo, proposedIndexPath proposedDropIndexPath: AutoreleasingUnsafeMutablePointer<NSIndexPath>, dropOperation proposedDropOperation: UnsafeMutablePointer<NSCollectionViewDropOperation>) -> NSDragOperation {
        let proposedDropIndexPath: IndexPath = proposedDropIndexPath.pointee as IndexPath
        if let draggingItemLocal = draggingItem {
            if let currentIndexPath = collectionView.indexPath(for: draggingItemLocal) {
                if currentIndexPath != proposedDropIndexPath {
                    if proposedDropIndexPath.item < collectionView.numberOfItems(inSection: 0) {
                        collectionView.animator().moveItem(at: currentIndexPath, to: proposedDropIndexPath)
                    }
                }
            }
        }
        return .move
    }
    func collectionView(_ collectionView: NSCollectionView, acceptDrop draggingInfo: NSDraggingInfo, indexPath: IndexPath, dropOperation: NSCollectionViewDropOperation) -> Bool {
        NamesModel.singleton.moveName(at: (draggingIndexPaths.first?.item)!, to: indexPath.item)
        return true
    }
}

//
//  AppDelegate.swift
//  NSCollectionView
//
//  Created by Albert Sanchez on 9/11/17.
//  Copyright © 2017 Albert Sanchez. All rights reserved.
//
class NamesModel {
    static let singleton = NamesModel()
    var namesList = ["Albert", "Anayara", "Jaime", "Chris", "Gisel"].sorted()
    func addName(newName: String) -> Bool {
        if newName != "" {
            namesList.append(newName)
            return true
        }
        return false
    }
    func removeName(at: Int) {
        namesList.remove(at: at)
    }
    func moveName(at: Int, to: Int) {
        let element = namesList.remove(at: at)
        namesList.insert(element, at: to)
    }
    func moveNameUp(at: Int) -> Bool {
        if at != 0 {
            let element = namesList.remove(at: at)
            namesList.insert(element, at: at - 1)
            return true
        }
        return false
    }
    func moveNameDown(at: Int) -> Bool {
        if at != namesList.endIndex - 1 {
            let element = namesList.remove(at: at)
            namesList.insert(element, at: at + 1)
            return true
        }
        return false
    }
}

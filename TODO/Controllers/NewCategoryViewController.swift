//
//  NewCategoryViewController.swift
//  TODO
//
//  Created by Brandan McDevitt on 04/06/2018.
//  Copyright © 2018 Brandan McDevitt. All rights reserved.
//

import UIKit
import RealmSwift
import ChameleonFramework

class NewCategoryViewController: UIViewController {

    let realm = try! Realm()
    var categories: Results<Category>?
    let newCategory = Category()
    var colourChoice : String = ""
    @IBOutlet weak var categoryName: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    let btn = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func colourChoice(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            print("red")
            colourChoice = "#F44336"
        case 2:
            print("Blue")
            colourChoice = "#E91E63"
        case 3:
            colourChoice = "#9C27B0"
        case 4:
            colourChoice = "#3F51B5"
        case 5:
            colourChoice = "#03A9F4"
        case 6:
            colourChoice = "#009688"
        case 7:
            colourChoice = "#8BC34A"
        case 8:
            colourChoice = "#FFEB3B"
        case 9:
            colourChoice = "#FF9800"
        case 10:
            colourChoice = "#795548"
        default:
            print("colour not chosen")
        }
    }
    
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        if categoryName.text != "" {
        newCategory.name = categoryName.text!
        newCategory.colour = colourChoice
        save(category: newCategory)
        self.navigationController?.popViewController(animated: true)
        }
    }
    
    //save function
    func save(category : Category) {
        do {
            try realm.write {
                realm.add(category)
            }
        } catch {
            print("Error saving context: \(error)")
        }
    }
    
    
}

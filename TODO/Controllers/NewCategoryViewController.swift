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
    let appColour : String = "#a0c71e"
    @IBOutlet weak var categoryName: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    let btn = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        guard let navbar = navigationController?.navigationBar else {fatalError("Navigation Controller does not exist")}
        guard let navBarColour = UIColor(hexString: appColour) else { fatalError() }
        navbar.barTintColor = navBarColour
        //navbar.tintColor = ContrastColorOf(navBarColour, returnFlat: true)
        navbar.largeTitleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
        navbar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
    }

    @IBAction func colourChoice(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            print("Red")
            colourChoice = "#F44336"
            updateBorders(for: sender)
        case 2:
            print("Blue")
            colourChoice = "#E91E63"
            updateBorders(for: sender)
        case 3:
            print("Purple")
            colourChoice = "#9C27B0"
            updateBorders(for: sender)
        case 4:
            print("Blue")
            colourChoice = "#3F51B5"
            updateBorders(for: sender)
        case 5:
            print("Sky Blue")
            colourChoice = "#03A9F4"
            updateBorders(for: sender)
        case 6:
            print("Green")
            colourChoice = "#009688"
            updateBorders(for: sender)
        case 7:
            print("Lime")
            colourChoice = "#8BC34A"
            updateBorders(for: sender)
        case 8:
            print("Yellow")
            colourChoice = "#FFEB3B"
            updateBorders(for: sender)
        case 9:
            print("Orange")
            colourChoice = "#FF9800"
            updateBorders(for: sender)
        case 10:
            print("Brown")
            colourChoice = "#795548"
            updateBorders(for: sender)
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func updateBorders(for button : UIButton) {
        button.layer.borderWidth = 5
        button.layer.borderColor = UIColor.flatGray.cgColor
    }

}

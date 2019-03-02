//
//  ViewController.swift
//  InteractiveStory
//
//  Created by nikko444 on 2019-03-01.
//  Copyright © 2019 nikko444. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "startAdventure" {
            
            do {
                if let name = nameTextField.text {
                    if name == "" {
                        throw AdventureError.nameIsNotProvided
                    } else {
                        if let pageController = segue.destination as? PageController {
                            pageController.page = Adventure.story(withName: name)
                        } else {
                            return
                        }
                    }
                }
            } catch AdventureError.nameIsNotProvided {
                let alertController = UIAlertController(title: "Name not Provided", message: "Provide a name to start the Story", preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                alertController.addAction(action)
                present(alertController, animated: true, completion: nil)
            } catch let error {
                fatalError("\(error.localizedDescription)")
            }
            }
        }
    }



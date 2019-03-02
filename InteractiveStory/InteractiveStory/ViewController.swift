//
//  ViewController.swift
//  InteractiveStory
//
//  Created by nikko444 on 2019-03-01.
//  Copyright © 2019 nikko444. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let story = Page(story: .touchDown)
        
        story.firstChoice = (title: "someTitle", page: Page(story: .droid))
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "startAdventure" {
            if let pageController = segue.destination as? PageController {
                pageController.page = Adventure.story
            } else {
                return
            }
            
        }
    }


}


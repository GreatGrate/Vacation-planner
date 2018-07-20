//
//  plannerController.swift
//  Vacation Planner
//
//  Created by Mouse food on 7/18/18.
//  Copyright © 2018 Mouse food. All rights reserved.
//

import UIKit
import CoreData

class plannerController: UIViewController {
    
    @IBOutlet weak var plannerTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        let saveButton = UIBarButtonItem(title:"Save", style: UIBarButtonItemStyle.plain, target: self, action: #selector(plannerController.back(sender:)))
        self.navigationItem.rightBarButtonItem = saveButton
    }
    override func didReceiveMemoryWarning() {
       super.didReceiveMemoryWarning()
    }
    override func viewWillAppear(_ animated: Bool) {
        if CoreDataHelper.loadContent() != nil {
            plannerTextView.text = CoreDataHelper.loadContent()!.content
        } else {
            print("Nothing to load...")
        }
    }

    @objc func back(sender: UIBarButtonItem) {
//        let newPlannerTextView = CoreDataHelper.
        //In here, we're about to save something new
        let newContent = CoreDataHelper.newContent()
        newContent.content = plannerTextView.text
        CoreDataHelper.saveContent()
        
        _ = navigationController?.popViewController(animated: true)
    }
}

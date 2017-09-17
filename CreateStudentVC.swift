//
//  CreateStudentVC.swift
//  MyPersonalTrainer
//
//  Created by Nuno on 11/09/2017.
//  Copyright © 2017 Nuno. All rights reserved.
//

import UIKit
import CoreData

class CreateStudentVC: UIViewController {
    
    @IBOutlet weak var studentName: UITextField!
    @IBOutlet weak var overallMuscleMass: UITextField!
    @IBOutlet weak var weight: UITextField!
    @IBOutlet weak var overallBodyFat: UITextField!
    
    var moc: NSManagedObjectContext!
    
//    var studentDetails: Physique?{
//        didSet{
//            self.configureView()
//        }
//    }
    
//    func configureView(){
//        
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func saveStudent(_ sender: Any) {
        
        let student = Student(context: context)
        
        if let name = studentName.text{
            student.name = name
        }
        
        ad.saveContext()
        navigationController?.popViewController(animated: true)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

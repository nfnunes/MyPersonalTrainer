//
//  StudentListVC.swift
//  MyPersonalTrainer
//
//  Created by Nuno on 03/09/2017.
//  Copyright © 2017 Nuno. All rights reserved.
//

import UIKit
import CoreData

class StudentListVC: UIViewController, UITableViewDelegate, UITableViewDataSource, NSFetchedResultsControllerDelegate {

    @IBOutlet weak var studentTableView: UITableView!
    
    var controller: NSFetchedResultsController<Student>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        studentTableView.delegate = self
        studentTableView.dataSource = self
        
        attemptFetch()
 
    }
    
    
    func attemptFetch(){
        let fetchRequest: NSFetchRequest<Student> = Student.fetchRequest()
        
        // Edit the sort key as appropriate.
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        
        controller.delegate = self
        
        self.controller = controller
        
        do {
            try controller.performFetch()
        } catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        studentTableView.beginUpdates()
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        studentTableView.endUpdates()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch(type){
        case.insert:
            if let indexPath = newIndexPath{
                studentTableView.insertRows(at: [indexPath], with: .fade)
            }
            break
            
        case.delete:
            if let indexPath = indexPath{
                studentTableView.deleteRows(at: [indexPath], with: .fade)
            }
            break
            
        case.update:
            if let indexPath = indexPath{
                let cell = studentTableView.cellForRow(at: indexPath) as! StudentListCell
                configureCell(cell: cell, indexPath: indexPath as IndexPath)
            }
            break
            
        case.move:
            if let indexPath = indexPath{
                studentTableView.deleteRows(at: [indexPath], with: .fade)
            }
            
            if let indexPath = indexPath{
                studentTableView.insertRows(at: [indexPath], with: .fade)
            }
            break
        }
    }
    // MARK: - Table View
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if let sections = controller.sections{
            return sections.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let sections = controller.sections{
            let sectionInfo = sections[section]
            return sectionInfo.numberOfObjects
        }
        return 0
    }
    
    func configureCell(cell: StudentListCell, indexPath: IndexPath){
        // update Cell
        
        let student = controller.object(at: indexPath as IndexPath)
        cell.updateUI(student: student)
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "studentListCell", for: indexPath) as! StudentListCell
        configureCell(cell: cell, indexPath: indexPath as IndexPath)
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

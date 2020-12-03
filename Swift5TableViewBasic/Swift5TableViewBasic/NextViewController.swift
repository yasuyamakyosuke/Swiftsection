//
//  NextViewController.swift
//  Swift5TableViewBasic
//
//  Created by 泰山恭輔 on 2020/11/30.
//

import UIKit

class NextViewController: UIViewController {
    
    
    var toDoString = String()
    @IBOutlet weak var todoLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        todoLabel.text = toDoString


    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

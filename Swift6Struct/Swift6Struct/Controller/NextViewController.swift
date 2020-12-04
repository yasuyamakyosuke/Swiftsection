//
//  NextViewController.swift
//  Swift6Struct
//
//  Created by 泰山恭輔 on 2020/12/04.
//

import UIKit

protocol SetOKDelegate {
    func setOK(check:Person)
}

class NextViewController: UIViewController {
    
    var person = Person()
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var shumiTextField: UITextField!
    @IBOutlet weak var musicTextField: UITextField!
    
    var setOKDelegate:SetOKDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func done(_ sender: Any) {
        
        person.name = nameTextField.text!
        person.shumi = shumiTextField.text!
        person.music = musicTextField.text!
        setOKDelegate?.setOK(check: person)
        dismiss(animated: true, completion: nil)
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

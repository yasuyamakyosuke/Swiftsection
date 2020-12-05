//
//  NextViewController.swift
//  Swift5MapAndProtocol
//
//  Created by 泰山恭輔 on 2020/12/04.
//

import UIKit

protocol searchLocationDelegate {
    func searchLocation(idovalue:String,keidovalue:String)
}

class NextViewController: UIViewController {
    
    @IBOutlet weak var idoTextField: UITextField!
    
    @IBOutlet weak var keidoTextField: UITextField!
    
    var delegate:searchLocationDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func okAction(_ sender: Any) {
        
        //入力された値を取得
        let idovalue = idoTextField.text!
        let keidovalue = keidoTextField.text!
        
        
        //両方のtextfieldが空でなければdissmiss(画面が戻る)
        if idoTextField.text != nil && keidoTextField.text != nil {
            //delegateメソッドの引数に入れる
            delegate?.searchLocation(idovalue: idovalue, keidovalue: keidovalue)
            dismiss(animated: true, completion: nil)
        }
        
        
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

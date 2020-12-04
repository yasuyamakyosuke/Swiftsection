//
//  ViewController.swift
//  ProtocolBasicApp1
//
//  Created by 泰山恭輔 on 2020/12/04.
//

import UIKit
//Protocolを宣言する
class ViewController: UIViewController,Catchprotocol {

    
    @IBOutlet weak var label: UILabel!
    
    var count = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    func catchDate(count: Int) {
        label.text = String(count)
    }


    @IBAction func next(_ sender: Any) {
        
        performSegue(withIdentifier: "next", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextVC = segue.destination as! NextViewController
        nextVC.delegate = self
        
    }
}


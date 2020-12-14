//
//  ViewController.swift
//  Swift5ShindanMaker1
//
//  Created by 泰山恭輔 on 2020/12/11.
//

import UIKit
import BubbleTransition
import Firebase

class FeedItem{
    var meigen:String!
    var auther:String!
    
}


class ViewController: UIViewController,XMLParserDelegate,UIViewControllerTransitioningDelegate {
    
    var userName = String()
    
    @IBOutlet weak var meigenLabel: UILabel!
    
    @IBOutlet weak var toFeedButton: UIButton!
    
    let db = Firestore.firestore()
    let transition = BubbleTransition()
    let interactiveTransition = BubbleInteractiveTransition()
    var parser = XMLParser()
    var feedItem = [FeedItem]()
    
    var currentElementName:String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        toFeedButton.layer.cornerRadius = toFeedButton.frame.width/2
        
        self.navigationController?.isNavigationBarHidden = true
        
        //XML解析を行っていく
         let url = "http://meigen.doodlemote.net/api?c=1"
         let urlToSend = URL(string: url)
        parser = XMLParser(contentsOf: urlToSend!)!
        parser.delegate = self
        parser.parse()
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        
        currentElementName = nil
        
        if elementName == "date"{
            self.feedItem.append(FeedItem())
            
        }else{
            currentElementName = elementName
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        
        if self.feedItem.count > 0{
            //meigenとautherを処理していく
            let lastItem = self.feedItem[self.feedItem.count - 1]
            
            switch self.currentElementName{
            case "meigen":
                lastItem.meigen = string
            
            case "auther":
                lastItem.auther = string
                
                meigenLabel.text = lastItem.meigen + "\n" + lastItem.auther
            default:break
            }
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        currentElementName = nil
    }
    

    @IBAction func share(_ sender: Any) {
        
        //アクティビティーVCを出す
        var postString = String()
        postString = "\(userName)さんを表す名言:\(meigenLabel.text!)\n#あなたを表す名言メーカー"
        let shareItems = [postString] as [String]
        let controller = UIActivityViewController(activityItems: shareItems, applicationActivities: nil)
        present(controller, animated: true, completion: nil)
    }
    

    @IBAction func sendData(_ sender: Any) {
        
        //firestoreへ値を保存
        if let quote = meigenLabel.text,let userName = Auth.auth().currentUser?.uid{
            db.collection("feed").addDocument(data:["userName":Auth.auth().currentUser?.displayName,"quote":meigenLabel.text,"photoURL":Auth.auth().currentUser?.photoURL?.absoluteString,"createdAt":Data().timeIntervalSince1978]
                )
    }
    
}

}

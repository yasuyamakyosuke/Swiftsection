//
//  IntroViewController.swift
//  Swift5IntroApp1
//
//  Created by 泰山恭輔 on 2020/12/07.
//

import UIKit
import Lottie

class IntroViewController: UIViewController,UIScrollViewDelegate {

    @IBOutlet weak var scrolView: UIScrollView!
    
    var onboardArray = ["1","2","3","4","5"]
    
    var onboardStringArray  = ["これはテストです","これはサンプルです","これはお試しです","これは例です","これは適当です"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrolView.isPagingEnabled = true
        setUpScroll()
        
        for i in 0...4{
           let animationView = AnimationView()
            let animation = Animation.named(onboardArray[i])
            animationView.frame = CGRect(x: CGFloat(i) * view.frame.size.width, y: 0, width: view.frame.size.width, height: view.frame.size.height)
            animationView.animation = animation
            animationView.contentMode = .scaleAspectFit
            animationView.play()
            scrolView.addSubview(animationView)
            
            
            
        }
        
        

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func setUpScroll(){
        
        scrolView.delegate = self
        
        scrolView.contentSize = CGSize(width: view.frame.size.width * 5, height: scrolView.frame.size.height)
        
        for i in 0...4{
            let onboardlabel = UILabel(frame: CGRect(x: CGFloat(i) * view.frame.size.width, y: view.frame.size.height/3, width: scrolView.frame.size.width, height: scrolView.frame.size.height))
            
            onboardlabel.font = UIFont.boldSystemFont(ofSize: 15.0)
            onboardlabel.textAlignment = .center
            onboardlabel.text = onboardStringArray[i]
            scrolView.addSubview(onboardlabel)
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

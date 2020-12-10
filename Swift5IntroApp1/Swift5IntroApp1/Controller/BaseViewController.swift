//
//  BaseViewController.swift
//  Swift5IntroApp1
//
//  Created by 泰山恭輔 on 2020/12/10.
//

import UIKit
import SegementSlide

class BaseViewController: SegementSlideDefaultViewController{

    override func viewDidLoad() {
        super.viewDidLoad()
        
        reloadData()
        defaultSelectedIndex = 0
    

        // Do any additional setup after loading the view.
    }
    
    override func segementSlideHeaderView() -> UIView? {
        
        let headerView = UIImageView()
        headerView.isUserInteractionEnabled = true
        headerView.contentMode = .scaleAspectFit
        headerView.image = UIImage(named: "header")
        headerView.translatesAutoresizingMaskIntoConstraints = false
        
        let headerHeight: CGFloat
        if #available(iOS 11.0, *){
            headerHeight = view.bounds.height/4+view.safeAreaInsets.top
        }else{
            headerHeight = view.bounds.height/4+topLayoutGuide.length
            
        }
        headerView.heightAnchor.constraint(equalToConstant: headerHeight).isActive = true
        
        return headerView

    }
    
    override var titlesInSwitcher: [String]{
        return ["TOP","Abema","yahoo","IT","Buzz","CNN"]
        
    }
    
    override func segementSlideContentViewController(at index: Int) -> SegementSlideContentScrollViewDelegate? {
        switch index {
        case 0:
            return
        default:
            <#code#>
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

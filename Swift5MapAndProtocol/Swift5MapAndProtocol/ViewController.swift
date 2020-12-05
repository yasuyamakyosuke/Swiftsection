//
//  ViewController.swift
//  Swift5MapAndProtocol
//
//  Created by 泰山恭輔 on 2020/12/04.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController,CLLocationManagerDelegate,UIGestureRecognizerDelegate,searchLocationDelegate {

    
    var addressString = ""
    @IBOutlet var longPress: UILongPressGestureRecognizer!
    
    @IBOutlet weak var settingButton: UIButton!
    @IBOutlet weak var mapView: MKMapView!
    var locManager:CLLocationManager!
    @IBOutlet weak var addressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingButton.backgroundColor = .white
        settingButton.layer.cornerRadius = 20.0
 
    }

    @IBAction func longPressTap(_ sender: UILongPressGestureRecognizer) {
        
        
        if sender.state == .began{
        //タップを開始
        }else if sender.state == .ended{
        //タップ終了
            
        //タップした位置を指定して、mkmap上の緯度経度を取得
            
        //緯度経度から住所に変換
            let tapPoint = sender.location(in: view)
            //タップした位置（CGPoint)を指定してMKView上の緯度経度を取得
            //centerはタップされた場所
            let center = mapView.convert(tapPoint, toCoordinateFrom: mapView)
            
            let lat = center.latitude
            let log = center.longitude
            
            convert(lat: lat, log: log)
            
        }
    }
    
    
    func convert(lat:CLLocationDegrees,log:CLLocationDegrees){
        let geocoder = CLGeocoder()
        let location = CLLocation(latitude: lat, longitude: log)
        
        //クロージャー
        geocoder.reverseGeocodeLocation(location) { (placeMark, error) in
          
            if let placeMark = placeMark{
                if let pm = placeMark.first{
                    
                   if pm.administrativeArea != nil || pm.locality != nil {
                        self.addressString = pm.name! + pm.administrativeArea! + pm.locality!
                   }else{
                      self.addressString = pm.name!
                   }
                    self.addressLabel.text = self.addressString
                }
            }
        }
    }
    
    @IBAction func goToSearchVC(_ sender: Any) {
        
        //画面遷移
        performSegue(withIdentifier: "next", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "next"{
            let nextVC = segue.destination as!
            NextViewController
            nextVC.delegate = self
        }
    }
    //任されたデリゲートメソッド
    func searchLocation(idovalue: String, keidovalue: String) {
        if idovalue.isEmpty != true && keidovalue.isEmpty != true{
            let idoString = idovalue
            let keidoString = keidovalue
            
            //緯度経度からコーディネート
            let coordinate = CLLocationCoordinate2DMake(Double(idoString)!, Double(keidoString)!)
            //表示する範囲を指定
            let span = MKCoordinateSpan(latitudeDelta: 0.03, longitudeDelta: 0.03)
            //領域を指定
            let region = MKCoordinateRegion(center: coordinate, span:span )
            //領域をmapViewに設定
            mapView.setRegion(region, animated: true)
            //緯度経度から住所へ変換
            convert(lat:Double(idoString)! , log: Double(keidoString)!)
            //ラベルに表示していく
            addressLabel.text = addressString
            
        }else{
            
            addressLabel.text = "表示できません"
        }
    }
    
    
}


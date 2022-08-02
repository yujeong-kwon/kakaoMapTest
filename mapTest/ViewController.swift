//
//  ViewController.swift
//  mapTest
//
//  Created by 권유정 on 2022/08/03.
//

import UIKit

class ViewController: UIViewController, MTMapViewDelegate{
     
    var mapView: MTMapView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        mapView = MTMapView(frame: self.view.bounds)
        if let mapView = mapView {
            mapView.delegate = self
            mapView.baseMapType = .standard
            self.view.addSubview(mapView)
        }
    }


}


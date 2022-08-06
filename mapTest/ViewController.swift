//
//  ViewController.swift
//  mapTest
//
//  Created by 권유정 on 2022/08/03.
//

import UIKit

//import Then

class ViewController: UIViewController, MTMapViewDelegate{
     
    var mapView: MTMapView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //지도 불러오기
       // locationManager = CLLocationManager()
        //locationManager.delegate = self
        //locationManager.requestWhenInUseAuthorization()
        //locationManager.startUpdatingLocation()
        

        mapView = MTMapView(frame: self.view.frame)

        //델리게이트 연결
       
        
        //현재 위치 트래킹
        //mapView.currentLocationTrackingMode = .onWithoutHeading
        //mapView.showCurrentLocationMarker = true
        
        //지도의 센터를 설정 (x와 y좌표, 줌 레벨 등을 설정)
        mapView.setMapCenter(.init(geoCoord: .init(latitude: 37.537229, longitude: 127.005515)),animated: true)
        
        
 
        //MTMapPOIItem 객체 생성
        let poiItem1 = MTMapPOIItem()
    
        poiItem1.mapPoint = .init(geoCoord: .init(latitude: 37.537229, longitude: 127.005515))
        poiItem1.markerType = .redPin
        poiItem1.showAnimationType = .noAnimation
        poiItem1.tag = 1
        
        let poiItem2 = MTMapPOIItem()
    
        poiItem2.mapPoint = .init(geoCoord: .init(latitude: 37.437210, longitude: 127.005525))
        poiItem2.markerType = .redPin
        poiItem2.showAnimationType = .noAnimation
        poiItem2.tag = 2
        
        view.addSubview(mapView)
        mapView.delegate = self
        //지도 타입 설정 (hybrid:하이브리드, satellite: 위성지도)
        mapView.baseMapType = .standard

        mapView.addPOIItems([poiItem1,poiItem2])
        mapView.fitAreaToShowAllPOIItems()
        
    }
    /*
    //poiItem 클릭 이벤트
    func mapView(_ mapView: MTMapView!, touchedCalloutBalloonOf poiItem: MTMapPOIItem!) {
        //인덱스는 poiItem의 태그로 접근
        let index = poiItem.tag
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        //mapView의 모든 poiItem 제거
        for item in mapView!.poiItems{
            mapView!.remove(item as! MTMapPOIItem)
        }
    }
    
    //마커 추가
    func makeMarker(){
        var cnt = 0
        //가져온 데이터를 resultList에 담아서 반복문으로 item.x item.y로 여러개 넣기
        self.mapPoint1 = MTMapPoint(geoCoord: MTMapPointGeo(latitude: latitude, longitude: longitude))
        poiItem1 = MTMapPOIItem()
        //핀 색상 설정
        poiItem1?.markerType = MTMapPOIItemMarkerType.redPin
        poiItem1?.mapPoint = mapPoint1
        //핀 이름 설정
        poiItem1?.itemName = "test"
        //태그 설정
        poiItem1?.tag = cnt
        //맵뷰에 추가!
        mapView!.add(poiItem1)
        cnt += 1
        
    }
*/

}

//
//  ViewController.swift
//  mapTest
//
//  Created by 권유정 on 2022/08/03.
//

import UIKit

import CoreLocation

//import Then

class ViewController: UIViewController, MTMapViewDelegate, CLLocationManagerDelegate{
     
    var mapView: MTMapView?
    
    var mapPoint1: MTMapPoint?
    var poiItem1: MTMapPOIItem?
    
    var locationManager: CLLocationManager!
    
    /*
    
    var lo: Double!
    var la: Double!
    
    func getLocationUsagePermission(){
        self.locationManager.requestWhenInUseAuthorization()
    }
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status{
        case .authorizedAlways, .authorizedWhenInUse:
            print("GPS 권한 설정됨")
        case .restricted, .notDetermined:
            print("GPS 권한 설정되지 않음")
            getLocationUsagePermission()
        case .denied:
            print("GPS 권한 요청 거부됨")
            getLocationUsagePermission()
        default:
            print("GPS: Default")
        }
    }
    */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Info.plist 설정
        //현재 위도경도 가져와서 사용할 경우 -> la! lo! 하면 됨
        
        //현재 위치 가져오기
        locationManager = CLLocationManager()
        locationManager.delegate = self
        //앱이 실행될 떄 위치 추적 권한 요청
        locationManager.requestWhenInUseAuthorization()
        //위치업데이트
        locationManager.startUpdatingLocation()
        //위도경도 가져오기
        let coor = locationManager.location?.coordinate
        let la = coor?.latitude
        let lo = coor?.longitude
    
       
        //지도 불러오기
        mapView = MTMapView(frame: self.view.frame)
        
        if let mapView = mapView {
            
            //델리게이트 연결
            mapView.delegate = self
            
            //지도 타입 설정 (hybrid:하이브리드, satellite: 위성지도)
            mapView.baseMapType = .standard
            
            //현재 위치 트래킹
            mapView.currentLocationTrackingMode = .onWithoutHeading
            mapView.showCurrentLocationMarker = true
            
            //지도의 센터를 설정 (좌표, 줌 레벨 등을 설정)
            //mapView.setMapCenter(MTMapPoint(geoCoord: MTMapPointGeo(latitude: 37.576568, longitude: 127.029148)), zoomLevel: 4, animated: true)
            view.addSubview(mapView)
            
            //MTMapPOIItem 객체 생성 -> 마커 추가
            self.mapPoint1 = MTMapPoint(geoCoord: MTMapPointGeo(latitude: 36.836004972187524, longitude: 127.15052268865131))
            poiItem1 = MTMapPOIItem()
            poiItem1?.itemName = "test"
            poiItem1?.mapPoint = mapPoint1
            poiItem1?.markerType = .redPin
            //하늘에서 떨어지는 타입
            poiItem1?.showAnimationType = .dropFromHeaven
            poiItem1?.tag = 1
            
            //마커 객체 등록
            mapView.add(poiItem1)
            //mapView.addPOIItems([poiItem1])
            mapView.fitAreaToShowAllPOIItems()
            
        }
    
    }
    
/*
    //poiItem 클릭 이벤트
    func mapView(_ mapView: MTMapView!, touchedCalloutBalloonOf poiItem: MTMapPOIItem!) {
        //인덱스는 poiItem의 태그로 접근
        let index = poiItem.tag
    }
    */
    override func viewWillDisappear(_ animated: Bool) {
        //mapView의 모든 poiItem 제거
        for item in mapView!.poiItems{
            mapView!.remove(item as! MTMapPOIItem)
        }
    }
    
    /**
     * [User Location Tracking] 단말의 현위치 좌표값을 통보받을 수 있다.
     * MTMapView 클래스의 currentLocationTrackingMode property를 통해서
     * 사용자 현위치 트래킹 기능이 켜진 경우(MTMapCurrentLocationTrackingOnWithoutHeading, MTMapCurrentLocationTrackingOnWithHeading)
     * 단말의 위치에 해당하는 지도 좌표와 위치 정확도가 주기적으로 delegate 객체에 통보된다.
     * @param mapView MTMapView 객체
     * @param location 사용자 단말의 현재 위치 좌표
     * @param accuracy 현위치 좌표의 오차 반경(정확도) (meter)
     */
    func mapView(_ mapView: MTMapView!, updateCurrentLocation location: MTMapPoint!, withAccuracy accuracy: MTMapLocationAccuracy) {
        let currentLocation = location?.mapPointGeo()
        if let latitude = currentLocation?.latitude, let longitude = currentLocation?.longitude{
            print("테스트MTMapView updateCurrentLocation (\(latitude),\(longitude)) accuracy(\(accuracy))")
        }
    }
    
    /*
    //데이터를 배열로 담아와서 반복문으로 .x .y로 여러개 마커 추가
    func makeMarker(){
        var cnt = 0
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



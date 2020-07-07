//
//  MainViewController.swift
//  Courier
//
//  Created by admin on 21/06/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit
import GoogleMaps

class MainViewController: UIViewController {

    @IBOutlet weak var topViewContainer: UIView!
    @IBOutlet weak var buttonMenu: UIButton!
    @IBOutlet weak var mapViewContainer: UIView!
    var locationManager: CLLocationManager!
    var mapView = GMSMapView()
    var markers = [GMSMarker]()
    var bookingView = StartBookingView()
    var pickupLocationView = PickupLocationView()
    var vehicleView = SelectVehicleView()
    var packageDetailView = PackageDetailView()
    var recieverView = RecieverView()
    var paymentMethodView = PaymentMethodView()
    var modifyrequest = ModifyRequestView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if self.revealViewController() != nil {
                 self.buttonMenu.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
                     self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
               }
               self.customize()
    }
    
    func customize(){
        let defualtLocation = CLLocation(latitude:1.285, longitude:103.848)
        self.setGoogleMap(location:defualtLocation)
        self.showBookingView()
    }
    
    func setGoogleMap(location:CLLocation) {
           DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                let camera = GMSCameraPosition.camera(withLatitude: location.coordinate.latitude, longitude: location.coordinate.longitude, zoom: 10.0)
                self.mapView = GMSMapView.map (withFrame: self.mapViewContainer.frame, camera: camera)
                //self.mapViewContainer.backgroundColor = .green
                //self.mapView.isMyLocationEnabled = true
                self.mapView.delegate = self
                self.view.addSubview(self.mapView)
           }
             /* let marker = GMSMarker()
              marker.position = CLLocationCoordinate2D(latitude:location.coordinate.latitude, longitude: location.coordinate.longitude)
              //marker.title = cameraPosition.formattedAddress
              marker.map = self.mapView*/
             // self.searchLocation = location.coordinate
           }
    
    func showBookingView(){
           DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
               self.bookingView = UINib.loadBookingView(StartBookingView.self) as! StartBookingView
               self.bookingView.frame = CGRect(x: 0, y:(self.mapViewContainer.frame.origin.y + self.mapViewContainer.frame.height) - self.bookingView.frame.height,  width: UIScreen.main.bounds.width , height: self.bookingView.frame.height)
               self.bookingView.delegate = self
               self.view.addSubview(self.bookingView)
              
               self.pickupLocationView = UINib.loadPickupLocationView(PickupLocationView.self) as! PickupLocationView
               self.pickupLocationView.frame = CGRect(x: 15, y:(self.topViewContainer.frame.origin.y + self.topViewContainer.frame.height) + 15,  width: UIScreen.main.bounds.width - 30 , height: self.pickupLocationView.frame.height)
               self.view.addSubview(self.pickupLocationView)
             }
       }
    
    func removeBookingView(){
        self.bookingView.removeFromSuperview()
        self.pickupLocationView.removeFromSuperview()
    }
    
    func showVehicleView(){
           DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
               self.vehicleView = UINib.loadVehicleView(SelectVehicleView.self) as! SelectVehicleView
               self.vehicleView.frame = CGRect(x: 0, y:(self.mapViewContainer.frame.origin.y + self.mapViewContainer.frame.height) - self.bookingView.frame.height,  width: UIScreen.main.bounds.width , height: self.bookingView.frame.height)
               self.vehicleView.delegate = self
               self.view.addSubview(self.vehicleView)
              
               self.pickupLocationView = UINib.loadPickupLocationView(PickupLocationView.self) as! PickupLocationView
               self.pickupLocationView.frame = CGRect(x: 15, y:(self.topViewContainer.frame.origin.y + self.topViewContainer.frame.height) + 15,  width: UIScreen.main.bounds.width - 30 , height: self.pickupLocationView.frame.height)
               self.view.addSubview(self.pickupLocationView)
             }
       }

    
    func removeVehicleView(){
        self.vehicleView.removeFromSuperview()
        self.pickupLocationView.removeFromSuperview()
    }
    
    
    func showPackageView(){
           DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
               self.packageDetailView = UINib.loadPackageView(PackageDetailView.self) as! PackageDetailView
               self.packageDetailView.frame = CGRect(x: 0, y:(self.mapViewContainer.frame.origin.y + self.mapViewContainer.frame.height) - 370,  width: UIScreen.main.bounds.width , height: 370)
               self.packageDetailView.delegate = self
               self.view.addSubview(self.packageDetailView)
              
               self.pickupLocationView = UINib.loadPickupLocationView(PickupLocationView.self) as! PickupLocationView
               self.pickupLocationView.frame = CGRect(x: 15, y:(self.topViewContainer.frame.origin.y + self.topViewContainer.frame.height) + 15,  width: UIScreen.main.bounds.width - 30 , height: self.pickupLocationView.frame.height)
               self.view.addSubview(self.pickupLocationView)
             }
       }
    
    func removePackageView(){
           self.packageDetailView.removeFromSuperview()
           self.pickupLocationView.removeFromSuperview()
       }
    
    func showRecieverView(){
             DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                 self.recieverView = UINib.loadRecieverView(RecieverView.self) as! RecieverView
                 self.recieverView.frame = CGRect(x: 0, y:(self.mapViewContainer.frame.origin.y + self.mapViewContainer.frame.height) - self.recieverView.frame.height,  width: UIScreen.main.bounds.width , height: self.recieverView.frame.height)
                 self.recieverView.delegate = self
                 self.view.addSubview(self.recieverView)
                
                 self.pickupLocationView = UINib.loadPickupLocationView(PickupLocationView.self) as! PickupLocationView
                 self.pickupLocationView.frame = CGRect(x: 15, y:(self.topViewContainer.frame.origin.y + self.topViewContainer.frame.height) + 15,  width: UIScreen.main.bounds.width - 30 , height: self.pickupLocationView.frame.height)
                 self.view.addSubview(self.pickupLocationView)
               }
         }
    
    func removeReciveView(){
        self.recieverView.removeFromSuperview()
        self.pickupLocationView.removeFromSuperview()
    }
    
    func showCameraView(){
        let cameraView = UINib.loadCameraView(CameraView.self) as! CameraView
        //cameraView.delegate = self
        singleton().HBRectView.addSubViewToParentWindow(view: cameraView, withFrame: CGRect(x: 40, y:0,  width: UIScreen.main.bounds.width - 80 , height: cameraView.frame.height - 30), isCenter: true)
    }
    
    
    
    func showPaymentMethodView(){
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    self.paymentMethodView = UINib.loadPaymentMethodView(PaymentMethodView.self) as! PaymentMethodView
                    self.paymentMethodView.frame = CGRect(x: 0, y:(self.mapViewContainer.frame.origin.y + self.mapViewContainer.frame.height) - 370,  width: UIScreen.main.bounds.width , height: 370)
                    self.paymentMethodView.delegate = self
                    self.view.addSubview(self.paymentMethodView)
                   
                    self.pickupLocationView = UINib.loadPickupLocationView(PickupLocationView.self) as! PickupLocationView
                    self.pickupLocationView.frame = CGRect(x: 15, y:(self.topViewContainer.frame.origin.y + self.topViewContainer.frame.height) + 15,  width: UIScreen.main.bounds.width - 30 , height: self.pickupLocationView.frame.height)
                    self.view.addSubview(self.pickupLocationView)
                  }
            }
    
}

extension MainViewController : GMSMapViewDelegate {
        /*func mapView(_ mapView: GMSMapView, didChange position: GMSCameraPosition) {
            print("\(position.target.latitude) \(position.target.longitude)")
            //circle.position = position.target
            self.mapView.animate(to: position)
        }*/
    
        /*func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
            let index = self.markers.index(of: marker)
            //print(index!)
            let dic = self.usersLocationArr.object(at: index!)
            let locationDetailsObj = self.storyboard?.instantiateViewController(withIdentifier: "LocationDetailsVC") as? LocationDetailsVC
            locationDetailsObj?.tagIdWithDic = dic as! NSDictionary
            self.navigationController?.pushViewController(locationDetailsObj!, animated: true)
            return true
        }*/
}

extension MainViewController: BookingViewDelegate {
    
    func onTapVehicle() {
        self.removeBookingView()
        self.showVehicleView()
    }
}

extension MainViewController: VehicleViewDelegate {
    
    func onTapNext() {
        self.removeVehicleView()
        self.showPackageView()
    }
}

extension MainViewController: PackageDetailViewDelegate {
    
    func onTapPackageDetailNextButton() {
        self.removePackageView()
        self.showRecieverView()
    }
    
    func onTapCamera(){
        self.showCameraView()
    }
}


extension MainViewController: RecieverViewDelegate ,ModifyRequestViewDelegate,PaymentMethodViewDelegate{
    func onTapModifyRequest() {
        showmodifyrequest()
    }
    
    func showmodifyrequest(){
        let cameraView = UINib.loadModifyRequestView(ModifyRequestView.self) as! ModifyRequestView
        cameraView.delegate = self
        singleton().HBRectView.addSubViewToParentWindow(view: cameraView, withFrame: CGRect(x: 20, y:0,  width: UIScreen.main.bounds.width - 40 , height: cameraView.frame.height), isCenter: true)
    }
    
    func onTapyes() {
        self.goTomodifyrequestScreen()
    }
    func goTomodifyrequestScreen(){
        let controller = UIStoryboard.loadModifyRequestViewController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
   func onTapNext1() {
       self.removeReciveView()
       self.showPaymentMethodView()
   }

}

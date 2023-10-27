//
//  ViewController.swift
//  newVisits
//
//  Created by Vedant Mistry on 26/10/23.
//

import UIKit
import MapKit

class FirstViewController: UIViewController {

    var initialLocation: CLLocation?
    
    let mapView: MKMapView = {
        let map = MKMapView()
        map.overrideUserInterfaceStyle = .dark
        return map
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setMapContraints()
        
        initialLocation = CLLocation(latitude: 37.422131, longitude: -122.084801)
        mapView.centerToLocation(location: initialLocation!)
        
        setButtonConstraints()
    }
    
    func setMapContraints() {
        view.addSubview(mapView)
        
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        mapView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        mapView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        mapView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
    }
    
    func setButtonConstraints() {
        let button = UIButton(type: .system)
//        button.setTitle("My Visits", for: .normal)
        if let visitsIcon = UIImage(systemName: "mappin.and.ellipse.circle.fill") {
            button.setImage(visitsIcon, for: .normal)
        }
        button.titleLabel?.font = .systemFont(ofSize: 19.0, weight: .bold)
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(button)
        
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.widthAnchor.constraint(equalToConstant: 50).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
        
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc func buttonTapped() {
        let tableViewController = TableViewController()
        
        self.present(tableViewController, animated: true, completion: nil)
    }
}

extension MKMapView {
    func centerToLocation(location: CLLocation, regionRadius: CLLocationDistance = 500) {
        let coordinateRegion = MKCoordinateRegion(
            center: location.coordinate,
            latitudinalMeters: regionRadius,
            longitudinalMeters: regionRadius
        )
        setRegion(coordinateRegion, animated: true)
    }
}


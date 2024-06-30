//
//  DummyData.swift
//  LearningTableView
//
//  Created by Vedant Mistry on 30/06/24.
//

import Foundation

class DummyData {
    func fetchData() -> [Car] {
        let cars: [Car] = [
            Car(image: Images.porsche, title: "Porsche 992 GT3 RS"),
            Car(image: Images.ferrari, title: "Ferrari SF90"),
            Car(image: Images.mercedes, title: "Mercedes GLA COUPE"),
            Car(image: Images.bmw, title: "BMW M4"),
            Car(image: Images.mclaren, title: "McLaren Senna"),
            Car(image: Images.nissan, title: "Nissan GTR"),
            Car(image: Images.audi, title: "Audi R8"),
            Car(image: Images.lamborghini, title: "Lamborghini Revuelto")
        ]
        
        return cars
    }
}

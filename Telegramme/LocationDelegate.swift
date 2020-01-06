//
//  LocationDelegate.swift
//  Telegramme
//
//  Created by MAD2_P02 on 6/1/20.
//  Copyright © 2020 Wong Kah Wo. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation

class LocationDelegate : NSObject, CLLocationManagerDelegate
{
    var locationCallBack: ((CLLocation) ->())? = nil
    
    func locationManagter(_manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        guard let currentLocation = locations.last else{return}
        locationCallBack?(currentLocation)
        print("Location delegate")
    }
}

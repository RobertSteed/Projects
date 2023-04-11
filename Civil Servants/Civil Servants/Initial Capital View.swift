//
//  Initial Capital View.swift
//  Civil Servants
//
//  Created by Robert Steed on 3/14/23.
//

import SwiftUI
import CoreLocation
import CoreLocationUI


//class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
//    let manager = CLLocationManager()
//
//    @Published var location: CLLocationCoordinate2D?
//
//    override init() {
//        super.init()
//        manager.delegate = self
//    }
//
//    func requestLocation() {
//        manager.requestLocation()
//    }
//
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        location = locations.first?.coordinate
//    }
//}


struct Initial_Capital_View: View {
//    @StateObject var locationManager = LocationManager()
    @State var showDetail: Bool = false
    @State private var showingAlert = false
    @State private var opacity = 0.8
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                Image("State Capitol")
                
                VStack {
                    
                   
                    Button("Get Started!") {
                        showingAlert = true
                    } .font(.title)
                        .padding()
                        .foregroundColor(.primary)
                        .background(.white)
                        .opacity(opacity)
                        .alert("We would like access to your location", isPresented: $showingAlert) {
                            
                         
                            NavigationLink("Ok!", destination: TabBarView())
                        }
                    
                }
            } .navigationTitle("Civil Servant")
                
            
        }
       
    }
}

struct Initial_Capital_View_Previews: PreviewProvider {
    static var previews: some View {
        Initial_Capital_View()
    }
}

//
//  ContentView.swift
//  lastestmap
//
//  Created by frh alshaalan on 26/05/2023.
//

import SwiftUI

    import SwiftUI
    import MapKit

    struct ContentView: View {
        
        @State private var tracking = false
        @State private var location = MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 24.7136, longitude: 46.6753),
            span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
        )
        
        let notification = LocalNotification(
            title: "Alert!",
            body: "This is a local notification",
            badgeNumber: 1,
            delayInterval: 10 // schedule notification 10 seconds from now
        )
//        notification.schedule()
//        calling the notication 

        var body: some View {
            
            ZStack {
                Map(coordinateRegion: $location, showsUserLocation: true)
                    .ignoresSafeArea()
                    .onAppear {
                        tracking = true
                    }
                ZStack{
                    Button(tracking ? "Stop" : "Start") {
                        if tracking {
                            stopTracking()
                        } else {
                            startTracking()
                        }
                        
                    }
                    .padding(16)
                    .background(tracking ? Color.red : Color.green)
                    .foregroundColor(Color.white)
                    .cornerRadius(8)
                    .padding()
                    .offset(x:7, y:250)
                }
            }
        }
        func startTracking() {
            tracking = true
            // Start detecting if the car is moving
        }
        
        func stopTracking() {
            tracking = false
            // Stop detecting if the car is moving
        }
    }

    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }




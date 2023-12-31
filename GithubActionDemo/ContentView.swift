//
//  ContentView.swift
//  GithubActionDemo
//
//  Created by Holloh, Niklas on 30.08.23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var pickedEnvironment: String = "dev"
    
    var environment: String? {
        Bundle.main.infoDictionary?["BACKEND_ENVIRONMENT"] as? String
    }
    
    var version: String? {
        guard let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String else {
            return nil
        }
        
        guard let build = Bundle.main.infoDictionary?["CFBundleVersion"] as? String else {
            return nil
        }
        
        return "\(version) (\(build))"
    }
    
    var bundleId: String? {
        Bundle.main.infoDictionary?["CFBundleIdentifier"] as? String
    }
    
    init() {
        pickedEnvironment = environment ?? "dev"
    }
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            Text("Injected Environment: " + (environment ?? "nil"))
            Text("Current Environment: " + pickedEnvironment)
            Text("Version: " + (version ?? "nil"))
            Text("Bundle ID:\n" + (bundleId ?? "nil"))
            
            Picker("Environment", selection: $pickedEnvironment) {
                Text("DEV").tag("dev")
                Text("STAGING").tag("staging")
                Text("PROD").tag("prod")
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

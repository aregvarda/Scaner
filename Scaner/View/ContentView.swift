//
//  ContentView.swift
//  Scaner
//
//  Created by Геворг on 05.02.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showScanner = false
    
    var body: some View {
        .sheet(isPresented: $showScanner, content: {
            ScannerView { result in
                switch result {
                    case .success(let scannedPages):
                        break
         
                    case .failure(let error):
                        print(error.localizedDescription)
                }
         
                showScanner = false
            } didCancelScanning: {
                showScanner = false
            }
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

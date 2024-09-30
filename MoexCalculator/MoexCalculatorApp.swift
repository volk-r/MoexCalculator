//
//  MoexCalculatorApp.swift
//  MoexCalculator
//
//  Created by Roman Romanov on 29.09.2024.
//

import SwiftUI

@main
struct MoexCalculatorApp: App {
    
    @StateObject var viewModel = CalculatorViewModel()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(viewModel)
        }
    }
}

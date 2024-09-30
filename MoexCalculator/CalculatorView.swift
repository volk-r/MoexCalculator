//
//  CalculatorView.swift
//  MoexCalculator
//
//  Created by Roman Romanov on 30.09.2024.
//

import SwiftUI

struct CalculatorView: View {
    
    @EnvironmentObject var viewModel: CalculatorViewModel
    @State private var isPickerPresented = false
    
    var body: some View {
        List {
            CurrencyInput(
                currency: viewModel.topCurrency,
                amount: viewModel.topAmount,
                calculator: viewModel.setTopAmount,
                tapHandler: { isPickerPresented.toggle() }
            )
            
            CurrencyInput(
                currency: viewModel.bottomCurrency,
                amount: viewModel.bottomAmount,
                calculator: viewModel.setBottomAmount,
                tapHandler: { isPickerPresented.toggle() }
            )
        }
        .foregroundStyle(.selection)
        .onTapGesture {
            hideKeyboard()
        }
        .sheet(isPresented: $isPickerPresented) {
            VStack(spacing: 16) {
                
                Spacer()
                
                RoundedRectangle(cornerRadius: 3)
                    .fill(.secondary)
                    .frame(width: 60, height: 6)
                    .onTapGesture {
                        isPickerPresented = false
                    }
                
                HStack {
                    CurrencyPicker(currency: $viewModel.topCurrency, onChange: { _ in didChangeTopCurrency() })
                    CurrencyPicker(currency: $viewModel.bottomCurrency, onChange: { _ in didChangeBottomCurrency() })
                }
            }
            .presentationDetents([.fraction(0.3)])
        }
    }
}

private extension CalculatorView {
    func didChangeTopCurrency() {
        viewModel.updateTopAmount()
    }
    
    func didChangeBottomCurrency() {
        viewModel.updateBottomAmount()
    }
}

extension View {
    func hideKeyboard() {
        UIApplication.shared
            .sendAction(
                #selector(UIResponder.resignFirstResponder),
                to: nil,
                from: nil,
                for: nil
            )
    }
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
    }
}

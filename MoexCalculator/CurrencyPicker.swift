//
//  CurrencyPicker.swift
//  MoexCalculator
//
//  Created by Roman Romanov on 30.09.2024.
//

import SwiftUI

struct CurrencyPicker: View {

    @Binding var currency: Currency
    let onChange: (Currency) -> Void
    
    var body: some View {
        Picker("", selection: $currency) {
            ForEach(Currency.allCases) { currency in
                Text(currency.rawValue.uppercased())
            }
        }
        .pickerStyle(.wheel)
        .onChange(of: currency) {
            onChange(currency)
        }
    }
}

#Preview {
    let currencyBinding = Binding<Currency>(
        get: { .RUR },
        set: { _ = $0 }
    )
    
    CurrencyPicker(
        currency: currencyBinding,
        onChange: { _ in }
    )
}

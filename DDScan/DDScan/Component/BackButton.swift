//
//  BackButton.swift
//  DDScan
//
//  Created by Edouard Pradie on 18/10/2024.
//

import SwiftUI

struct BackButton: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
                Spacer()
                Image(systemName: "chevron.left")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.black)
            }
        }
    }
}

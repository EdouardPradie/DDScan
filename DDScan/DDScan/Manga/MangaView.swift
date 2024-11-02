//
//  MangaView.swift
//  DDScan
//
//  Created by Edouard Pradie on 21/10/2024.
//

import SwiftUI

struct MangaView: View {
    @Binding var mangaName : String
    @Binding var scanid: [ScanID]
    @State private var reverse = false
    
    var body: some View {
        NavigationView {
            VStack {
                Image("DDScan")
                    .resizable()
                    .scaledToFit()
                    .frame(width:  250.0)
                    .padding()
                
                Text(mangaName)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .foregroundColor(Color.white)
                    .font(Font.custom("Audiowide-Regular", size: 35))
                
                ScrollView {
                    Button(action: {
                        reverse.toggle()
                    }) {
                        Text("Reverse")
                            .font(Font.custom("Audiowide-Regular", size: 15))
                            .padding()
                            .foregroundColor(Color.white)
                            .background(Color(red: 0.2196, green: 0.7412, blue: 0.6824))
                            .cornerRadius(20)
                    }
                    HStack {
                        Text("Start")
                            .font(Font.custom("Audiowide-Regular", size: 30))
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .foregroundColor(Color.white)
                            .background(Color(red: 0.2196, green: 0.7412, blue: 0.6824))
                            .cornerRadius(20)
                        Text("Last")
                            .font(Font.custom("Audiowide-Regular", size: 30))
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding()
                            .foregroundColor(Color.white)
                            .background(Color(red: 0.2196, green: 0.7412, blue: 0.6824))
                            .cornerRadius(20)
                    }
                    .padding()
                    .background(Color(red: 234 / 255, green: 114 / 255, blue: 74 / 255))
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .cornerRadius(20)
                    ForEach(scanid.reversed(), id: \.id) { scan in
                        Text("Scan \(scan.num)")
                            .font(Font.custom("Audiowide-Regular", size: 30))
                            .frame(minWidth: 0, maxWidth: 250, alignment: .leading)
                            .padding()
                            .foregroundColor(Color.white)
                            .background(Color(red: 0.2196, green: 0.7412, blue: 0.6824))
                            .cornerRadius(20)
                    }
                }
                .padding()
            }
            .background(Image("background"))
        }
    }
}

#Preview {
    MangaView(mangaName: .constant("Lorem Ipsum"), scanid: .constant(ScanID.list))
}

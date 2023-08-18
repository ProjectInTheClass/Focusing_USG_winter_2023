//
//  DummyVIew.swift
//  USG_iOS_2023_winter
//
//  Created by 문창재 on 2023/08/18.
//

import SwiftUI

struct DummyVIew: View {
    var body: some View {
        NavigationStack {
            Text("This View Is Just Test Area")
                .font(.title)
        }
    }
}

struct DummyVIew_Previews: PreviewProvider {
    static var previews: some View {
        DummyVIew()
    }
}

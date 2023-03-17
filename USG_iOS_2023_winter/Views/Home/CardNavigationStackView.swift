//
//  CardNavigationStackView.swift
//  2023_winter_ios_usg_App
//
//  Created by JS K on 2023/02/25.
//

import SwiftUI

struct CardNavigationStackView: View {
    @State var stack = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $stack) {
            NavigationLink {
                <#code#>
            } label: {
                Text("1st 확인")
                    
            }

        } //: NavigationStack
    }
}

struct CardNavigationStackView_Previews: PreviewProvider {
    static var previews: some View {
        CardNavigationStackView()
    }
}

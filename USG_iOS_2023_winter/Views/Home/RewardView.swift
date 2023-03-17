//
//  RewardView.swift
//  2023_winter_ios_usg_App
//
//  Created by JS K on 2023/02/25.
//

import SwiftUI

struct RewardView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        VStack {
            HStack {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "chevron.backward")
                }.padding(.horizontal, 5)
                
                Text("획득한 뱃지")
                
                Spacer()
                
            } //: HStack
            
            Spacer()
            
        } //: VStack
        .padding()
        //        .navigationBarItems(
        //            trailing: Button{
        //                presentationMode.wrappedValue.dismiss()
        //            } label: {
        //                Image(systemName: "xmark")
        //            }
        //        )
    } //: body
}



struct RewardView_Previews: PreviewProvider {
    static var previews: some View {
        RewardView()
    }
}

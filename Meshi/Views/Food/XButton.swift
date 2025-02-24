//
//  XButton.swift
//  Meshi
//
//  Created by S, Praveen (Cognizant) on 30/11/24.
//

import SwiftUI

struct XButton: View {
    @Binding var isShowingSelectedFoodView : Bool
    var body: some View {
        Button{
            isShowingSelectedFoodView = false
        } label : {
            ZStack {
                Circle ()
                    .frame(width: 30, height: 30)
                    .foregroundStyle(.white)
                    .opacity(0.6)
                Image(systemName: "xmark")
                    .imageScale(.small)
                    .frame(width: 25, height: 25)
                    .foregroundStyle(.black)
            }
        }
    }
}

#Preview {
    XButton(isShowingSelectedFoodView: .constant(true))
}

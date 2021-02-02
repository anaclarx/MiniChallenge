//
//  ActionButton.swift
//  FeedTela
//
//  Created by Ricardo Venieris on 25/01/21.
//

import SwiftUI

struct ActionButton: View {
    @State static var isEnable:Bool = true

    var label:String
    var width: CGFloat
    var height: CGFloat
    @Binding var enable:Bool
    var action: ()->Void

    
    init(label:String, width:CGFloat, height:CGFloat, isEnable:Binding<Bool>,
         action: @escaping ()->Void) {
        self.label = label
        self.width = width
        self.height = height
        self._enable = isEnable
        self.action = action
    }
    
    init(label:String, width:CGFloat, height:CGFloat, action: @escaping ()->Void) {
        self.label = label
        self.width = width
        self.height = height
        self.action = action
        self._enable = Self.$isEnable
        print(self.enable)
    }
    
    var body: some View {
        Button(action: enable ? action : {
                print("disabled")
        }) {
            Capsule()
                .foregroundColor(enable ? Color("actionColor"): .gray)
                .overlay(Text (label)
                            .foregroundColor(Color("lowDinamic")))
                .frame(width: width, height: height)
                .shadow(color: Color("actionColor")
                            .opacity(0.8), radius: 10)
                .padding(.top, 10)
        }
    }
}

struct ActionButton_Previews: PreviewProvider {
    @State static var enable:Bool = true
    static var previews: some View {
        
        ActionButton(label:"Testar", width: 100, height: 40, action: {
                        Self.enable.toggle()
            print(Self.enable)
        })
    }
}

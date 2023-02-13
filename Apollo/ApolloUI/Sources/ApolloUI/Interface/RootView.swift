//
//  RootView.swift
//  
//
//  Created by Nikola Grujic on 13/02/2023.
//

import SwiftUI
import ApolloTheme

public struct RootView: View {
    public var body: some View {
        MobileMenuView()
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
            .environmentObject(ThemeManager())
    }
}

//
//  demo_fetchApp.swift
//  demo_fetch
//
//  Created by Mario Bragg on 11/14/24.
//

import SwiftUI

@main
struct demo_fetchApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(downloadUtils: DownloadUtils())
        }
    }
}

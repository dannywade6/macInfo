//
//  ContentView.swift
//  macInfo
//
//  Created by Danny Wade on 07/05/2022.
//

import SwiftUI
import Foundation

struct ContentView: View {

    let computerName = Host.current().localizedName ?? ""
    let username = ProcessInfo.processInfo.userName
    let osVersion = ProcessInfo.processInfo.operatingSystemVersionString

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text("Mac Info")
                    .font(.title2)
                .fontWeight(.bold)
                Spacer()
                Button("Quit") {
                    NSApplication.shared.terminate(nil)
                }
            }
            .padding(.bottom, 3.0)
            HStack {
                Text("Computer Name: ")
                Text("\(computerName)")
                    .fontWeight(.bold)
            }
            HStack {
                Text("User Name: ")
                Text("\(username)")
                    .fontWeight(.bold)
            }
            HStack {
                Text("Serial Number: ")
                Text(getMacSerialNumber())
                    .fontWeight(.bold)
            }
            HStack {
                Text("OS Version: ")
                Text("\(osVersion)")
                    .fontWeight(.bold)
            }
        }
        .padding()
    }
}

func getMacSerialNumber() -> String {
    var serialNumber: String? {
        let platformExpert = IOServiceGetMatchingService(kIOMainPortDefault, IOServiceMatching("IOPlatformExpertDevice") )

        guard platformExpert > 0 else {
            return nil
        }

        guard let serialNumber = (IORegistryEntryCreateCFProperty(platformExpert, kIOPlatformSerialNumberKey as CFString, kCFAllocatorDefault, 0).takeUnretainedValue() as? String)?.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines) else {
            return nil
        }

        IOObjectRelease(platformExpert)

        return serialNumber
    }

    return serialNumber ?? "Unknown"
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

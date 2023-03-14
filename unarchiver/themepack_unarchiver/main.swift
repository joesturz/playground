//
//  main.swift
//  themepack_unarchiver
//
//  Created by Joe Sturzenegger on 3/9/23.
//

import Foundation

convertThemePackToTheme()

func convertThemePackToTheme() {
    let path = "~/Desktop/ArchiveExample.ebthemepack"
    guard let wrapper = try? FileWrapper(url: URL(fileURLWithPath: path), options: .immediate) else {
        print("no filewrapper")
        return
    }
    if wrapper.isRegularFile {
        guard let contents = wrapper.regularFileContents else {
            print("no contents")
            return
        }
        guard let deserialized = FileWrapper.init(serializedRepresentation: contents) else {
            print("unable to deserialize")
            return
        }
        guard let wrappers = deserialized.fileWrappers else {
            print("no wrappers")
            return
        }
        do {
            try FileManager.default.createDirectory(atPath: "~/Desktop/temp/temp.ebtheme/", withIntermediateDirectories: true, attributes: nil)
        } catch {
            print("can't make folder")
            return
        }
        for k in wrappers.keys {
            guard let w = wrappers[k] else {
                return
            }
            do {
                print(w.isRegularFile)
                try w.write(to: URL(fileURLWithPath: "~/Desktop/temp/temp.ebtheme/\(k)"), originalContentsURL: nil)
            } catch {
                print("could not write \(k)")
            }
            
        }
    }
    
}

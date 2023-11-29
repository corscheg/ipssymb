//
//  main.swift
//  ipssymb
//
//  Created by Aleksandr Kazak-Kazakevich on 29.11.2023.
//

import Foundation

@main
struct App {
    static func main() {
        guard let ipsPath = CommandLine.arguments[safe: 1] else {
            print("No ips file provided")
            return
        }
        
        let ipsURL = URL(fileURLWithPath: ipsPath)
        
        guard let ipsData = try? Data(contentsOf: ipsURL) else {
            print("Unable to read ips file")
            return
        }
        
        guard let ipsString = String(data: ipsData, encoding: .utf8) else {
            print("Wrong file data")
            return
        }
        
        guard let indexOfHeaderEnding = ipsString.firstIndex(of: "}").map(ipsString.index(after:)) else {
            print("Wrong file data")
            return
        }
        
        let headerJSONString = ipsString.prefix(upTo: indexOfHeaderEnding)
        let bodyJSONString = ipsString.suffix(from: indexOfHeaderEnding)
        
        guard let headerData = headerJSONString.data(using: .utf8), let bodyData = bodyJSONString.data(using: .utf8) else {
            print("Failed to process data")
            return
        }
        
        let decoder = JSONDecoder()
        
        var body: Body? = nil
        
        do {
            body = try decoder.decode(Body.self, from: bodyData)
        } catch {
            print(error)
            return
        }
        
        guard var body else {
            print("Failed to process data")
            return
        }
        
        guard let dsymPath = CommandLine.arguments[safe: 2] else {
            print("No dSYM path provided")
            return
        }
        
        let dsymURL = URL(fileURLWithPath: dsymPath)
        
        let desiredImageName = String(dsymURL.lastPathComponent.prefix(while: { $0 != "." }))
        
        guard let desiredImageIndex = body.usedImages.firstIndex(where: { $0.name == desiredImageName}) else {
            print("Image name not found")
            return
        }
        
        let desiredImage = body.usedImages[desiredImageIndex]
        guard let arch = desiredImage.arch else {
            print("Unknown arch")
            return
        }
        
        let symbolsURL = dsymURL.appending(components: "Contents", "Resources", "DWARF", desiredImageName)
        var symbolsComponents = symbolsURL.pathComponents
        
        for i in symbolsComponents.startIndex ..< symbolsComponents.endIndex {
            if symbolsComponents[i].contains(" ") {
                symbolsComponents[i] = "\"\(symbolsComponents[i])\""
            }
        }
        
        let symbolsPath = String(symbolsComponents.joined(separator: "/").dropFirst())
        
        for i in body.threads.startIndex ..< body.threads.endIndex {
            for j in body.threads[i].frames.startIndex ..< body.threads[i].frames.endIndex {
                var frame = body.threads[i].frames[j]
                if frame.imageIndex == desiredImageIndex {
                    print("THREAD \(i) FRAME \(j)")
                    let symbol = runAtos(arch: arch, symPath: symbolsPath, loadAddress: desiredImage.base, address: desiredImage.base + frame.imageOffset)
                    print(symbol)
                    frame.symbol = symbol.trimmingCharacters(in: .whitespacesAndNewlines)
                    body.threads[i].frames[j] = frame
                }
            }
        }
        
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        guard let outputBodyData = try? encoder.encode(body) else {
            print("Failed to create output file")
            return
        }
        
        guard let outputBodyJSON = String(data: outputBodyData, encoding: .utf8) else {
            print("Failed to create output file")
            return
        }
        
        let outputJSON = headerJSONString + "\n" + outputBodyJSON
        
        guard let outputData = outputJSON.data(using: .utf8) else {
            print("Failed to create output file")
            return
        }
        
        let outputName = ipsURL.deletingPathExtension().lastPathComponent + " Symbolicated.ips"
        let fileManager: FileManager = .default
//        let outputURL = URL(fileURLWithPath: fileManager.currentDirectoryPath).appending(path: outputName)
        let outputURL = URL(fileURLWithPath: "/Users/alex.kazak/Desktop/").appending(path: outputName)
        
        do {
            try outputData.write(to: outputURL)
        } catch {
            print("Failed to save output file")
        }
    }
    
    static func runAtos(arch: String, symPath: String, loadAddress: Int, address: Int) -> String {
        let task = Process()
        let pipe = Pipe()
        
        task.standardOutput = pipe
        task.standardError = pipe
        let hexLoadAddress = String(format: "0x%x", loadAddress)
        let hexAddress = String(format: "0x%x", address)
        let command = "atos -arch \(arch) -o \(symPath) -l \(hexLoadAddress) \(hexAddress)"
        print(command)
        task.arguments = ["-c", command]
        task.executableURL = URL(fileURLWithPath: "/bin/zsh")
        task.standardInput = nil
        
        try! task.run()
        
        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        let output = String(data: data, encoding: .utf8)!
        
        return output
    }
}

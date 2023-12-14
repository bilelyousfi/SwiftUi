//


import SwiftUI

import CodeScanner

struct CameraView: View {
    @State var isPresentingScanner = false
    @State var scannedCode: String = "Scan a QR code to get started"
    
    var scannerSheet : some View {
        CodeScannerView(
            codeTypes: [.qr],
            completion: { result in
                if case let .success(code) = result {
                    self.scannedCode = code.string
                    self.isPresentingScanner = false
                }
                
            }
        )
    }
    
    var body: some View {
        VStack(spacing: 10) {
            Text(scannedCode)
                .font(.title)
                .foregroundColor(.black)
                .padding()
                .background(Color.yellow)
                .cornerRadius(10)
            
            Button(action: {
                            self.isPresentingScanner = true
                        }) {
                            Text("Scan QR Code")
                                .font(.headline)
                                .foregroundColor(.yellow)
                                .padding()
                                .background(Color.black)
                                .cornerRadius(10)
                                .padding(.horizontal)
                            
                        }
            
            .sheet(isPresented: $isPresentingScanner) {
                self.scannerSheet
            }
        }
    }
}

struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
        CameraView()
    }
}

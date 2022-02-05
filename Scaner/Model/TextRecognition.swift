//
//  TextRecognition.swift
//  Scaner
//
//  Created by Геворг on 05.02.2022.
//

import SwiftUI
import Vision

struct TextRecognition {
    var scannedImages: [UIImage]
    @ObservedObject var recognizedContent: RecognizedContent
    var didFinishRecognition: () -> Void
    
    private func getTextRecognitionRequest(with textItem: TextItem, currentImageIndex: Int) -> VNRecognizeTextRequest {
        let request = VNRecognizeTextRequest { request, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
     
            guard let observations = request.results as? [VNRecognizedTextObservation] else { return }
     
            observations.forEach { observation in
                guard let recognizedText = observation.topCandidates(1).first else { return }
                textItem.text += recognizedText.string
                textItem.text += "\n"
            }
        }
     
        request.recognitionLevel = .accurate
        request.usesLanguageCorrection = true
     
        return request
    }
}

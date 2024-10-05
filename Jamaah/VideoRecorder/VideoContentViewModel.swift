//
//  HomeCam.swift
//  Jamaah
//
//  Created by Fatimah Alqarni on 29/03/1446 AH.
//

import Photos
import Foundation
import AVFoundation

class VideoContentViewModel: NSObject, ObservableObject {
    let session: AVCaptureSession
    @Published var preview: Preview?
    private var isUsingFrontCamera = false
    
    override init() {
        self.session = AVCaptureSession()
        
        super.init()
        
        Task(priority: .background) {
            switch await AuthorizationChecker.checkCaptureAuthorizationStatus() {
            case .permitted:
                try session
                    .addMovieInput(usingFrontCamera: isUsingFrontCamera)
                    .addMovieFileOutput()
                    .startRunning()
                
                DispatchQueue.main.async {
                    self.preview = Preview(session: self.session, gravity: .resizeAspectFill)
                }
                
            case .notPermitted:
                break
            }
        }
    }
    
    func startRecording() {
        guard let output = session.movieFileOutput else {
            print("Cannot find movie file output")
            return
        }
        
        guard let directoryPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            print("Cannot access local file domain")
            return
        }
        
        let fileName = UUID().uuidString
        let filePath = directoryPath.appendingPathComponent(fileName).appendingPathExtension("mp4")
        
        output.startRecording(to: filePath, recordingDelegate: self)
    }
    
    func stopRecording() {
        guard let output = session.movieFileOutput else {
            print("Cannot find movie file output")
            return
        }
        
        output.stopRecording()
    }
    
    func toggleCamera() {
        session.stopRunning()
        
        do {
            if let currentInputs = session.inputs as? [AVCaptureDeviceInput] {
                for input in currentInputs {
                    session.removeInput(input)
                }
            }

            try session.addMovieInput(usingFrontCamera: isUsingFrontCamera)
            isUsingFrontCamera.toggle()
            
        } catch {
            print("Error switching cameras: \(error)")
        }
        
        session.startRunning()
    }
}

extension VideoContentViewModel: AVCaptureFileOutputRecordingDelegate {
    func fileOutput(_ output: AVCaptureFileOutput, didFinishRecordingTo outputFileURL: URL, from connections: [AVCaptureConnection], error: Error?) {
        print("Video record is finished!")
        
        // حفظ الفيديو في ألبوم الصور
        saveVideoToPhotoLibrary(videoURL: outputFileURL)
    }
    
    private func saveVideoToPhotoLibrary(videoURL: URL) {
        PHPhotoLibrary.shared().performChanges({
            PHAssetChangeRequest.creationRequestForAssetFromVideo(atFileURL: videoURL)
        }) { success, error in
            if let error = error {
                print("Error saving video: \(error)")
            } else {
                print("Video saved successfully!")
            }
        }
    }
}

extension AVCaptureSession {
    var movieFileOutput: AVCaptureMovieFileOutput? {
        let output = self.outputs.first as? AVCaptureMovieFileOutput
        return output
    }
    
    func addMovieInput(usingFrontCamera: Bool) throws -> Self {
        let cameraPosition: AVCaptureDevice.Position = usingFrontCamera ? .front : .back
        guard let videoDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: cameraPosition) else {
            throw VideoError.device(reason: .unableToSetInput)
        }
        
        let videoInput = try AVCaptureDeviceInput(device: videoDevice)
        guard self.canAddInput(videoInput) else {
            throw VideoError.device(reason: .unableToSetInput)
        }
        
        self.addInput(videoInput)
        
        return self
    }
    
    func addMovieFileOutput() throws -> Self {
        guard self.movieFileOutput == nil else {
            return self
        }
        
        let fileOutput = AVCaptureMovieFileOutput()
        guard self.canAddOutput(fileOutput) else {
            throw VideoError.device(reason: .unableToSetOutput)
        }
        
        self.addOutput(fileOutput)
        
        return self
    }
}

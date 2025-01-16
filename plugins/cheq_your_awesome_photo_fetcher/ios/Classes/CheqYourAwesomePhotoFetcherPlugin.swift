import Flutter
import UIKit
import Photos

public class CheqYourAwesomePhotoFetcherPlugin: NSObject, FlutterPlugin {

    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "cheqYourAwesomePhotoFetcher", binaryMessenger: registrar.messenger())
        let instance = CheqYourAwesomePhotoFetcherPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if call.method == "getPhotosByAlbum" {
            fetchPhotosByAlbum(result: result)
        } else {
            result(FlutterMethodNotImplemented)
        }
    }

    private func fetchPhotosByAlbum(result: @escaping FlutterResult) {
        PHPhotoLibrary.requestAuthorization { status in
            if status == .authorized {
                self.fetchPhotosGroupedByMonth(result: result)
            } else {
                result(FlutterError(code: "PERMISSION_DENIED", message: "Photo library access denied", details: nil))
            }
        }
    }

    private func fetchPhotosGroupedByMonth(result: @escaping FlutterResult) {
        var photosByMonth = [String: [[String: Any]]]()

        let fetchOptions = PHFetchOptions()
        fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: true)]

        let fetchResult: PHFetchResult = PHAsset.fetchAssets(with: .image, options: fetchOptions)

        fetchResult.enumerateObjects { (asset, _, _) in
            if let creationDate = asset.creationDate {
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "MMM, YYYY"
                let dateString = dateFormatter.string(from: creationDate)

                let photoId = Int.random(in: 1...10000)
                var photoName = String(photoId)
                var photoPath: String?

                let resources = PHAssetResource.assetResources(for: asset)
                if let resource = resources.first {
                    let tempDirectory = FileManager.default.temporaryDirectory
                    let tempFileURL = tempDirectory.appendingPathComponent("\(photoName).jpg")
                    let options = PHAssetResourceRequestOptions()
                    options.isNetworkAccessAllowed = true

                    PHAssetResourceManager.default().writeData(for: resource, toFile: tempFileURL, options: options) { error in
                        if let error = error {
                            print("Failed to write file: \(error.localizedDescription)")
                        } else {
                            photoPath = tempFileURL.path
                        }

                        let photo = [
                            "id": photoId,
                            "name": photoName,
                            "path": photoPath ?? ""
                        ]

                        if photosByMonth[dateString] != nil {
                            photosByMonth[dateString]?.append(photo)
                        } else {
                            photosByMonth[dateString] = [photo]
                        }
                    }
                }
            }
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            var resultArray = [[String: Any]]()
            for (month, photos) in photosByMonth {
                resultArray.append([
                    "albumName": month,
                    "photos": photos
                ])
            }
            result(resultArray)
        }
    }
}

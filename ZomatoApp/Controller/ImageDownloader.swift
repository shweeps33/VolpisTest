//
//  ImageDownloader.swift
//  VolpisTestProject
//
//  Created by Davyd Shved on 6/25/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import Foundation
import UIKit

class ImageDownloader {
    weak var delegate: ImageDownloaderDelegate?
    
    func download(withUrl url: String, forCell index: IndexPath) {
        guard let url = URL(string: url) else { return }
        DispatchQueue.global().async {
            guard let data = try? Data(contentsOf: url) else { return }
            DispatchQueue.main.async {
                self.delegate?.finished(withImage: data, forCell: index)
            }
        }
    }
//
//    func getPrerollFromCache(withURL url: URL) {
//        guard let file = fileCacheManager.getFile(withKey: url.path) else {
//            self.fileCacheManager.addFile(withKey: url.path, andURL: url)
//        }
//        return self.fileCacheManager.getFile(withKey: fileCache.key)
//    }
//
//    func getFile(withKey key: String) {
//        guard isCachingEnabled == true else {
//            return Future<URL>(fail: FileCacheManagerError.cachingIsDisabled)
//        }
//
//        return coreDataStorage.get(withKey: key)
//            .onSuccess(.main) { fileCache -> Future<URL> in
//                guard let fileName = fileCache.fileName else { return Future<URL>(fail: FileCacheManagerError.noFileName) }
//                return self.diskStorage.get(withName: fileName)
//        }
//    }
//
//    func addFile(withKey key: String, andURL url: URL, completion: @escaping (FileHandle)->()) {
//
//        return url.isFileURL ? add(localFileURL: url, withKey: key) : add(remoteURL: url, withKey: key)
//    }
//
//    func add(localFileURL: URL, withKey: String) {
//
//    }
//
//    func add(remoteURL: URL, withKey: String) {
//
//    }
//
//    func downloadFile(atURL url: URL, withMode mode: DownloadMode?) -> URLSessionDownloadTask {
//        log.verbose("Download file at \(url)")
//        let downloadSession = session(forMode: mode)
//        let task = downloadSession.downloadTask(with: url)
//        task.resume()
//        return task
//    }
}

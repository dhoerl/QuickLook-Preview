//
//  ThumbnailProvider.swift
//  OpenRocket Thumbnail
//
//  Created by David Hoerl on 11/7/25.
//

import AppKit
import QuickLookThumbnailing
import ZIPFoundation

/*
    /**
    The maximum size of the generated thumbnail that will be accepted. This is also the preferred size, ideally either the width or the height will match the maximumSize's width or height respectively.
     */
    open var maximumSize: CGSize { get }

    /**
     The minimum size of the generated thumbnail that will be accepted.
     */
    open var minimumSize: CGSize { get }

    /**
     The scale of the requested thumbnail.
     */
    open var scale: CGFloat { get }

    /**
     The url of the file for which a thumbnail is being requested.
     */
    open var fileURL: URL { get }
 */


final class ThumbnailProvider: QLThumbnailProvider {

    override func provideThumbnail(for request: QLFileThumbnailRequest, _ handler: @escaping (QLThumbnailReply?, Error?) -> Void) {
        
        // There are three ways to provide a thumbnail through a QLThumbnailReply. Only one of them should be used.
        
        // First way: Draw the thumbnail into the current context, set up with UIKit's coordinate system.
        handler(QLThumbnailReply(contextSize: request.maximumSize, currentContextDrawing: { () -> Bool in
            // Draw the thumbnail here.
            print("maximumSize = \(request.maximumSize)")
            print("minimumSize = \(request.minimumSize)")
            print("scale = \(request.scale)")

            do {
                let archive = try Archive(url: request.fileURL, accessMode: .read)
                guard let entry = archive["preview.png"] else {
                    //print("DAMN - no preview file")
                    return false
                }

                var imageData = Data()
                _ = try archive.extract(entry, skipCRC32: true, consumer: { (data) in
                    //print("Chunk Size: \(data.count)")
                    imageData.append(data)
                })
                print("Size = \(imageData.count)")
                #if true
                if !imageData.isEmpty, let image = NSImage(data: imageData) {
                    //print("Loaded image. Size=\(image.size)")
                    image.draw(in: NSRect(origin: .zero, size: request.maximumSize))
                    return true
                } else {
                    print("No image")
                    return false
                }
                #else

                #endif
            } catch {
                print("CANNOT DO ARCHIVE DIR \(error)")
                return false
            }
        }), nil)
    }
}

        /*

        // Second way: Draw the thumbnail into a context passed to your block, set up with Core Graphics's coordinate system.
        handler(QLThumbnailReply(contextSize: request.maximumSize, drawing: { (context) -> Bool in
            // Draw the thumbnail here.
         
            // Return true if the thumbnail was successfully drawn inside this block.
            return true
        }), nil)
         
        // Third way: Set an image file URL.
        handler(QLThumbnailReply(imageFileURL: Bundle.main.url(forResource: "fileThumbnail", withExtension: "jpg")!), nil)
        
        */


private func drawURL(url: URL) {
/*

 */



}


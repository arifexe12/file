//
//  main.swift
//  File
//
//  Created by Arif Rahman on 1/26/17.
//  Copyright © 2017 Macbook Pro. All rights reserved.
//

import Foundation

func getPath(input:String)->String{
    
    let arr=input.components(separatedBy: "/");
    var output="";
    for i in 0..<arr.count-1 {
        output=output+arr[i]+"/";
    }
    
    
    return output;
}

var manager=FileManager.default;
var path=CommandLine.arguments[0];
 path=getPath(input: path);
var apk_path=path+"apk/";
print("apk path  width \(apk_path.width()) ")


if(!manager.fileExists(atPath:apk_path ))
{
try manager.createDirectory(atPath:apk_path, withIntermediateDirectories: false, attributes: nil);
}
  manager.createFile(atPath: apk_path+"arif.txt", contents: nil, attributes: nil);

var list=manager.enumerator(atPath:path);
var isDir:ObjCBool=true;
while let b=list?.nextObject() as? String{
  
    
    if b.lowercased().hasSuffix(".apk")
    {
        do{
      //try  manager.copyItem(atPath:b, toPath: apk_path);
            try   manager.removeItem(atPath: apk_path);
        }catch{
            print("Error");
        }
        print(b)
    }
    
    
}


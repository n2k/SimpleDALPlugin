//
//  Main.swift
//  SimpleDALPlugin
//
//  Created by 池上涼平 on 2020/04/25.
//  Copyright © 2020 com.seanchas116. All rights reserved.
//

import Foundation
import CoreMediaIO

func createInterface() -> CMIOHardwarePlugInInterface {
    var interface = CMIOHardwarePlugInInterface()

    return interface
}

typealias PluginRef = UnsafeMutablePointer<UnsafeMutablePointer<CMIOHardwarePlugInInterface>>

@_cdecl("simpleDALPluginMain")
func simpleDALPluginMain(allocator: CFAllocator, requestedTypeUUID: CFUUID) -> PluginRef {
    NSLog("simpleDALPluginMain")

    let interfacePtr = UnsafeMutablePointer<CMIOHardwarePlugInInterface>.allocate(capacity: 1)
    interfacePtr.pointee = createInterface()

    let pluginRef = PluginRef.allocate(capacity: 1)
    pluginRef.pointee = interfacePtr

    NSLog("pluginRef")

    return pluginRef
}

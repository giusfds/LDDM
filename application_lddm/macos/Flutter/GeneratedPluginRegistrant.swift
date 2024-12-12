//
//  Generated file. Do not edit.
//

import FlutterMacOS
import Foundation

<<<<<<< HEAD
import sqflite_darwin

func RegisterGeneratedPlugins(registry: FlutterPluginRegistry) {
=======
import file_selector_macos
import sqflite_darwin

func RegisterGeneratedPlugins(registry: FlutterPluginRegistry) {
  FileSelectorPlugin.register(with: registry.registrar(forPlugin: "FileSelectorPlugin"))
>>>>>>> 8a31e92c612980e6bc9681eaa3bf7e816dd29a3d
  SqflitePlugin.register(with: registry.registrar(forPlugin: "SqflitePlugin"))
}

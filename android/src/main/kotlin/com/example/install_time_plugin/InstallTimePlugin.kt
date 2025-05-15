package com.example.my_flutter_utils

import android.content.pm.PackageManager
import androidx.annotation.NonNull
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class MyFlutterUtilsPlugin : FlutterPlugin, MethodChannel.MethodCallHandler {
  private lateinit var channel: MethodChannel
  private lateinit var packageManager: PackageManager
  private lateinit var packageName: String

  override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "install_time_plugin")
    channel.setMethodCallHandler(this)
    val context = flutterPluginBinding.applicationContext
    packageManager = context.packageManager
    packageName = context.packageName
  }

  override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: MethodChannel.Result) {
    if (call.method == "getFirstInstallTime") {
      try {
        val info = packageManager.getPackageInfo(packageName, 0)
        result.success(info.firstInstallTime)
      } catch (e: Exception) {
        result.error("ERR", "Failed to get install time", null)
      }
    } else {
      result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
package com.samir_ribeiro.flutter_cpp_ai

import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import android.util.Log

class MainActivity : FlutterActivity() {
    private val CHANNEL = "com.samir_ribeiro.flutter_cpp_ai"
    private val TAG = "NativeMath"

    companion object {
        init {
            try {
                System.loadLibrary("native_math")
                Log.d("NativeMath", "Native library loaded successfully")
            } catch (e: UnsatisfiedLinkError) {
                Log.e("NativeMatch", "Failed to load native library: ${e.message}")
            }
        }
    }

    private external fun nativeAdd(x: Int, y: Int): Int

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            CHANNEL
        ).setMethodCallHandler { call, result ->
            try {
                when (call.method) {
                    "add" -> {
                        val x = call.argument<Int>("x") ?: 0
                        val y = call.argument<Int>("y") ?: 0
                        val sum = nativeAdd(x, y)
                        result.success(sum)
                    }

                    else -> {
                        result.notImplemented()
                    }
                }
            } catch (e: Exception) {
                Log.e(TAG, "Error in method call: ${e.message}", e)
                result.error(
                    "NATIVE_ERROR",
                    "Native method error: ${e.message}",
                    e.stackTraceToString()
                )
            }
        }
    }
}

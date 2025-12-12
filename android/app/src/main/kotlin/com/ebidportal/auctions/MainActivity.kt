package com.ebidportal.auctions

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import android.util.Log
import android.os.Build
import android.window.OnBackInvokedDispatcher
import android.window.OnBackInvokedCallback
import androidx.annotation.RequiresApi

class MainActivity : FlutterActivity() {
    private val CHANNEL = "com.ebidportal.auctions/back_handler"
    private var methodChannel: MethodChannel? = null
    private var backCallback: OnBackInvokedCallback? = null

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        
        methodChannel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
        Log.d("MainActivity", "Method channel configured for back button handling")
        Log.d("MainActivity", "Android API Level: ${Build.VERSION.SDK_INT}")
        Log.d("MainActivity", "Android Version: ${Build.VERSION.RELEASE}")
        
        // Set up method call handler for Flutter requests
        methodChannel?.setMethodCallHandler { call, result ->
            when (call.method) {
                "reRegisterCallback" -> {
                    Log.d("MainActivity", "Flutter requested callback re-registration")
                    ensureBackHandlingActive()
                    result.success(null)
                }
                else -> {
                    result.notImplemented()
                }
            }
        }
        
        // Setup appropriate back handling based on Android version
        when {
            Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU -> {
                Log.d("MainActivity", "Using modern back gesture handling (Android 13+)")
                setupModernBackHandling()
            }
            Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q -> {
                Log.d("MainActivity", "Using traditional back handling (Android 10-12)")
                // Traditional onBackPressed() will be used
            }
            else -> {
                Log.d("MainActivity", "Using legacy back handling (Android 9 and below)")
                // Traditional onBackPressed() will be used
            }
        }
    }

    @RequiresApi(Build.VERSION_CODES.TIRAMISU)
    private fun setupModernBackHandling() {
        try {
            backCallback = OnBackInvokedCallback {
                Log.d("MainActivity", "Modern back gesture detected (Android 13+) - ALWAYS calling Flutter")
                handleBackPress()
            }
            
            onBackInvokedDispatcher.registerOnBackInvokedCallback(
                OnBackInvokedDispatcher.PRIORITY_DEFAULT,
                backCallback!!
            )
            Log.d("MainActivity", "Modern back gesture callback registered successfully")
        } catch (e: Exception) {
            Log.e("MainActivity", "Failed to setup modern back handling: ${e.message}")
            Log.d("MainActivity", "Fallback: Will use traditional onBackPressed()")
        }
    }
    
    // Re-register back callback to ensure it's always active
    private fun ensureBackHandlingActive() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU && backCallback != null) {
            try {
                // Unregister and re-register to ensure it's active
                onBackInvokedDispatcher.unregisterOnBackInvokedCallback(backCallback!!)
                onBackInvokedDispatcher.registerOnBackInvokedCallback(
                    OnBackInvokedDispatcher.PRIORITY_DEFAULT,
                    backCallback!!
                )
                Log.d("MainActivity", "Back callback re-registered to ensure active state")
            } catch (e: Exception) {
                Log.e("MainActivity", "Failed to re-register back callback: ${e.message}")
            }
        }
    }

    override fun onBackPressed() {
        Log.d("MainActivity", "Traditional onBackPressed called (Android API ${Build.VERSION.SDK_INT})")
        // Always delegate to Flutter - never call super.onBackPressed()
        handleBackPress()
    }
    
    private fun handleBackPress() {
        Log.d("MainActivity", "Handling back press via Flutter")
        
        methodChannel?.let { channel ->
            Log.d("MainActivity", "Invoking Flutter back handler")
            channel.invokeMethod("onBackPressed", null, object : MethodChannel.Result {
                override fun success(result: Any?) {
                    Log.d("MainActivity", "Flutter back handler completed successfully")
                    // Ensure back handling remains active after Flutter navigation
                    ensureBackHandlingActive()
                }
                
                override fun error(errorCode: String, errorMessage: String?, errorDetails: Any?) {
                    Log.e("MainActivity", "Flutter back handler error: $errorCode - $errorMessage")
                    // Allow fallback only if Flutter completely fails
                    if (Build.VERSION.SDK_INT < Build.VERSION_CODES.TIRAMISU) {
                        super@MainActivity.onBackPressed()
                    } else {
                        finish()
                    }
                }
                
                override fun notImplemented() {
                    Log.w("MainActivity", "Flutter back handler not implemented - method channel might not be ready")
                    Log.w("MainActivity", "NOT calling default back behavior to prevent unexpected app closure")
                }
            })
        } ?: run {
            Log.w("MainActivity", "Method channel not available, using default back behavior")
            if (Build.VERSION.SDK_INT < Build.VERSION_CODES.TIRAMISU) {
                super@MainActivity.onBackPressed()
            } else {
                finish()
            }
        }
    }
    
    override fun onDestroy() {
        // Clean up modern back callback
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU && backCallback != null) {
            onBackInvokedDispatcher.unregisterOnBackInvokedCallback(backCallback!!)
            Log.d("MainActivity", "Modern back gesture callback unregistered")
        }
        super.onDestroy()
    }
}

package com.msamil.native_qr_reader

import android.Manifest
import android.content.pm.PackageManager
import androidx.annotation.NonNull
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat
import com.google.zxing.integration.android.IntentIntegrator
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import android.widget.Toast

import com.google.zxing.integration.android.IntentResult

import android.content.Intent





class MainActivity: FlutterActivity() {

    private val CHANNEL = "qr_reader"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {

        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
                call, result ->
            if (call.method == "qr") {
                val qrResponse = readQr()

                if (!qrResponse.isNullOrEmpty()) {
                    result.success(qrResponse)
                } else {
                    result.error("UNAVAILABLE", "QR Reader not available.", null)
                }
            } else {
                result.notImplemented()
            }
        }
    }


    private fun readQr(): String {
        if (ContextCompat.checkSelfPermission(this,Manifest.permission.CAMERA) == PackageManager.PERMISSION_DENIED){
            ActivityCompat.requestPermissions(this, arrayOf(Manifest.permission.CAMERA),123)

        } else {
            startScanning()
        }

        return "qr response"
    }

    fun startScanning() {
        var qrScanner = IntentIntegrator(this)
        qrScanner.setPrompt("QR Code Tara")
        qrScanner.setDesiredBarcodeFormats(IntentIntegrator.QR_CODE)
        qrScanner.setCameraId(0)
        qrScanner.setBeepEnabled(true)
        qrScanner.initiateScan()

    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        val result = IntentIntegrator.parseActivityResult(requestCode, resultCode, data)
        if (result != null) {
            if (result.contents == null) {
                Toast.makeText(this, "Cancelled", Toast.LENGTH_LONG).show()
            } else {
                Toast.makeText(this, "Scanned: " + result.contents, Toast.LENGTH_LONG).show()
            }
        } else {
            super.onActivityResult(requestCode, resultCode, data)
        }
    }



}

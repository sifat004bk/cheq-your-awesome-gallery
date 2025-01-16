package com.sifat.cheq_your_awesome_photo_fetcher

import android.content.ContentResolver
import android.content.Context
import android.provider.MediaStore
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

class CheqYourAwesomePhotoFetcherPlugin : FlutterPlugin, MethodCallHandler {
    private lateinit var channel: MethodChannel
    private lateinit var context: Context

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "cheqYourAwesomePhotoFetcher")
        channel.setMethodCallHandler(this)
        context = flutterPluginBinding.applicationContext
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        when (call.method) {
            "getPhotosByAlbum" -> getPhotosByAlbum(result)
            else -> result.notImplemented()
        }
    }

    private fun getPhotosByAlbum(result: Result) {
        val albums = mutableMapOf<String, MutableList<Map<String, Any>>>()
        val contentResolver: ContentResolver = context.contentResolver
        val uri = MediaStore.Images.Media.EXTERNAL_CONTENT_URI
        val projection = arrayOf(
            MediaStore.Images.Media._ID,
            MediaStore.Images.Media.DISPLAY_NAME,
            MediaStore.Images.Media.DATA,
            MediaStore.Images.Media.BUCKET_DISPLAY_NAME
        )

        val cursor = contentResolver.query(uri, projection, null, null, null)

        cursor?.use {
            val idColumn = it.getColumnIndexOrThrow(MediaStore.Images.Media._ID)
            val nameColumn = it.getColumnIndexOrThrow(MediaStore.Images.Media.DISPLAY_NAME)
            val dataColumn = it.getColumnIndexOrThrow(MediaStore.Images.Media.DATA)
            val bucketNameColumn =
                it.getColumnIndexOrThrow(MediaStore.Images.Media.BUCKET_DISPLAY_NAME)

            while (it.moveToNext()) {
                val id = it.getLong(idColumn)
                val name = it.getString(nameColumn)
                val data = it.getString(dataColumn)
                var albumName = it.getString(bucketNameColumn)

                if (albumName == null) albumName = "Others"

                val photo = mapOf(
                    "id" to id,
                    "name" to name,
                    "path" to data
                )

                albums.getOrPut(albumName) { mutableListOf() }.add(photo)
            }
        }

        val albumList = albums.map { album ->
            mapOf(
                "albumName" to album.key,
                "photos" to album.value
            )
        }
        result.success(albumList)
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) =
        channel.setMethodCallHandler(null)
}

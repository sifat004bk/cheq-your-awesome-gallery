package com.sifat.cheq_your_awesome_photo_fetcher

import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import kotlin.test.Test
import org.mockito.Mockito

/*
 * This demonstrates a simple unit test of the Kotlin portion of this plugin's implementation.
 *
 * Once you have built the plugin's sifat app, you can run these tests from the command
 * line by running `./gradlew testDebugUnitTest` in the `sifat/android/` directory, or
 * you can run them directly from IDEs that support JUnit such as Android Studio.
 */

internal class CheqYourAwesomePhotoFetcherPluginTest {
  @Test
  fun onMethodCall_getPlatformVersion_returnsExpectedValue() {
    val plugin = CheqYourAwesomePhotoFetcherPlugin()

    val call = MethodCall("getPlatformVersion", null)
    val mockResult: MethodChannel.Result = Mockito.mock(MethodChannel.Result::class.java)
    plugin.onMethodCall(call, mockResult)

    Mockito.verify(mockResult).success("Android " + android.os.Build.VERSION.RELEASE)
  }
}

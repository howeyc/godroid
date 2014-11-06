godroid
=======

Android Webview + Go 1.4 net/http server.

Thanks for support:
[![Android Arsenal](https://img.shields.io/badge/Android%20Arsenal-GoDroid-brightgreen.svg?style=flat)](https://android-arsenal.com/details/1/1075)

###QUICK TUTORIAL

1. Get the Golang 1.4 beta, go to into src dir and type: 
```
	CC_FOR_TARGET=$NDK_ROOT/bin/arm-linux-androideabi-gcc GOOS=android GOARCH=arm GOARM=7 ./make.bash
```

2. Download and Android Stuff
	* [NDK](https://developer.android.com/tools/sdk/ndk/index.html)
	* [SDK](https://developer.android.com/sdk/index.html)
	* Install JDK (OpenJDK will work)
	* Install gobind (go get code.google.com/go.mobile/cmd/gobind)

3. Set environment variables:
```
	export NDK_ROOT=$HOME/android/ndk-toolchain
	export JAVA_HOME=/usr/lib/jvm/java-6-openjdk-amd64
	export ANDROID_HOME=$HOME/android-sdk-linux
```

3. Configure the Android stuff (Get the API version and platform target configured):
```
	/path-to-ndk/dl-dir/build/tools/make-standalone-toolchain.sh --platform=android-9 --install-dir=$NDK_ROOT
	cd $ANDROID_HOME
	./android update sdk --no-ui --all --filter 107
	./android update sdk --no-ui --all --filter 20
	./android update sdk --no-ui --all --filter 7
```

4. Review the Makefile, run **make**

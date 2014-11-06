godroid
=======

Android Webview + Go 1.4 net/http server.

See the original great work by [MarinX](https://github.com/MarinX/godroid)

### QUICK TUTORIAL

#### Download the Android Stuff

* [NDK](https://developer.android.com/tools/sdk/ndk/index.html)
* [SDK](https://developer.android.com/sdk/index.html)
* Install JDK (OpenJDK will work)

#### Set environment variables

```
	export NDK_ROOT=$HOME/android/ndk-toolchain
	export JAVA_HOME=/usr/lib/jvm/java-6-openjdk-amd64
	export ANDROID_HOME=$HOME/android-sdk-linux
```

#### Configure the Android stuff (Get the API version and platform target configured)

```
	/path-to-ndk/dl-dir/build/tools/make-standalone-toolchain.sh --platform=android-9 --install-dir=$NDK_ROOT
	cd $ANDROID_HOME
	./android update sdk --no-ui --all --filter 107
	./android update sdk --no-ui --all --filter 20
	./android update sdk --no-ui --all --filter 7
```

#### Get the Golang 1.4 beta, go to into src dir and type: 

```
	CC_FOR_TARGET=$NDK_ROOT/bin/arm-linux-androideabi-gcc GOOS=android GOARCH=arm GOARM=7 ./make.bash
```

Install gobind

```
	go get code.google.com/go.mobile/cmd/gobind
```

#### Build

Review the Makefile, run **make**

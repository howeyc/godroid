app-debug.apk: android_studio_app/GoDroid/app/build/outputs/apk/app-debug.apk
	cp android_studio_app/GoDroid/app/build/outputs/apk/app-debug.apk app-debug.apk

android_studio_app/GoDroid/app/build/outputs/apk/app-debug.apk: android_studio_app/GoDroid/app/src/main/jniLibs/armeabi-v7a/libgojni.so android_studio_app/GoDroid/app/src/main/java/go/godroid/Godroid.java
	cd android_studio_app/GoDroid/ && ./gradlew assembleDebug

android_so_lib/libgojni.so: android_so_lib/main.go go_godroid/go_godroid.go
	cd android_so_lib && CC=${NDK_ROOT}/arm-linux-androideabi/bin/gcc CGO_ENABLED=1 GOOS=android GOARCH=arm go build -o libgojni.so -ldflags="-shared"

android_studio_app/GoDroid/app/src/main/jniLibs/armeabi-v7a/libgojni.so: android_so_lib/libgojni.so
	mkdir -p android_studio_app/GoDroid/app/src/main/jniLibs/armeabi-v7a
	cp android_so_lib/libgojni.so android_studio_app/GoDroid/app/src/main/jniLibs/armeabi-v7a/libgojni.so

android_studio_app/GoDroid/app/src/main/java/go/godroid/Godroid.java: godroid.go
	mkdir -p android_studio_app/GoDroid/app/src/main/java/go/godroid
	CGO_ENABLED=0 gobind -lang=java . > android_studio_app/GoDroid/app/src/main/java/go/godroid/Godroid.java

go_godroid/go_godroid.go: godroid.go
	mkdir -p go_godroid
	CGO_ENABLED=0 gobind -lang=go . > go_godroid/go_godroid.go

clean:
	rm go_godroid/go_godroid.go
	rm android_studio_app/GoDroid/app/src/main/java/go/godroid/Godroid.java
	rm android_so_lib/libgojni.so
	rm android_studio_app/GoDroid/app/src/main/jniLibs/armeabi-v7a/libgojni.so
	rm android_studio_app/GoDroid/app/build/outputs/apk/app-debug.apk
	rm app-debug.apk

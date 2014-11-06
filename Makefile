android_studio_app/GoDroid/app/build/outputs/apk/app-debug.apk: android_studio_app/GoDroid/app/src/main/jniLibs/armeabi-v7a/libgojni.so android_studio_app/GoDroid/app/src/main/java/go/godroid/Godroid.java
	cd android_studio_app/GoDroid/ && ./gradlew assembleDebug

android_so_lib/libgojni.so: android_so_lib/main.go go_godroid/go_godroid.go
	cd android_so_lib && CGO_ENABLED=1 GOOS=android GOARCH=arm go build -o libgojni.so -ldflags="-shared"

android_studio_app/GoDroid/app/src/main/jniLibs/armeabi-v7a/libgojni.so: android_so_lib/libgojni.so
	mv android_so_lib/libgojni.so android_studio_app/GoDroid/app/src/main/jniLibs/armeabi-v7a/libgojni.so

android_studio_app/GoDroid/app/src/main/java/go/godroid/Godroid.java: godroid.go
	CGO_ENABLED=0 gobind -lang=java github.com/MarinX/godroid > android_studio_app/GoDroid/app/src/main/java/go/godroid/Godroid.java

go_godroid/go_godroid.go: godroid.go
	CGO_ENABLED=0 gobind -lang=go github.com/MarinX/godroid > go_godroid/go_godroid.go

clean:
	rm go_godroid/go_godroid.go
	rm android_studio_app/GoDroid/app/src/main/java/go/godroid/Godroid.java
	rm android_so_lib/libgojni.so
	rm android_studio_app/GoDroid/app/src/main/jniLibs/armeabi-v7a/libgojni.so
	rm android_studio_app/GoDroid/app/build/outputs/apk/app-debug.apk

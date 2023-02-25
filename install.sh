mkdir ~/android-sdk
cd ~/android-sdk
wget https://dl.google.com/android/repository/commandlinetools-mac-9477386_latest.zip -O cli-tools-android.zip
unzip cli-tools-android.zip
tools/bin/sdkmanager --update

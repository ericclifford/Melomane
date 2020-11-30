./gradlew app:bundleDebug

curl -O -L "https://github.com/google/bundletool/releases/download/0.11.0/bundletool-all-0.11.0.jar"

# Get the build directory from build config
TRAVIS_BUILD_DIR=$1

# Use bundletool to create universal .apks zip
java -jar bundletool-all-0.11.0.jar build-apks \
    --mode=universal \
    --bundle=${TRAVIS_BUILD_DIR}/app/build/outputs/bundle/prodDebug/app.aab \
    --output=${TRAVIS_BUILD_DIR}/app/build/outputs/bundle/prodDebug/app.apks \
    --ks=${TRAVIS_BUILD_DIR}/app/build-extras/debug.keystore \
    --ks-pass=pass:android \
    --ks-key-alias=androiddebugkey \
    --key-pass=pass:android;
    
unzip ${TRAVIS_BUILD_DIR}/app/build/outputs/bundle/prodDebug/app.apks -d ${TRAVIS_BUILD_DIR}/app/build/outputs/bundle/prodDebug/unzipped;


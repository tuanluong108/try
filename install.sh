#!/bin/bash

main() {
    echo -e "Downloading Latest Roblox"
    local version="version-ecb0dc61c2ff4160"
    curl "http://setup.rbxcdn.com/mac/$version-RobloxPlayer.zip" -o "./RobloxPlayer.zip"

    echo -e "Installing Latest Roblox"
    [ -d "/Applications/Roblox.app" ] && rm -rf "/Applications/Roblox.app"
    unzip -o -q "./RobloxPlayer.zip"
    mv ./RobloxPlayer.app /Applications/Roblox.app
    rm ./RobloxPlayer.zip

    echo -e "Downloading try"
    curl -O "https://raw.githubusercontent.com/tuanluong108/try/raw/main/try.zip"

    echo -e "Installing MacSploit"
    unzip -o -q "./try.zip"

    echo -e "Patching Roblox"
    mv ./RobloxCheats.dylib "/Applications/Roblox.app/Contents/MacOS/RobloxCheats.dylib"
    mv ./libESP.dylib "/Applications/Roblox.app/Contents/MacOS/libESP.dylib"
    ./insert_dylib "/Applications/Roblox.app/Contents/MacOS/RobloxCheats.dylib" "/Applications/Roblox.app/Contents/MacOS/RobloxPlayer" --strip-codesig --all-yes
    mv "/Applications/Roblox.app/Contents/MacOS/RobloxPlayer_patched" "/Applications/Roblox.app/Contents/MacOS/RobloxPlayer"
    rm ./insert_dylib


    echo -e "Install Complete! Developed by milo!"
}

main

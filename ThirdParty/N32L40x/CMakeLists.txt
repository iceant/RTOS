include(FetchContent)
FetchContent_Declare(
        n32l40x_sdk
        URL        ftp://download.nationstech.com/1-Microcontrollers/N32L40xxx_V2.1.0.zip
        SOURCE_DIR n32l40x_sdk
)
FetchContent_MakeAvailable(n32l40x_sdk)


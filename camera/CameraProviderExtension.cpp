/*
 * Copyright (C) 2024 LibreMobileOS Foundation
 * Copyright (C) 2025 TheParasiteProject
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#include "CameraProviderExtension.h"

#include <fstream>

#define TORCH_BRIGHTNESS "brightness"
#define TORCH_MAX_BRIGHTNESS "max_brightness"
#define TOGGLE_SWITCH "/sys/class/leds/led:switch_0/brightness"

static std::string kTorchLedPaths[] = {
        "/sys/class/leds/led:torch_0",
};

/**
 * Write value to path and close file.
 */
template <typename T>
static void set(const std::string& path, const T& value) {
    std::ofstream file(path);
    file << value;
}

/**
 * Read value from the path and close file.
 */
template <typename T>
static T get(const std::string& path, const T& def) {
    std::ifstream file(path);
    T result;

    file >> result;
    return file.fail() ? def : result;
}

bool supportsTorchStrengthControlExt() {
    return true;
}

int32_t getTorchDefaultStrengthLevelExt() {
    return 15;
}

int32_t getTorchMaxStrengthLevelExt() {
    return 100;
}

int32_t getTorchStrengthLevelExt() {
    // We write same value in the both LEDs,
    // so get from one.
    auto node = kTorchLedPaths[0] + "/" + TORCH_BRIGHTNESS;
    return get(node, 0);
}

void setTorchStrengthLevelExt(int32_t torchStrength, bool enabled) {
    set(TOGGLE_SWITCH, 0);
    for (auto& path : kTorchLedPaths) {
        auto node = path + "/" + TORCH_BRIGHTNESS;
        set(node, enabled ? torchStrength : 0);
    }
    if (enabled)
        set(TOGGLE_SWITCH, 1);
}

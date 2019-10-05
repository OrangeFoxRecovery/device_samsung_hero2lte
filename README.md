# TWRP device tree for Samsung S7 Edge aka hero2lte

 Copyright (C) 2019 morogoku Open-source

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

 http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.


Add to `.repo/local_manifests/hero2lte.xml`:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<manifest>
  <project name="morogoku/android_device_samsung_hero2lte" path="device/samsung/hero2lte" remote="github" revision="android-9.0" />
</manifest>
```

Then run `repo sync` to check it out.

To build:

```sh
. build/envsetup.sh
lunch omni_hero2lte-eng
make -j8 recoveryimage
```

Kernel sources are available at: https://github.com/exynos-linux-stable/hero2lte

/*
   Copyright (c) 2016, The Linux Foundation. All rights reserved.
   Copyright (c) 2017-2020, The LineageOS Project. All rights reserved.

   Redistribution and use in source and binary forms, with or without
   modification, are permitted provided that the following conditions are
   met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above
      copyright notice, this list of conditions and the following
      disclaimer in the documentation and/or other materials provided
      with the distribution.
    * Neither the name of The Linux Foundation nor the names of its
      contributors may be used to endorse or promote products derived
      from this software without specific prior written permission.

   THIS SOFTWARE IS PROVIDED "AS IS" AND ANY EXPRESS OR IMPLIED
   WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
   MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT
   ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS
   BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
   CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
   SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
   BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
   WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
   OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
   IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */


#include <android-base/logging.h>
#include <android-base/properties.h>

#include "property_service.h"

#include "init_msm8226.h"

using android::base::GetProperty;

void vendor_load_properties()
{
    std::string bootloader = GetProperty("ro.bootloader", "");

    if (bootloader.find("G7105") == 0) {
        /* ms01ltexx */
        property_override("ro.build.description", "ms01ltexx-user 4.4.2 KOT49H G7105XXUBNI2 release-keys");
        set_ro_product_prop("device", "ms01lte");
        set_ro_build_prop("fingerprint", "samsung/ms01ltexx/ms01lte:4.4.2/KOT49H/G7105XXUBNI2:user/release-keys");
        set_ro_product_prop("model", "SM-G7105");
        set_ro_product_prop("name", "ms01lte");
        gsm_properties("9", "1");
    } else if (bootloader.find("G7102") == 0) {
        /* ms013gxx */
        property_override("ro.build.description", "ms013gxx-user 4.4.2 KOT49H G7102XXUBOB1 release-keys");
        set_ro_product_prop("device", "ms013g");
        set_ro_build_prop("fingerprint", "samsung/ms013gxx/ms013g:4.4.2/KOT49H/G7102XXUBOB1:user/release-keys");
        set_ro_product_prop("model", "SM-G7102");
        set_ro_product_prop("name", "ms013g");
        gsm_properties("3", "0");
    } else {
        gsm_properties("9", "1");
    }

    std::string device = GetProperty("ro.product.device", "");
    LOG(ERROR) << "Found bootloader id " << bootloader <<  " setting build properties for "
        << device <<  " device" << std::endl;
}

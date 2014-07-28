## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)
 
# Release name
PRODUCT_RELEASE_NAME := DIABLOXPLUS
 
# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/TCT/DIABLOXPLUS/DIABLOXPLUS.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := DIABLOXPLUS
PRODUCT_NAME := cm_DIABLOXPLUS
PRODUCT_BRAND := TCT
PRODUCT_MODEL := TCL S960
PRODUCT_MANUFACTURER := TCT

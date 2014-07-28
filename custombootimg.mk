$(INSTALLED_RECOVERYIMAGE_TARGET): $(recovery_ramdisk) \
		$(recovery_kernel)
	@echo ----- Making recovery image ------
	
	cd out/target/product/DIABLOXPLUS; \
	mkdir ramdisk; \
	cd ramdisk; \
	cpio -idmv < ../ramdisk-recovery.cpio; \
	cat res/ui.xml | sed -e "s/Team Win Recovery Project/TWRP For IDOLX+ TCL_S960 By 荷花2008/" > res/ui.xml.new; \
	mv res/ui.xml.new res/ui.xml; \
	cat res/ui.xml | sed -e "s/Roboto-Condensed-40/Roboto-Condensed-30/" > res/ui.xml.new; \
	mv res/ui.xml.new res/ui.xml; \
	cd ../../../../../
	
	perl 2.pl -recovery $(recovery_kernel) out/target/product/DIABLOXPLUS/ramdisk $@
	@echo ----- Made recovery image -------- $@
	$(hide) $(call assert-max-image-size,$@,$(BOARD_RECOVERYIMAGE_PARTITION_SIZE),raw)


$(INSTALLED_BOOTIMAGE_TARGET): $(INTERNAL_BOOTIMAGE_FILES)
	$(call pretty,"Target boot image: $@")
	perl 2.pl -boot $(recovery_kernel) out/target/product/DIABLOXPLUS/root $@
	$(hide) $(call assert-max-image-size,$@,$(BOARD_BOOTIMAGE_PARTITION_SIZE),raw)

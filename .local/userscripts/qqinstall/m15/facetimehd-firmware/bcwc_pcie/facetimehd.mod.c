#include <linux/module.h>
#define INCLUDE_VERMAGIC
#include <linux/build-salt.h>
#include <linux/vermagic.h>
#include <linux/compiler.h>

BUILD_SALT;

MODULE_INFO(vermagic, VERMAGIC_STRING);
MODULE_INFO(name, KBUILD_MODNAME);

__visible struct module __this_module
__section(".gnu.linkonce.this_module") = {
	.name = KBUILD_MODNAME,
	.init = init_module,
#ifdef CONFIG_MODULE_UNLOAD
	.exit = cleanup_module,
#endif
	.arch = MODULE_ARCH_INIT,
};

#ifdef CONFIG_RETPOLINE
MODULE_INFO(retpoline, "Y");
#endif

static const struct modversion_info ____versions[]
__used __section("__versions") = {
	{ 0x8d52df7b, "module_layout" },
	{ 0xd9ce0c7, "vb2_ioctl_reqbufs" },
	{ 0x2d3385d3, "system_wq" },
	{ 0x3cb23ff5, "kmalloc_caches" },
	{ 0x45e1e047, "v4l2_event_unsubscribe" },
	{ 0x469a5ee5, "pci_write_config_dword" },
	{ 0xeb233a45, "__kmalloc" },
	{ 0xde0e5942, "pci_release_region" },
	{ 0x19b132b2, "debugfs_create_dir" },
	{ 0xc5e74216, "release_resource" },
	{ 0x936c9ae3, "video_device_release" },
	{ 0x7110f738, "dma_set_mask" },
	{ 0xfbd29de, "vb2_wait_for_all_buffers" },
	{ 0x369d798d, "pci_disable_device" },
	{ 0xca1c0f4b, "v4l2_device_unregister" },
	{ 0x9becfb8, "v4l2_ctrl_handler_free" },
	{ 0x5ed61910, "v4l2_ctrl_new_std" },
	{ 0xabde54ca, "vb2_fop_poll" },
	{ 0x21e1230, "vb2_ioctl_streamon" },
	{ 0x36a6db36, "seq_printf" },
	{ 0x3c12dfe, "cancel_work_sync" },
	{ 0xd92deb6b, "acpi_evaluate_object" },
	{ 0xbc0a6a50, "vb2_ops_wait_prepare" },
	{ 0xeae3dfd6, "__const_udelay" },
	{ 0x831d2214, "__video_register_device" },
	{ 0x1b2b4a8, "debugfs_create_file" },
	{ 0xf3e0e1df, "allocate_resource" },
	{ 0x89499aa4, "pv_ops" },
	{ 0x2d39b0a7, "kstrdup" },
	{ 0x8d0f7484, "dma_set_coherent_mask" },
	{ 0xe2d5255a, "strcmp" },
	{ 0xdca9e46, "v4l2_device_register" },
	{ 0x84872c59, "vb2_fop_read" },
	{ 0xd9a5ea54, "__init_waitqueue_head" },
	{ 0x5b8239ca, "__x86_return_thunk" },
	{ 0xdc81e907, "pci_set_master" },
	{ 0xe8a45e61, "_dev_warn" },
	{ 0x6d257f55, "default_llseek" },
	{ 0x11deec70, "video_device_alloc" },
	{ 0xd35cce70, "_raw_spin_unlock_irqrestore" },
	{ 0xc3b251ee, "vb2_fop_mmap" },
	{ 0x2be43c65, "vb2_ioctl_qbuf" },
	{ 0x977f511b, "__mutex_init" },
	{ 0xc5850110, "printk" },
	{ 0xbcab6ee6, "sscanf" },
	{ 0x366db37f, "video_unregister_device" },
	{ 0xde80cd09, "ioremap" },
	{ 0x1a9a433c, "prandom_u32_state" },
	{ 0x7dc20187, "v4l2_ctrl_subscribe_event" },
	{ 0x1355db5c, "vb2_buffer_done" },
	{ 0xaafdc258, "strcasecmp" },
	{ 0xa1c76e0a, "_cond_resched" },
	{ 0x9166fada, "strncpy" },
	{ 0x5a921311, "strncmp" },
	{ 0x9b1a8864, "debugfs_remove" },
	{ 0x92d5838e, "request_threaded_irq" },
	{ 0x82364f03, "vb2_ioctl_create_bufs" },
	{ 0x40c795c, "simple_open" },
	{ 0x4cc03613, "_dev_err" },
	{ 0x7ad78dfb, "pci_enable_msi" },
	{ 0x7fd68f70, "vb2_ioctl_dqbuf" },
	{ 0xfe487975, "init_wait_entry" },
	{ 0x4a97eacd, "vb2_plane_cookie" },
	{ 0xc557ad81, "_dev_info" },
	{ 0xb7eb0331, "kmem_cache_alloc" },
	{ 0xdc59d5a, "pci_disable_link_state" },
	{ 0x5dc825d2, "vb2_fop_release" },
	{ 0x2af12d84, "video_devdata" },
	{ 0xba81900c, "debugfs_create_devm_seqfile" },
	{ 0xc959d152, "__stack_chk_fail" },
	{ 0x8ddd8aad, "schedule_timeout" },
	{ 0x8427cc7b, "_raw_spin_lock_irq" },
	{ 0xb9e7429c, "memcpy_toio" },
	{ 0xbb1660a8, "pci_read_config_dword" },
	{ 0xd27da236, "pci_unregister_driver" },
	{ 0x34db050b, "_raw_spin_lock_irqsave" },
	{ 0xd43cbfed, "v4l2_fh_open" },
	{ 0x3eeb2322, "__wake_up" },
	{ 0x954e38b0, "pci_set_power_state" },
	{ 0x8c26d495, "prepare_to_wait_event" },
	{ 0xf9ca766b, "vb2_ioctl_querybuf" },
	{ 0x37a0cba, "kfree" },
	{ 0x1785016, "pci_disable_msi" },
	{ 0xd58e70dd, "net_rand_noise" },
	{ 0xedc03953, "iounmap" },
	{ 0x7d628444, "memcpy_fromio" },
	{ 0x8dc8501e, "v4l2_ctrl_handler_init_class" },
	{ 0x59567122, "__pci_register_driver" },
	{ 0xa014718d, "request_firmware" },
	{ 0x8f4631f4, "vb2_ops_wait_finish" },
	{ 0x92540fbf, "finish_wait" },
	{ 0xc5b6f236, "queue_work_on" },
	{ 0x656e4a6e, "snprintf" },
	{ 0xf49c2d05, "vb2_ioctl_expbuf" },
	{ 0x7f02188f, "__msecs_to_jiffies" },
	{ 0x909aca79, "vb2_ioctl_streamoff" },
	{ 0x4a453f53, "iowrite32" },
	{ 0x77b39d36, "pci_enable_device" },
	{ 0x13c49cc2, "_copy_from_user" },
	{ 0x757f4164, "is_acpi_device_node" },
	{ 0xc6d09aa9, "release_firmware" },
	{ 0xf13ad1c9, "video_ioctl2" },
	{ 0xea258138, "pci_request_region" },
	{ 0x9e7d6bd0, "__udelay" },
	{ 0x88db9f48, "__check_object_size" },
	{ 0xa78af5f3, "ioread32" },
	{ 0xb00a1a40, "vb2_dma_sg_memops" },
	{ 0xc1514a3b, "free_irq" },
	{ 0x81e6b37f, "dmi_get_system_info" },
	{ 0x2cb74d66, "vb2_queue_init" },
};

MODULE_INFO(depends, "videobuf2-v4l2,videodev,videobuf2-common,videobuf2-dma-sg");

MODULE_ALIAS("pci:v000014E4d00001570sv*sd*bc*sc*i*");

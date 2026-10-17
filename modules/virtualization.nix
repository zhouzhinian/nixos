# KVM/QEMU + libvirt 虚拟化配置
#
# 依赖：CPU 虚拟化已开启（kvm-amd 已加载，/dev/kvm 存在，用户在 kvm 组）。
{ config, lib, pkgs, ... }:

{
  # libvirt + QEMU/KVM 后端
  virtualisation.libvirtd = {
    enable = true;
    qemu.swtpm.enable = true; # 软件 TPM 2.0（装 Windows 11 需要）
  };

  # 允许把宿主机 USB 设备直通给虚拟机
  virtualisation.spiceUSBRedirection.enable = true;

  environment.systemPackages = with pkgs; [
    virt-manager # 图形化管理界面
    virt-viewer  # 虚拟机控制台查看器
  ];

  # 让 zhinian 免 sudo 用 virt-manager 管理虚拟机
  users.users.zhinian.extraGroups = [ "libvirtd" ];
}

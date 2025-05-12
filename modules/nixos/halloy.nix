{ pkgs, ... }:

{
  environment.sessionVariables.VK_ICD_FILENAMES = "/etc/vulkan/icd.d/nvidia_icd.json";
  environment.systemPackages = with pkgs; [
    halloy
  ];
}

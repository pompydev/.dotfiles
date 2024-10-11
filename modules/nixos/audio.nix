# - configuration optimized for low latency rhythm game
# - 48kHz sample rate only
#
# Audio latency learning resources:
#   - https://docs.pipewire.org
#   - https://pipewire.pages.freedesktop.org/wireplumber/daemon/configuration/alsa.html#alsa-buffer-properties
#   - https://www.reddit.com/r/linuxaudio/comments/v66mj6/comment/ibjupwb
#   - https://learn.microsoft.com/en-us/windows-hardware/drivers/audio/low-latency-audio

{ pkgs, ... }:

{
  hardware.pulseaudio.support32Bit = true;
  hardware.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;

    wireplumber.extraConfig = {
      "99-low-latency" = {
        "monitor.alsa.rules" = [
          {
            matches = [
              # ifi zen air DAC (digital output)
              # find using wpctl

              {
                node.name = "alsa_output.usb-iFi__by_AMR__iFi__by_AMR__HD_USB_Audio_0002-00.iec958-stereo";
              }
              {
                device.name = "alsa_card.usb-iFi__by_AMR__iFi__by_AMR__HD_USB_Audio_0002-00";
              }
            ];

            actions = {
              update-props = {
                # https://pipewire.pages.freedesktop.org/wireplumber/daemon/configuration/alsa.html#alsa-buffer-properties
                # https://docs.pipewire.org/page_man_pipewire_conf_5.html

                api.alsa.headroom = 0;
                api.alsa.period-size = 128;
                api.alsa.period-num = 1;

                clock.quantum-floor = 16;
                clock.min-quantum = 16;
                clock.quantum = 16;
                clock.max-quantum = 16;
                clock.quantum-limit = 16;

                audio.allowed-rates = "44100,48000";
              };
            };
          }
        ];
      };
    };
  };

  environment.systemPackages = with pkgs; [
    pipewire
    wireplumber

    coppwr
    helvum
  ];
}

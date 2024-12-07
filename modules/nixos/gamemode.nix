{ pkgs, ... }:

{
  users.users.pomp.extraGroups = [ "gamemode" ];
  programs.gamemode = {
    enable = true;

    # https://github.com/FeralInteractive/gamemode/blob/master/example/gamemode.ini
    settings = {
      general = {
        # Check every 12 seconds for:
        #   - exited clients
        #   - config file changes
        #   - CPU/iGPU power balance
        #
        # Default: 5
        reaper_freq = 12;

        # Set desired CPU frequency scaling govenor
        # https://wiki.archlinux.org/title/CPU_frequency_scaling#Scaling_governors
        #
        # Default: system config
        desiredgov = "performance";

        # Ratio of iGPU Watts / CPU Watts.
        # Used to determine when the integraged GPU is under heavy enough load
        # to justify switching to igpu_desiredgov. Set this to -1 to disable all
        # iGPU checking and always use desiredgov for games.
        #
        # Default: 0
        igpu_power_threshold = -1;

        # Change the scheduler policy to SCHED_ISO on kernels which support it.
        # Currently not supported by upstream kernels. Can be set to "auto",
        # "on" or "off" where "auto" enable with 4 or more CPU cores.
        #
        # Default: "off"
        softrealtime = "auto";

        # Renice game processes. You can put any value between 0 and 20 here,
        # the value will be negated and applied as a nice value. To use this
        # feature, the user must be added to the gamemode group and then rebooted.
        #
        # Default: 0
        renice = 20;

        # You can put any value between 0 and 7 here with 0 being highest
        # priority, or one of the special values "off" (to disable) or "reset"
        # (to restore Linux default behavior based on CPU priority), currently,
        # only the best-effort class is supported thus you cannot set it here.
        #
        # Default: 0
        ioprio = 0;

        # Sets whether gamemode will inhibit the screensaver when active.
        # Default: 1
        inhibit_screensaver = 1;

        # Sets whether gamemode will disable split lock mitigation when active.
        # Default: 1
        disable_splitlock = 1;
      };

      cpu = {
        pin_cores = "no";
        park_cores = "no";
      };

      custom = {
        # Executed using the shell when gamemode starts and ends.
        start = "${pkgs.libnotify}/bin/notify-send 'GameMode started'";
        end = "${pkgs.libnotify}/bin/notify-send 'GameMode ended'";

        # Timeout for scripts in seconds.
        # Scripts will be killed if they do not complete within this time.
        script_timeout = 5;
      };
    };
  };
}

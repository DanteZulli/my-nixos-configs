{ den, ... }:
{
  den.aspects.mangohud.homeManager = {
    home.file.".config/MangoHud/MangoHud.conf" = {
      text = ''
        gpu_stats
        gpu_temp
        gpu_load_change
        gpu_load_value=60,90
        gpu_load_color=39F900,FDFD09,B22222

        cpu_stats
        cpu_temp
        cpu_load_change
        cpu_load_value=60,90
        cpu_load_color=39F900,FDFD09,B22222

        io_read
        io_write

        vram
        ram
        swap

        fps
        frametime
        throttling_status
        frame_timing
        gamemode

        text_outline
      '';
    };
  };
}

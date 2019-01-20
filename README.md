# Multi Room Audio Setup
My project to create a Multi Room Audio Setup in my home

## Goal
Distribute the Line-Out Audio Signal from the TV in the Living Room to selected other Rooms in the flat.

## Hardware and Software
### Living Room
* Philips TV
* Raspberry Pi Version 3
* [HiFiBerry DAC+ADC](https://www.hifiberry.com/build/documentation/datasheet-dac-adc/): This is the only Raspberry Pi Hat that has a Line-In and it is exactly what i searched for my project.
* Latest Version of [Raspbian](https://www.raspberrypi.org/downloads/raspbian/)
* Updated Kernel Image to support the DAC+ADC. Get it from the [HiFiBerry-Website](https://www.hifiberry.com/build/documentation/deploying-a-new-linux-kernel-onto-a-raspbian-based-system/)
* [snapcast](https://github.com/badaix/snapcast): snapserver and snapclient

### Other Rooms
* different Versions of Raspberry Pi
* attached Loudspeakers
* Latest Version of [Raspbian](https://www.raspberrypi.org/downloads/raspbian/)
* [snapcast](https://github.com/badaix/snapcast): snapclient

### Mobile Phone
* [snapdroid](https://github.com/badaix/snapdroid) (to control the volumes and groups)

### Streaming-Setup
to start streaming the Line-out of my TV to the network, i set up a small script, one commandline is enough:

     arecord --device=plughw:1,0 --format S16_LE -c2 -r48000 /tmp/snapfifo
     
This command gets a buffer overflow from time to time. As a workaround I wrote this script:

     #!/bin/bash
     while [ true ] ; do
       arecord --device=plughw:1,0 --format S16_LE -c2 -r48000 /tmp/snapfifo
       sleep 1
     done

### Conclusion
It worked! But the network became heavily loaded and sometimes nearly unusable.

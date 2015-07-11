aptcacherng:
  lookup:
    config:
      manage:
        - acng_conf
        - backends_ubuntu
        - backends_debian
        - backends_debvol
#     acng_conf: => see contrib/
      backends_ubuntu:
        contents: |
          http://mirror.switch.ch/ftp/mirror/ubuntu/
          http://ubuntu.fastbull.org/ubuntu/
          ftp://ftp.uni-stuttgart.de/ubuntu/
          http://ftp.halifax.rwth-aachen.de/ubuntu/
          http://ftp.uni-kl.de/pub/linux/ubuntu/
          http://mirror.netcologne.de/ubuntu/
          http://vesta.informatik.rwth-aachen.de/ftp/pub/Linux/ubuntu/ubuntu/
          ftp://ftp.belnet.be/mirror/ubuntu.com/ubuntu/
          http://ubuntu.supp.name/ubuntu/
          http://de.archive.ubuntu.com/ubuntu/
      backends_debian:
        contents: |
          http://ftp.debian.org/debian/
      backends_debvol:
        contents: |
          http://ftp.halifax.rwth-aachen.de/debian-volatile/
          http://ftp.uni-kl.de/debian-volatile/
          http://debian.inode.at/debian-volatile/

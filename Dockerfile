FROM fedora:41

LABEL maintainer="sir.alkurbatov@yandex.ru"

WORKDIR /StarCraftII

RUN dnf install -y \
        libglvnd-devel \
        mesa-dri-drivers \
        mesa-libOSMesa-devel \
        unzip \
        wget \
    && groupadd --system --gid 202 sc2 \
    && useradd --system --gid 202 --no-create-home --uid 202 sc2

RUN wget -q http://blzdistsc2-a.akamaihd.net/Linux/SC2.4.10.zip \
    && unzip -qq -P iagreetotheeula SC2.4.10.zip -d / \
    && chown -R sc2:sc2 /StarCraftII \
    && rm SC2.4.10.zip

RUN mkdir maps \
    && wget -q -O sc2ai_current_map_pool.zip http://archive.sc2ai.net/Maps/CurrentMapPool.zip \
    && unzip -qq sc2ai_current_map_pool.zip -d maps/ \
    && wget -q -O maps/Flat482Spawns.SC2Map https://www.dropbox.com/s/3a0630yhj4xsjuy/Flat482Spawns.SC2Map?dl=1 \
    && wget -q -O sc2ai_micro_ladder.zip https://aiarena.net/wiki/184/plugin/attachments/download/34/ \
    && unzip -qq sc2ai_micro_ladder.zip -d maps/ \
    && rm ./*.zip

RUN dnf remove -y unzip wget \
    && dnf clean all \
    && rm -rf /var/cache/yum

USER sc2

ENTRYPOINT ["./Versions/Base75689/SC2_x64", "-listen", "0.0.0.0"]
CMD ["-port", "8167"]

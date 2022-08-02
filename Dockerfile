FROM fedora:36

LABEL maintainer="sir.alkurbatov@yandex.ru"

WORKDIR /StarCraftII

RUN dnf install -y unzip wget \
    && groupadd --system --gid 202 sc2 \
    && useradd --system --gid 202 --no-create-home --uid 202 sc2

RUN wget -q http://blzdistsc2-a.akamaihd.net/Linux/SC2.4.10.zip \
    && unzip -qq -P iagreetotheeula SC2.4.10.zip -d / \
    && chown -R sc2:sc2 /StarCraftII \
    && rm SC2.4.10.zip

RUN mkdir maps \
    && wget -q -O sc2ai_2022_season3.zip http://archive.sc2ai.net/Maps/CurrentMapPool.zip \
    && unzip -qq sc2ai_2022_season3.zip -d maps/ \
    && rm sc2ai_2022_season3.zip

RUN dnf erase -y unzip wget \
    && dnf clean all \
    && rm -rf /var/cache/yum

USER sc2

ENTRYPOINT ["./Versions/Base75689/SC2_x64", "-listen", "0.0.0.0"]
CMD ["-port", "8167"]

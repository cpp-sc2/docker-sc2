FROM centos:8

WORKDIR /StarCraftII

RUN yum install -y unzip wget

RUN wget -q 'http://blzdistsc2-a.akamaihd.net/Linux/SC2.4.10.zip' \
    && unzip -qq -P iagreetotheeula SC2.4.10.zip -d / \
    && rm SC2.4.10.zip

RUN mkdir /StarCraftII/maps
RUN wget -q "https://drive.google.com/uc?export=download&id=1OzKPcqPaqLFmSzt5I7QcNCuIwnoSKCr2" -O 2020S2LadderMaps.zip \
    && unzip -qq 2020S2LadderMaps.zip -d /StarCraftII/maps/2020S2 \
    && rm 2020S2LadderMaps.zip

EXPOSE 8167

ENTRYPOINT ["./Versions/Base75689/SC2_x64", "-listen", "0.0.0.0", "-port", "8167"]

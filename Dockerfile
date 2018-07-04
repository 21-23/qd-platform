FROM 26e7fa25871d

COPY ./services ./
COPY ./Hexfile.yml .

CMD ["./hex-exe"]
